package com.xingda.work.controller;

import com.taobao.api.ApiException;
import com.xingda.exception.FileException;
import com.xingda.utils.DingTalkUtil;
import com.xingda.utils.PhotoUtil;
import com.xingda.utils.StringUtil;
import com.xingda.utils.SystemPage;
import com.xingda.work.domain.*;
import com.xingda.work.service.CustomerService;
import com.xingda.work.service.OrderImgService;
import com.xingda.work.service.OrdersService;
import com.xingda.work.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/genergy")
public class WorkOrderController {

    @Autowired
    WorkService workService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    CustomerService customerService;
    @Autowired
    OrderImgService orderImgService;


    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public String addOrder(int workId, Model model) {
        Orders order = ordersService.selectByStatus(workId,(byte)1);
        model.addAttribute("workId", workId);
        if(order == null) {
            return "addOrder1";
        }else{
            model.addAttribute("order",order);
            return "addOrder2";
        }
    }

    @RequestMapping(value = "/addOrder1", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder(Orders orders, String images) {
        orders.setTime1(new Date());
        orders.setStatus((byte)1);
        ordersService.insert(orders);
        if(StringUtil.isNotEmpty(images)) {
            String[] imgUpload = images.split(",");
            for (String img : imgUpload) {
                orderImgService.insert(new OrderImg(orders.getId(), img));
            }
        }
        workService.updateStatus(orders.getType(), orders.getWorkId());
        return 0;
    }

    @RequestMapping(value = "/addOrder2", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder2(Orders orders, String images) {

        orders.setTime2(new Date());
        orders.setStatus((byte)2);
        ordersService.update(orders);
        if(StringUtil.isNotEmpty(images)) {
            String[] imgUpload = images.split(",");
            for (String img : imgUpload) {
                orderImgService.insert(new OrderImg(orders.getId(), img));
            }
        }
        workService.updateStatus(orders.getType(), orders.getWorkId());
        return 0;
    }

    @RequestMapping(value = "/addImg", method = RequestMethod.POST)
    @ResponseBody
    public Object addImg(@RequestParam(value = "file", required = false) MultipartFile file,
                           HttpServletRequest req) throws IOException, FileException {
        String imgPath = "";
        if (file != null) {
            String servletContext = req.getSession().getServletContext().getRealPath("/");
            imgPath = PhotoUtil.photoUpload(file, "static/images/work/", StringUtil.makeFileName()
                    , servletContext);
        }
        Map<String,String> map = new HashMap<>();
        map.put("imgPath",imgPath);
        return map;
    }

    @RequestMapping(value = "/addWork", method = RequestMethod.GET)
    public String addWrok(Integer id, Model model) {
        if (id != null) {
            Work work = workService.selectById(id);
            model.addAttribute("work", work);
        }
        return "addWork";
    }

    @RequestMapping(value = "/addWork", method = RequestMethod.POST)
    @ResponseBody
    public Object addWrok(Work work, String code, HttpServletRequest request) {

        try {
/*            if (file != null) {
                String servletContext = req.getSession().getServletContext().getRealPath("/");
                String imgPath = PhotoUtil.photoUpload(file, "static/images/work/", StringUtil.makeFileName()
                        , servletContext);
                String context = req.getSession().getServletContext().getRealPath("/");
            }*/
            UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
            work.setUserId(userDetail.getId());
            work.setUserName(userDetail.getName());
            work.setCreateTime(new Date());
            work.setStatus((byte) 0);
            int id = workService.insert(work);
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @RequestMapping(value = "getOrder", method = RequestMethod.GET)
    public String getOrder(Model model, int workId) {
        List<Orders> list = ordersService.selectAll(workId);
        for(Orders order : list){
            order.setImgList(orderImgService.selectAll(order.getId()));
        }
        model.addAttribute("orders", list);
        return "order";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.GET)
    public String getWork(Model model, String x,String y,HttpServletRequest request) throws ApiException {
        request.getSession().setAttribute("x",x);
        request.getSession().setAttribute("y",y);
        model.addAttribute("config", DingTalkUtil.getConfig(request));
        return "work";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.POST)
    @ResponseBody
    public SystemPage getWork(String userId, String userName, HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        List list = workService.selectAll(userId, userName);
        if(userDetail != null && !userDetail.isAdmin()){
            list = workService.selectAll(userDetail.getId(), userDetail.getName());
        }
        SystemPage page = new SystemPage(list.size(), list);
        return page;
    }

    @RequestMapping(value = "getCustomer", method = RequestMethod.POST)
    @ResponseBody
    public List getCustomer(String name) {
        List list = customerService.selectByName(name);
        return list;
    }

    @RequestMapping(value = "addCustomer", method = RequestMethod.POST)
    @ResponseBody
    public Object addCustomer(Customer customer, HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        if(userDetail != null){
            customer.setUserId(userDetail.getId());
        }
        return customerService.insert(customer);
    }



}

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
        Orders order = ordersService.selectByStatus(workId, (byte) 1);
        model.addAttribute("workId", workId);
        if (order == null) {
            return "addOrder1";
        } else {
            model.addAttribute("order", order);
            return "addOrder2";
        }
    }

    @RequestMapping(value = "/addOrder1", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder(Orders orders, String images) {
        Customer customer = customerService.selectOne(orders.getCustomerName());
        if (customer == null) {
            return 1;
        }
        orders.setTime1(new Date());
        orders.setStatus((byte) 1);
        ordersService.insert(orders);
        if (StringUtil.isNotEmpty(images)) {
            String[] imgUpload = images.split(",");
            for (String img : imgUpload) {
                orderImgService.insert(new OrderImg(orders.getId(), img));
            }
        }
        customer.setStatus(orders.getType());
        customer.setVisit(customer.getVisit() + 1);
        customerService.update(customer);
        workService.updateStatus(orders.getType(), orders.getWorkId());
        return 0;
    }

    @RequestMapping(value = "/addOrder2", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder2(Orders orders, String images) {

        orders.setTime2(new Date());
        orders.setStatus((byte) 2);
        orders.setTimeDiff(orders.getTime2().getTime() - orders.getTime1().getTime());
        ordersService.update(orders);
        if (StringUtil.isNotEmpty(images)) {
            String[] imgUpload = images.split(",");
            for (String img : imgUpload) {
                orderImgService.insert(new OrderImg(orders.getId(), img));
            }
        }
        workService.updateStatus(orders.getType(), orders.getWorkId());
        return 0;
    }

    @RequestMapping(value = "/finishWork", method = RequestMethod.POST)
    @ResponseBody
    public Object finishWork(int workId, HttpServletRequest request) {
        Orders orders = new Orders();
        orders.setStatus((byte) 3);
        orders.setCustomerName("回到公司");
        orders.setWorkId(workId);
        orders.setLon1(request.getSession().getAttribute("x").toString());
        orders.setLat1(request.getSession().getAttribute("y").toString());
        orders.setTime1(new Date());
        ordersService.insert(orders);
        List<Orders> ordersList = ordersService.selectAll(workId);
        Orders orders1 = ordersList.get(0);
        Orders orders2 = ordersList.get(ordersList.size() - 1);
        long road =  ordersList.get(1).getTime1().getTime() - orders1.getTime1().getTime();
        for (int i = 2;i<ordersList.size() - 1; i++) {
            if(ordersList.get(i-1).getTime2() == null){
                continue;
            }
            road += ordersList.get(i).getTime1().getTime() - ordersList.get(i-1).getTime2().getTime();
        }
        long total = orders2.getTime1().getTime() - orders1.getTime1().getTime();
        long average = total / (ordersList.size() - 1);
        Work work = new Work();
        work.setId(workId);
        work.setStatus((byte)2);
        work.setAverage(average);
        work.setTotal(total);
        work.setRoad(road);
        workService.update(work);
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
        Map<String, String> map = new HashMap<>();
        map.put("imgPath", imgPath);
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
    public Object addWrok(Work work, HttpServletRequest request) {

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
            Orders orders = new Orders();
            orders.setStatus((byte) 0);
            orders.setCustomerName("公司出发");
            orders.setWorkId(id);
            orders.setLon1(request.getSession().getAttribute("x").toString());
            orders.setLat1(request.getSession().getAttribute("y").toString());
            orders.setTime1(new Date());
            ordersService.insert(orders);
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @RequestMapping(value = "getOrder", method = RequestMethod.GET)
    public String getOrder(Model model, int workId) {
        List<Orders> list = ordersService.selectAll(workId);
        for (Orders order : list) {
            order.setImgList(orderImgService.selectAll(order.getId()));
        }
        model.addAttribute("orders", list);
        return "order";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.GET)
    public String getWork(Model model,String userId, String x, String y, HttpServletRequest request) throws ApiException {
        if(StringUtil.isNotEmpty(x) && StringUtil.isNotEmpty(y)) {
            request.getSession().setAttribute("x", x);
            request.getSession().setAttribute("y", y);
        }
        model.addAttribute("userId",userId);
        model.addAttribute("config", DingTalkUtil.getConfig(request));
        return "work";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.POST)
    @ResponseBody
    public SystemPage getWork(String userId, String userName, int start, int pageSize, HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        List list = workService.selectPage(userId, userName, start, pageSize);
        if (userDetail != null && !userDetail.isAdmin()) {
            list = workService.selectPage(userDetail.getId(), userDetail.getName(), start, pageSize);
        }
        SystemPage page = new SystemPage(list.size(), list);
        return page;
    }

    @RequestMapping(value = "getOrders",method = RequestMethod.POST)
    @ResponseBody
    public SystemPage getOrders(String customerName,int start,int pageSize){
        List list = ordersService.selectPage(customerName,start,pageSize);
        SystemPage systemPage = new SystemPage(list.size(),list);
        return systemPage;
    }

    @RequestMapping(value = "getOrders",method = RequestMethod.GET)
    public String getOrders(String customerName,Model model){
        model.addAttribute("customerName",customerName);
        return "orders";
    }

}

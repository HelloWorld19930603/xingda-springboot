package com.xingda.work.controller;

import com.xingda.exception.FileException;
import com.xingda.utils.PhotoUtil;
import com.xingda.utils.StringUtil;
import com.xingda.utils.SystemPage;
import com.xingda.work.domain.Customer;
import com.xingda.work.domain.Orders;
import com.xingda.work.domain.User;
import com.xingda.work.domain.Work;
import com.xingda.work.service.CustomerService;
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
import java.util.List;

@Controller
@RequestMapping("/genergy")
public class WorkOrderController {

    @Autowired
    WorkService workService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    CustomerService customerService;


    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public String addOrder(int workId, Model model) {
        model.addAttribute("workId", workId);
        return "addOrder";
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder(Orders orders, int mark, @RequestParam(value = "file", required = false) MultipartFile file,
                           HttpServletRequest req) throws IOException, FileException {
        if (file != null) {
            String servletContext = req.getSession().getServletContext().getRealPath("/");
            String imgPath = PhotoUtil.photoUpload(file, "static/images/work/", StringUtil.makeFileName()
                    , servletContext);
            orders.setImg(imgPath);
        }
        orders.setTime(new Date());
        ordersService.insert(orders);
        if (mark == 0) {
            workService.updateStatus(1, orders.getWorkId());
        } else {
            workService.updateStatus(2, orders.getWorkId());
        }
        return 0;
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
            User user = (User) request.getSession().getAttribute("user");
            work.setUserId(user.getId());
            work.setUserName(user.getName());
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
        List list = ordersService.selectAll(workId);
        model.addAttribute("orders", list);
        return "order";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.GET)
    public String getWork() {

        return "work";
    }

    @RequestMapping(value = "getWork", method = RequestMethod.POST)
    @ResponseBody
    public SystemPage getWork(Integer userId, String userName, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List list = workService.selectAll(userId, userName);
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
        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            customer.setUserId(user.getId());
        }
        return customerService.insert(customer);
    }
}

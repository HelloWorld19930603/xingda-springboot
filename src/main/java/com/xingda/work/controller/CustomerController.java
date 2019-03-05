package com.xingda.work.controller;

import com.xingda.utils.SystemPage;
import com.xingda.work.domain.Customer;
import com.xingda.work.domain.Orders;
import com.xingda.work.domain.UserDetail;
import com.xingda.work.service.CustomerService;
import com.xingda.work.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping({"genergy"})
public class CustomerController {
    @Autowired
    CustomerService customerService;
    @Autowired
    OrdersService ordersService;

    public CustomerController() {
    }

    @RequestMapping(
            value = {"getCustomer"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public List getCustomer(String name, String userName, HttpServletRequest request) {
        String userId = null;
        UserDetail userDetail = (UserDetail)request.getSession().getAttribute("userDetail");
        if (userDetail != null && !userDetail.isAdmin()) {
            userId = userDetail.getId();
        }

        List list = this.customerService.selectByName(name, userName, userId);
        return list;
    }

    @RequestMapping(
            value = {"getCustomerPage"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public SystemPage getCustomerPage(String name, String userName, int start, int pageSize, HttpServletRequest request) {
        String userId = null;
        UserDetail userDetail = (UserDetail)request.getSession().getAttribute("userDetail");
        if (userDetail != null && !userDetail.isAdmin()) {
            userId = userDetail.getId();
        }

        List list = this.customerService.selectPage(name, userName, userId, start, pageSize);
        SystemPage systemPage = new SystemPage(list.size(), list);
        return systemPage;
    }

    @RequestMapping(
            value = {"addCustomer"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object addCustomer(Customer customer, HttpServletRequest request) {
        UserDetail userDetail = (UserDetail)request.getSession().getAttribute("userDetail");
        if (userDetail != null) {
            customer.setUserId(userDetail.getId());
            customer.setUserName(userDetail.getName());
        }

        customer.setTime(new Date());
        this.customerService.insert(customer);
        return 0;
    }

    @RequestMapping(
            value = {"customer"},
            method = {RequestMethod.GET}
    )
    public String getCustomer() {
        return "customer";
    }

    @RequestMapping(
            value = {"statistics"},
            method = {RequestMethod.GET}
    )
    public String statistics(String customerName, Model model) {
        model.addAttribute("customerName", customerName);
        return "statistics";
    }

    @RequestMapping(
            value = {"selectForTime"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object selectForTime(String customerName) {
        List<Orders> list = this.ordersService.selectForTime(customerName);
        return list;
    }
}

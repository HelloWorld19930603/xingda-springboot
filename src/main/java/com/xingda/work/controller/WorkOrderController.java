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
import java.util.*;

@Controller
@RequestMapping({"/genergy"})
public class WorkOrderController {
    @Autowired
    WorkService workService;
    @Autowired
    OrdersService ordersService;
    @Autowired
    CustomerService customerService;
    @Autowired
    OrderImgService orderImgService;

    public WorkOrderController() {
    }

    @RequestMapping(
            value = {"/addOrder"},
            method = {RequestMethod.GET}
    )
    public String addOrder(int workId, Model model) {
        Orders order = this.ordersService.selectByStatus(workId, (byte) 1);
        model.addAttribute("workId", workId);
        if (order == null) {
            return "addOrder1";
        } else {
            model.addAttribute("order", order);
            return "addOrder2";
        }
    }

    @RequestMapping(
            value = {"/addOrder1"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object addOrder(Orders orders, String images) {
        Customer customer = this.customerService.selectOne(orders.getCustomerName());
        if (customer == null) {
            return 1;
        } else {
            orders.setTime1(new Date());
            orders.setStatus((byte) 1);
            this.ordersService.insert(orders);
            if (StringUtil.isNotEmpty(images)) {
                String[] imgUpload = images.split(",");
                String[] var5 = imgUpload;
                int var6 = imgUpload.length;

                for (int var7 = 0; var7 < var6; ++var7) {
                    String img = var5[var7];
                    this.orderImgService.insert(new OrderImg(orders.getId(), img));
                }
            }

            customer.setStatus(orders.getType());
            customer.setVisit(customer.getVisit() + 1);
            this.customerService.update(customer);
            return 0;
        }
    }

    @RequestMapping(
            value = {"/addOrder2"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object addOrder2(Orders orders, String images) {
        Orders o = this.ordersService.selectById(orders.getId());
        orders.setTime2(new Date());
        orders.setStatus((byte) 2);
        orders.setTimeDiff(orders.getTime2().getTime() - o.getTime1().getTime());
        this.ordersService.update(orders);
        if (StringUtil.isNotEmpty(images)) {
            String[] imgUpload = images.split(",");
            String[] var5 = imgUpload;
            int var6 = imgUpload.length;

            for (int var7 = 0; var7 < var6; ++var7) {
                String img = var5[var7];
                this.orderImgService.insert(new OrderImg(orders.getId(), img));
            }
        }

        return 0;
    }

    @RequestMapping(
            value = {"/finishWork"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object finishWork(int workId, HttpServletRequest request) {
        Orders orders = new Orders();
        orders.setStatus((byte) 3);
        orders.setCustomerName("回到公司");
        orders.setWorkId(workId);
        orders.setLon1(request.getSession().getAttribute("x").toString());
        orders.setLat1(request.getSession().getAttribute("y").toString());
        orders.setTime1(new Date());
        this.ordersService.insert(orders);
        List<Orders> ordersList = this.ordersService.selectAll(workId);
        Orders orders1 = (Orders) ordersList.get(0);
        Orders orders2 = (Orders) ordersList.get(ordersList.size() - 1);
        long road = ((Orders) ordersList.get(1)).getTime1().getTime() - orders1.getTime1().getTime();

        for (int i = 2; i < ordersList.size() - 1; ++i) {
            if (((Orders) ordersList.get(i - 1)).getTime2() != null) {
                road += ((Orders) ordersList.get(i)).getTime1().getTime() - ((Orders) ordersList.get(i - 1)).getTime2().getTime();
            }
        }

        long total = orders2.getTime1().getTime() - orders1.getTime1().getTime();
        long average = total / (long) (ordersList.size() - 1);
        Work work = new Work();
        work.setId(workId);
        work.setStatus((byte) 2);
        work.setAverage(average);
        work.setTotal(total);
        work.setRoad(road);
        this.workService.update(work);
        return 0;
    }

    @RequestMapping(
            value = {"/addImg"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object addImg(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest req) throws IOException, FileException {
        String imgPath = "";
        if (file != null) {
            String servletContext = req.getSession().getServletContext().getRealPath("/");
            imgPath = PhotoUtil.photoUpload(file, "static/images/work/", StringUtil.makeFileName(), servletContext);
        }

        Map<String, String> map = new HashMap();
        map.put("imgPath", imgPath);
        return map;
    }

    @RequestMapping(
            value = {"/addWork"},
            method = {RequestMethod.GET}
    )
    public String addWrok(Integer id, Model model) {
        if (id != null) {
            Work work = this.workService.selectById(id);
            model.addAttribute("work", work);
        }

        return "addWork";
    }

    @RequestMapping(value = {"/addWork"}, method = {RequestMethod.POST})
    @ResponseBody
    public Object addWrok(Work work, HttpServletRequest request) {
        try {
            UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
            work.setUserId(userDetail.getId());
            work.setUserName(userDetail.getName());
            work.setCreateTime(new Date());
            work.setStatus((byte) 1);
            this.workService.insert(work);
            Orders orders = new Orders();
            orders.setStatus((byte) 0);
            orders.setCustomerName("公司出发");
            orders.setWorkId(work.getId());
            Object x = request.getSession().getAttribute("x");
            Object y = request.getSession().getAttribute("y");
            if (x == null) {
                x = "120.0338998084";
            }

            if (y == null) {
                y = "30.2942522489";
            }

            orders.setLon1(x.toString());
            orders.setLat1(y.toString());
            orders.setTime1(new Date());
            this.ordersService.insert(orders);
            return work.getId();
        } catch (Exception var7) {
            var7.printStackTrace();
            return -1;
        }
    }

    @RequestMapping(value = {"getOrder"},method = {RequestMethod.GET})
    public String getOrder(Model model, int workId) {
        List<Orders> list = this.ordersService.selectAll(workId);
        int i = 0;

        for (Iterator var5 = list.iterator(); var5.hasNext(); ++i) {
            Orders order = (Orders) var5.next();
            order.setImgList(this.orderImgService.selectAll(order.getId()));
            Orders orders1;
            if (i == 1) {
                orders1 = (Orders) list.get(0);
                if (orders1.getTime1() != null && order.getTime1() != null) {
                    order.setTimeDiff2(order.getTime1().getTime() - orders1.getTime1().getTime());
                }
            } else if (i > 1) {
                orders1 = (Orders) list.get(i - 1);
                if (order.getStatus() != 3 && orders1.getTime2() != null && order.getTime1() != null) {
                    order.setTimeDiff2(order.getTime1().getTime() - orders1.getTime2().getTime());
                } else if (orders1.getTime2() != null && order.getTime1() != null) {
                    order.setTimeDiff2(order.getTime1().getTime() - orders1.getTime2().getTime());
                }
            }
        }

        model.addAttribute("orders", list);
        return "order";
    }

    @RequestMapping(
            value = {"getWork"},
            method = {RequestMethod.GET}
    )
    public String getWork(Model model, String userId, String x, String y, HttpServletRequest request) throws ApiException {
        if (StringUtil.isNotEmpty(x) && StringUtil.isNotEmpty(y)) {
            request.getSession().setAttribute("x", x);
            request.getSession().setAttribute("y", y);
        }

        model.addAttribute("userId", userId);
        model.addAttribute("config", DingTalkUtil.getConfig(request));
        return "work";
    }

    @RequestMapping(value = {"getWork"}, method = {RequestMethod.POST})
    @ResponseBody
    public SystemPage getWork(String userId, String userName, int start, int pageSize, HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        List list = this.workService.selectPage(userId, userName, start, pageSize);
        if (userDetail != null && !userDetail.isAdmin()) {
            list = this.workService.selectPage(userDetail.getId(), userDetail.getName(), start, pageSize);
        }

        SystemPage page = new SystemPage(list.size(), list);
        return page;
    }

    @RequestMapping(
            value = {"getOrders"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public SystemPage getOrders(String customerName, int start, int pageSize) {
        List list = this.ordersService.selectPage(customerName, start, pageSize);
        SystemPage systemPage = new SystemPage(list.size(), list);
        return systemPage;
    }

    @RequestMapping(
            value = {"getOrders"},
            method = {RequestMethod.GET}
    )
    public String getOrders(String customerName, Model model) {
        model.addAttribute("customerName", customerName);
        return "orders";
    }
}

package com.xingda.maintenance.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xingda.utils.SqlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("data")
public class DataController {

    @Autowired
    SqlUtils sqlUtil;

    @RequestMapping("hello1")
    @ResponseBody
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String remark = req.getParameter("remark");
        if (remark == null) {
            remark = "";
        }
        String sql = "select * from info where id = (select max(id) from info where name like '%" + remark + "%' or product like '%" +
                remark + "%' or project like '%" + remark + "%')";
        JSONArray jsonArray = sqlUtil.search(sql);
        resp.getWriter().print(jsonArray);
    }

    @RequestMapping("hello2")
    @ResponseBody
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        req.setCharacterEncoding("UTF-8");
        String remark = req.getParameter("remark");
        if (remark == null) {
            remark = "";
        }
        String sql = "select * from info where id = (select max(id) from info where name like '%" + remark + "%' or product like '%" +
                remark + "%' or project like '%" + remark + "%')";
        JSONArray jsonArray = sqlUtil.search(sql);
        JSONObject jsonObject = (JSONObject) jsonArray.get(0);

        req.setAttribute("info", jsonObject);
        resp.getWriter().print(jsonObject);
    }


    @RequestMapping("views")
    public String views(){
        return "cart";
    }
}

package com.xingda.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.xingda.utils.DingTalkUtil;
import com.xingda.utils.StringUtil;
import com.xingda.work.domain.UserDetail;
import com.xingda.work.service.UserService;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Component
public class LoginHandlerInterceptor implements HandlerInterceptor {

    public static final String COOKIE_NAME = "TT_TOKEN";

    @Resource
    UserService userService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        //System.out.println("---------- hello --------");
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        if(userDetail == null){
            String code = (String) request.getAttribute("code");
            if(code == null){
                code = request.getParameter("code");
            }
            if(StringUtil.isNotEmpty(code)){
                String u = DingTalkUtil.getUser(code);
                JSONObject jsonObject = JSONObject.parseObject(u);
                String userId = jsonObject.getString("userid");
                userDetail = userService.getUserById(userId);
                if(userDetail == null) {
                    userDetail = new UserDetail();
                    userDetail.setId(jsonObject.getString("userid"));
                    userDetail.setEmail(jsonObject.getString("email"));
                    userDetail.setName(jsonObject.getString("name"));
                    userDetail.setPhone(jsonObject.getString("mobile"));
                    userDetail.setPosition(jsonObject.getString("position"));
                    userDetail.setWorkPlace(jsonObject.getString("workPlace"));
                    userDetail.setAdmin(jsonObject.getBooleanValue("isAdmin"));
                    userDetail.setBoss(jsonObject.getBooleanValue("isBoss"));
                    userDetail.setHiredDate(new Date(jsonObject.getLongValue("hiredDate")));
                    userDetail.setDepartment(jsonObject.getString("department"));
                    userDetail.setAvatar(jsonObject.getString("avatar"));
                    userService.insert(userDetail);
                }
                request.getSession().setAttribute("user", userDetail);
                request.getSession().setAttribute("userId", userDetail.getId());
                //request.getSession().setAttribute("ddUser",jsonObject);
                System.out.println("身份验证成功");
            }else{
                System.out.println("The code is null...");
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                Exception ex) throws Exception {
    }

}


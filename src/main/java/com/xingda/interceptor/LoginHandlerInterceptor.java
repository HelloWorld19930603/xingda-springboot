package com.xingda.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.xingda.utils.DingTalkUtil;
import com.xingda.work.domain.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginHandlerInterceptor implements HandlerInterceptor {

    public static final String COOKIE_NAME = "TT_TOKEN";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("---------- hello --------");
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            String code = (String) request.getAttribute("code");
            if(code == null){
                code = request.getParameter("code");
            }
            if(code != null){
                String u = DingTalkUtil.getUser(code);
                JSONObject jsonObject = JSONObject.parseObject(u);
                user = new User();
                user.setId( jsonObject.getString("userid"));
                user.setEmail(jsonObject.getString("email"));
                user.setName(jsonObject.getString("name"));
                user.setPhone(jsonObject.getString("mobile"));
                user.setPosition(jsonObject.getString("position"));
                user.setWorkPlace(jsonObject.getString("workPlace"));
                user.setAdmin(jsonObject.getBooleanValue("isAdmin"));
                request.getSession().setAttribute("user",user);
                System.out.println("The code is "+code);
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


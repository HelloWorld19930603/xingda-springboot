package com.xingda.utils;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiGettokenRequest;
import com.dingtalk.api.request.OapiUserGetRequest;
import com.dingtalk.api.request.OapiUserGetuserinfoRequest;
import com.dingtalk.api.response.OapiGettokenResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.dingtalk.api.response.OapiUserGetuserinfoResponse;
import com.taobao.api.ApiException;

public class DingTalkUtil {

    private static String APP_KEY = "dingx3hyrvsxdpm3mywb";
    private static String APP_SECRET = "V2qTSepMlfkDoDEHZ6WhAYEh0PcdK5NL7v_qEWz9vQjX1bYpxBxwye9Q_beCeq1j";


    public static void main(String[] args) throws ApiException {
        //System.out.println(getUserId("1565395ca4f9361bbfb1d65aac579edf"));
        System.out.println(getAccessToken());
    }

    //1565395ca4f9361bbfb1d65aac579edf
    public static String getUserId(String requestAuthCode) throws ApiException {
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/getuserinfo");
        OapiUserGetuserinfoRequest request = new OapiUserGetuserinfoRequest();
        request.setCode(requestAuthCode);
        request.setHttpMethod("GET");
        OapiUserGetuserinfoResponse response = client.execute(request, getAccessToken() );
        String userId = response.getUserid();
        System.out.println(userId);
        return userId;
    }

    public static String getAccessToken() throws ApiException {
        DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
        OapiGettokenRequest request = new OapiGettokenRequest();
        request.setAppkey(APP_KEY);
        request.setAppsecret(APP_SECRET);
        request.setHttpMethod("GET");
        OapiGettokenResponse response = client.execute(request);
        String token = response.getAccessToken();
        System.out.println(token);
        return token;
    }

    public static String getUser(String code) throws ApiException {
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
        OapiUserGetRequest request = new OapiUserGetRequest();
        request.setUserid(getUserId(code));
        request.setHttpMethod("GET");
        OapiUserGetResponse response = client.execute(request, getAccessToken());
        System.out.println(response.getBody());
        return response.getBody();
    }


}

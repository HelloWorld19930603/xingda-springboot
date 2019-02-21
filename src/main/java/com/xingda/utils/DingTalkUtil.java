package com.xingda.utils;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiGetJsapiTicketRequest;
import com.dingtalk.api.request.OapiGettokenRequest;
import com.dingtalk.api.request.OapiUserGetRequest;
import com.dingtalk.api.request.OapiUserGetuserinfoRequest;
import com.dingtalk.api.response.OapiGetJsapiTicketResponse;
import com.dingtalk.api.response.OapiGettokenResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.dingtalk.api.response.OapiUserGetuserinfoResponse;
import com.taobao.api.ApiException;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public class DingTalkUtil {

    private static String APP_KEY = "dingx3hyrvsxdpm3mywb";
    private static String APP_SECRET = "V2qTSepMlfkDoDEHZ6WhAYEh0PcdK5NL7v_qEWz9vQjX1bYpxBxwye9Q_beCeq1j";
    private static String AGENT_ID = "227218743";
    private static String CORP_ID = "ding3b3dcea5f0fbedba35c2f4657eb6378f";


    public static void main(String[] args) throws ApiException {
        //System.out.println(getUserId("1565395ca4f9361bbfb1d65aac579edf"));
       // System.out.println(getAccessToken());
        System.out.println(getJsapiTicket());
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


    public static String getJsapiTicket() throws ApiException {

        DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/get_jsapi_ticket");
        OapiGetJsapiTicketRequest req = new OapiGetJsapiTicketRequest();
        req.setTopHttpMethod("GET");
        OapiGetJsapiTicketResponse execute = client.execute(req, getAccessToken());
        System.out.println(execute.getTicket());
        return execute.getTicket();
    }

    public static String sign(String ticket, String nonceStr, long timeStamp, String url) {
        String plain = "jsapi_ticket=" + ticket + "&noncestr=" + nonceStr + "&timestamp=" + timeStamp
                + "&url=" + url;
        try {
            MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
            sha1.reset();
            sha1.update(plain.getBytes("UTF-8"));

            return bytesToHex(sha1.digest());
        } catch (NoSuchAlgorithmException e) {
            e.getMessage();
        } catch (UnsupportedEncodingException e) {
            e.getMessage();
        }
        return null;
    }

    public static String bytesToHex(byte[] src){
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    public static Object getConfig(HttpServletRequest request) throws ApiException {
        String url = request.getRequestURL().toString();
        long timestamp = System.currentTimeMillis();
        String signature = DingTalkUtil.sign(DingTalkUtil.getJsapiTicket(),String.valueOf(timestamp),timestamp,url);
        Map map = new HashMap<String,String>();
        map.put("signature",signature);
        map.put("timeStamp",timestamp);
        map.put("nonceStr",String.valueOf(timestamp));
        map.put("agentId",AGENT_ID);
        map.put("corpId",CORP_ID);
        return map;
    }
}

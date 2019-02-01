package com.xingda.utils;

import java.util.Random;

public class StringUtil {

    public static boolean notNull(String str){
        return str != null && str.length() != 0;
    }

    public static boolean isBlank(String str) {
        int strLen;
        if(str != null && (strLen = str.length()) != 0) {
            for(int i = 0; i < strLen; ++i) {
                if(!Character.isWhitespace(str.charAt(i))) {
                    return false;
                }
            }
            return true;
        } else {
            return true;
        }
    }

    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static boolean isNotBlank(String str) {
        int strLen;
        if(str != null && (strLen = str.length()) != 0) {
            for(int i = 0; i < strLen; ++i) {
                if(!Character.isWhitespace(str.charAt(i))) {
                    return true;
                }
            }
            return false;
        } else {
            return false;
        }
    }

    public static boolean isNotEmpty(String str) {
        return str != null && str.length() > 0;
    }

    public static boolean isNotEmpty(Object str) {
        return str != null && str.toString().length() > 0;
    }

    public static String makeFileName(){
        return "" + new Random().nextInt(1000)+ System.currentTimeMillis();
    }

    public static String toString(Object obj) {
        return obj == null?"":obj.toString();
    }
}

package com.xingda.work.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class OrderImg {

    @TableId(type = IdType.AUTO)
    int id;
    int orderId;
    String img;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public OrderImg(int orderId, String img) {
        this.orderId = orderId;
        this.img = img;
    }

    public OrderImg() {
    }
}

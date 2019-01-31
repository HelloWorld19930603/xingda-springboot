package com.xingda.maintenance.service;

import com.xingda.maintenance.domain.PurchaseInfo;

public interface PurchaseInfoService {

    PurchaseInfo selectOne(String mark);

    void insertOne(PurchaseInfo purchaseInfo);

    int selectCount(String mark);
}

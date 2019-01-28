package com.xingda.maintenance.service;

import com.xingda.maintenance.domain.Info;

public interface InfoService {

    Info selectOne(String mark);

    void insertOne(Info info);

    int selectCount(String mark);
}

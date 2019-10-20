package com.society.computer.serviceImpl;

import com.society.computer.dao.DutyDao;
import com.society.computer.entity.Duty;
import com.society.computer.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DutyServiceImpl implements DutyService {

    @Autowired
    private DutyDao dutyDao;

    @Override
    public List<Duty> findAll() {
        return dutyDao.findAll();
    }
}

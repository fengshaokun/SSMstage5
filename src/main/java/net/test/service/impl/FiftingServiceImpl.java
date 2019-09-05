package net.test.service.impl;

import net.test.mapper.FiftingMapper;
import net.test.pojo.Fifting;
import net.test.service.FiftingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FiftingServiceImpl implements FiftingService {

    @Autowired
    private FiftingMapper fiftingMapper;
    @Override
    public List<Fifting> selectAllF() {
        return fiftingMapper.selectAllF();
    }
}

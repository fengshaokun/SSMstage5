package net.test.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.test.mapper.FiftingMapper;
import net.test.pojo.City;
import net.test.pojo.Fifting;
import net.test.service.FiftingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FiftingServiceImpl implements FiftingService {

    @Autowired
    private FiftingMapper fiftingMapper;
    @Override
    public List<Fifting> selectAllF() {
        return fiftingMapper.selectAllF();
    }

    @Override
    public PageInfo<City> slectAllPage(Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        List<City>list= fiftingMapper.selectAllCity();
        PageInfo<City>pageInfo=new PageInfo<City>(list);
        return pageInfo;
    }
}

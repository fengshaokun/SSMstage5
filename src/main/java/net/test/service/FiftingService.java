package net.test.service;

import com.github.pagehelper.PageInfo;
import net.test.mapper.FiftingMapper;
import net.test.pojo.City;
import net.test.pojo.Fifting;

import java.util.List;

public interface FiftingService {

    List<Fifting> selectAllF();

    PageInfo<City> slectAllPage(Integer pageNum);
}

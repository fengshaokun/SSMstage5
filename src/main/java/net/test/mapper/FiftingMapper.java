package net.test.mapper;

import net.test.pojo.City;
import net.test.pojo.Fifting;

import java.util.List;

public interface FiftingMapper {

    List<Fifting> selectAllF();

    List<City> selectAllCity();

}

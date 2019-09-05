package net.test.mapper;

import java.util.List;

import net.test.dto.ProductQueryDto;
import net.test.pojo.City;
import net.test.pojo.CityDto;
import net.test.pojo.Product;


public interface ProductMapper {

    List<Product> selectSysProduct(ProductQueryDto dto);

    List<Product> selectAllProduct();

    void insertSelective(Product product);

    void updateByPrimaryKeySelective(Product product);

    void deleteByprimaryKey(Long id);


    List<City> selectCityDto(Integer pId);

    List<CityDto> selectAllCityDto();
}

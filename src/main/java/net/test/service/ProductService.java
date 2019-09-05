package net.test.service;

import net.test.dto.ProductQueryDto;
import net.test.pojo.City;
import net.test.pojo.CityDto;
import net.test.pojo.Product;

import java.util.List;

public interface ProductService {

    List<Product> selectAllProduct();

    void addSysProduct(Product product);

    void updateSysProduct(Product product);

    List<Product> selectSysProduct(ProductQueryDto dto);

    void deleteProduct(Long id);

    List<City> selectCityDto(Integer pId);
    List<CityDto> selectAllCityDto();

}

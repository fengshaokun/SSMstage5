package net.test.service.impl;

import net.test.dto.ProductQueryDto;
import net.test.mapper.ProductMapper;
import net.test.pojo.City;
import net.test.pojo.CityDto;
import net.test.pojo.Product;
import net.test.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> selectAllProduct() {
        return productMapper.selectAllProduct();
    }

    @Override
    public void addSysProduct(Product product) {

    }

    @Override
    public void updateSysProduct(Product product) {

    }

    @Override
    public List<Product> selectSysProduct(ProductQueryDto dto) {
        return null;
    }

    @Override
    public void deleteProduct(Long id) {
        productMapper.deleteByprimaryKey(id);
    }

    @Override
    public List<City> selectCityDto(Integer pId) {
        return productMapper.selectCityDto(pId);
    }

    @Override
    public List<CityDto> selectAllCityDto() {
        return  productMapper.selectAllCityDto();
    }
}

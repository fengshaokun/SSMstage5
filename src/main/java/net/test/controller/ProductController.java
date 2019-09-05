package net.test.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.test.dto.ProductQueryDto;
import net.test.pojo.City;
import net.test.pojo.CityDto;
import net.test.pojo.Product;
import net.test.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void addCoreProduct(@RequestBody Product product) {

        productService.addSysProduct(product);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateProduct(@RequestBody Product product) {

        productService.updateSysProduct(product);
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<Product> listCoreProduct(@RequestBody ProductQueryDto dto) {
        return productService.selectSysProduct(dto);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String cancelCoreProduct(@RequestBody Long id) {
        productService.deleteProduct(id);
        return "1";
    }

    @RequestMapping(value = "/getAll")
    public String getAll(Map map) {
        List<Product> products = productService.selectAllProduct();
        map.put("product",products);
        return "product";
    }

    @RequestMapping(value = "/test")
    public String test(Map map) {
        List<CityDto>list = productService.selectAllCityDto();
        map.put("city",list);
        return "test";
    }

    @ResponseBody
    @RequestMapping(value = "/getCity")
    public List<City> getCity(@Param("pId") Integer pId) {
        List<City> list=new ArrayList<>();
        if (pId!=0){
         list = productService.selectCityDto(pId);}
        return list;
    }
    @RequestMapping(value = "/addTest")
    public String storeAdd() {
        return "store-add";
    }
    @RequestMapping(value = "/listTest")
    public String listTest() {

        return "store-list";
    }



}

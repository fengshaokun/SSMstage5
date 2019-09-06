package net.test.controller;






import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import net.test.pojo.Fifting;
import net.test.service.FiftingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/fif")
public class FiftingController {
    
    @Autowired
    private FiftingService fiftingService;

    @RequestMapping(value = "/get")
    public String get() {
        return "product";
    }

    @ResponseBody
    @RequestMapping(value = "/getAll" ,method = RequestMethod.POST)
    public List<Fifting> getAll() {
        List<Fifting> fiftings = fiftingService.selectAllF();
        return fiftings;
    }


    @ResponseBody
    @RequestMapping(value = "/getValue" ,method = RequestMethod.POST)
    public List<String> getValue(String pId) {  // pid 为json类型的字符串格式
        List<String>str = new ArrayList<>();
        JSONArray jsonArray =  JSONObject.parseArray(pId); //将字符串格式转为数组格式
       for (int i = 0;i<jsonArray.size();i++){
       JSONObject jsonObject=  jsonArray.getJSONObject(i);//数组变为对象
           String value = (String) jsonObject.get("value");//拿到对象中的value属性
           str.add(value);
       }
        System.out.println(str);
            return str;
    }

}

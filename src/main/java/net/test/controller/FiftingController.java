package net.test.controller;





import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import net.test.pojo.Fifting;
import net.test.service.FiftingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/fif")
public class FiftingController {
    
    @Autowired
    private FiftingService fiftingService;



    @RequestMapping(value = "/getAll")
    public String getAll(Map map) {
        List<Fifting> fiftings = fiftingService.selectAllF();
        map.put("product",fiftings);
        return "product";
    }


    @ResponseBody
    @RequestMapping(value = "/getValue" )
    public void getValue(String pId) {
        JSONArray jsonArray =  JSONObject.parseArray(pId);
       for (int i = 0;i<jsonArray.size();i++){
       JSONObject jsonObject=  jsonArray.getJSONObject(i);
           String value = (String) jsonObject.get("value");
           System.out.println(value);
       }

        System.out.println(pId);

    }

}

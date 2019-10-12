package net.test.controller;






import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.test.pojo.City;
import net.test.pojo.Fifting;
import net.test.pojo.Success;
import net.test.service.FiftingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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
        List<String>str = new ArrayList<String>();
        JSONArray jsonArray =  JSONObject.parseArray(pId); //将字符串格式转为数组格式
       for (int i = 0;i<jsonArray.size();i++){
       JSONObject jsonObject=  jsonArray.getJSONObject(i);//数组变为对象
           String value = (String) jsonObject.get("value");//拿到对象中的value属性
           str.add(value);
       }
        System.out.println(str);
            return str;
    }


    @RequestMapping(value = "success")
    public String getSuc(){
        return "success";
    }

           /*     <p class="t">地铁七号线莫愁湖站</p>
                <p class="d">(D7-TA02标七公区)</p>
                <p class="d">(建邺区,轨道交通工程)</p>*/

    @RequestMapping(value = "/list")
    public String getList(Map map,@RequestParam(required = false,defaultValue = "1") Integer pageNum){


        PageInfo<City>list= fiftingService.slectAllPage(pageNum);
        map.put("list",list);
        return "fenye";
    }

}

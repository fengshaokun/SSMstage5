<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.4.0.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>

<body>

<form onsubmit="return false;" action="__SELF__" data-auto="true" method="post"
      class='form-horizontal layui-form' style='padding-top:20px'>
<div class="layui-form-item">
    <!-- 库存类型 -->
    <label class="layui-form-label" for="storeGoodsType">库存类型</label>
    <div class="layui-input-inline">
        <select id="storeGoodsType" name="storeGoodsType" type="mark:store_goods_type" default-value=""
                lay-filter="storeGoodsType" >
                           <c:forEach items="${city}" var="c">                
                                   <option value="${c.pId}">${c.proName}</option>                  
                           </c:forEach>
         </select>
    </div>
    <!-- 库存名称 -->
    <label class="layui-form-label">库存型号</label>
    <div class="layui-input-inline" style="width: 150px">
        <select id="goodsTypeId" name="goodsTypeId" lay-filter="goodsTypeId" ></select>
    </div>
</div>

</form>

    <script>
    layui.use('form', function(){
        var form = layui.form;
        form.on('select(storeGoodsType)', function(data){
            var areaId=data.elem.value;
            alert(areaId)
            $.ajax({
                type: 'POST',
                url: "/product/getCity",
                data: {pId:areaId},
                dataType:  'json',
                success:function(e){
                    console.log(e);
                    var html = "";
                    $("select[name='goodsTypeId']").empty();
                    //empty() 方法从被选元素移除所有内容
                    $(e).each(function (v, k) {
                        html += "<option value='" + k.cityId + "'>" + k.cityName + "</option>";
                    });
                    console.log(html)
                    //把遍历的数据放到select表里面
                    $("select[name='goodsTypeId']").append(html);
                    //从新刷新了一下下拉框
                    form.render('select');      //重新渲染
                }
            });
        });
    });

</script>



</body>
</html>

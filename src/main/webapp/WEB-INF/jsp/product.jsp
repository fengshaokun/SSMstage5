<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.4.0.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <style>
        body{padding: 100px;}
        #text2{padding-bottom: 60px;}
    </style>
</head>
<body>
<div class="container">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>型号</th>
            <th>名称</th>
            <th>设备</th>
        </tr>
        </thead>
        <td>
            <button class="btn-primary-bg" type="submit"> 新增</button>
        </td>
        <tbody>
        <c:forEach items="${product}" var="product">
            <tr>
                <td>${product.type}</td>
                <td>${product.name}</td>
                <td>${product.pair}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="layui-btn-container">
        <button type="button" class="layui-btn" lay-demo="getData">获取右侧数据</button>
        <button type="button" class="layui-btn" lay-demo="reload">重载实例</button>
    </div>
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">职位</label>
            <div class="layui-input-block">
                <div id="text2"></div>
            </div>
        </div>
    </div>

    <div id="text3"></div>
    <script>
        layui.use(['transfer', 'util'], function(){
            var $ = layui.$
                ,transfer = layui.transfer
                ,util = layui.util;

            var ins2 = transfer.render({
                elem: '#text2'
                ,showSearch: true
                ,onchange: function(obj){

                   $.ajax({
                       type: 'GET',
                       url: "/fif/getValue",
                       data: {pId:JSON.stringify(obj)},
                       dataType:  'json',
                       success:function(){

                       }

                   })
                }
                ,parseData: function(res){
                    return {
                        "value":res.value
                        ,"title": res.label
                        ,"disabled": res.disabled
                        ,"checked": res.checked
                    }
                }
                ,data: [

                    <c:forEach items="${product}" var="product">
                    {"value":"${product.pair}" ,"label":"${product.pair}"},
                    </c:forEach>

                    /*{"id": "1", "label": "瓦罐汤"}
                    ,{"id": "2", "label": "油酥饼"}
                    ,{"id": "3", "label": "炸酱面"}
                      }*/
                ]
                ,value: ["1", "5"]
            });
        });

    </script>

</div>


</body>
</html>

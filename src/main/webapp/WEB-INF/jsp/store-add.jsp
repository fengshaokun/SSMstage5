<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.4.0.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>

<body style="background-color: #ffffff">
<div class="cog-main">
    <form class="layui-form" lay-filter="submit-form" style="display: block">
        <div class="site-title">
            <fieldset>
                <legend><a name="use">入库页面</a></legend>
            </fieldset>
        </div>
        <!--所选设备型号信息部分-->
        <input type="hidden" name="storeInfoId" th:value="${storeInfoId}" autocomplete="off"
               class="layui-input">


        <div class="layui-form-item">
            <!-- 库存类型 -->
            <label class="layui-form-label" for="storeGoodsType">库存类型</label>
            <div class="layui-input-inline">
                <select id="storeGoodsType" name="storeGoodsType" type="mark:store_goods_type" default-value=""
                        lay-filter="storeGoodsType"></select>
            </div>
            <!-- 库存名称 -->
            <label class="layui-form-label">库存型号</label>
            <div class="layui-input-inline" style="width: 150px">
                <select id="goodsTypeId" name="goodsTypeId" lay-filter="goodsTypeId" ></select>
            </div>
        </div>

        <!-- 入库数量 -->
        <div class="layui-form-item">
            <label class="layui-form-label">经办数量</label>
            <div class="layui-input-inline">
                <input type="number" name="operateCount" lay-verify="required|operateCount" lay-reqtext="经办数量是必填项！"
                       placeholder="请输入经办数量" autocomplete="off" class="layui-input">
            </div>
        </div>

        <!-- 经办事由 -->
        <div class="layui-form-item">
            <label class="layui-form-label">经办事由</label>
            <div class="layui-input-block">
                <textarea name="operateReason" lay-verify="required|operateReason" placeholder="请输入经办事由"
                          lay-reqtext="经办事由是必填项！" autocomplete="off" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center; padding: 50px">
            <div class="layui-inline">
                <button lay-submit lay-filter="submit-button" class="layui-btn layui-btn-normal">提交</button>
                <button type="reset" class="layui-btn layui-btn-warm">重置</button>
            </div>
        </div>
    </form>
</div>



</body>
</html>
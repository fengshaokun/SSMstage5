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
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">配件信息</div>
                <div class="layui-card-body">
                    <!-- 表单搜索 -->
                    <div class="table-search-container">
                        <!-- 每一个layui-form-item就是一行，实际应用中大多数用一行就可以，剩余交个浏览器让他自换行 -->
                        <div class="layui-form-item">
                            <form class="layui-form">
                                <!-- 配件型号 -->
                                <div class="layui-inline">
                                    <label class="layui-form-label">配件型号</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="fittingType" lay-verify="" autocomplete="off"
                                               class="layui-input"/>
                                    </div>
                                </div>
                                <!-- 配件名称 -->
                                <div class="layui-inline">
                                    <label class="layui-form-label">配件名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="fittingName" lay-verify="" autocomplete="off"
                                               class="layui-input"/>
                                    </div>
                                </div>
                                <!-- 配对设备 -->
                                <div class="layui-inline">
                                    <label class="layui-form-label">配对设备</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="devicePair" lay-verify="" autocomplete="off"
                                               class="layui-input"/>
                                    </div>
                                </div>
                                <!-- 提交按钮，请不要做任何修改 -->
                                <div class="layui-inline">
                                    <button class="layui-btn layui-btn layui-btn-sm" lay-submit=""
                                            lay-filter="search-form"><i class="layui-icon">&#xe615;</i>查询
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- 表格按钮 id=table-action-buttons 请不要更改 -->
                    <script type="text/html" id="table-action-buttons">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm" select-model="single" lay-event="createFitting"><i
                                    class="layui-icon">&#xe608;</i>新增配件信息
                            </button>
                            <button class="layui-btn layui-btn-sm" select-model="single" lay-event="updateFitting"><i
                                    class="layui-icon">&#xe631;</i>修改配件信息
                            </button>
                            <!--                            <button class="layui-btn layui-btn-sm" select-model="single" lay-event="delFitting"><i-->
                            <!--                                    class="layui-icon">&#xe640;</i>删除配件信息-->
                            <!--                            </button>-->
                        </div>
                    </script>
                    <table id="store-fitting-table" lay-filter="store-fitting-table-filter"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.config({
        base: '/out/static/js/'
    }).use(['layer', 'form', 'jquery', 'table', 'cogRequest', 'common'], function () {
        var $ = layui.jquery,
            form = layui.form,
            cogRequest = layui.cogRequest,
            table = layui.table,
            index = parent.layui.index,
            common = layui.common;

        var tableDataUrl = ctx + "/store/fitting/page";

        /**
         * 数据表格配置渲染
         * */
        common.tableRender(table, "store-fitting-table", tableDataUrl, [[
                {type: 'checkbox', fixed: 'left', id: 'fittingType'},
                {field: "fittingType", title: "配件型号", width: 150},
                {field: "fittingName", title: "配件名称"},
                {field: "devicePair", title: "配对设备", width: 150}
            ]]
        );

        /*
         * 搜索表单点击提交，让表格数据重新加载
         */
        form.on('submit(search-form)', function (data) {
            table.reload("store-fitting-table", {
                url: tableDataUrl,
                where: data.field
            });
            return false;
        });

        /**
         * 按钮点击事件
         * toolbar(test) 中的test 是我们在页面上面那个table的lay-filter值
         * */
        table.on('toolbar(store-fitting-table-filter)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                /**
                 * 新增配件信息页面跳转
                 * */
                case 'createFitting':
                    layer.open({
                        type: 2,
                        title: '新增配件页面',
                        area: ['700px', '600px'],
                        shadeClose: true,
                        content: ctx + "/skipPage/store_store-create-fitting",
                        resize: false,
                        end: function () {
                            table.render({
                                url: tableDataUrl
                            });
                        }
                    });
                    break;

                /**
                 * 修改配件信息页面跳转
                 * */
                case 'updateFitting':
                    var data = checkStatus.data;
                    if (data.length == 1) {
                        layer.open({
                            type: 2,
                            title: '配件信息修改页面',
                            area: ['700px', '630px'],
                            shadeClose: false, //点击遮罩关闭
                            content: ctx + "/skipPage/store_store-update?fittingType=" + data[0].fittingType + "&fittingName=" + data[0].fittingName + "&devicePair=" + data[0].devicePair
                        });
                        break;
                    } else {
                        parent.layer.open({
                            title: '通知：',
                            content: '请选择一种配件进行操作！',
                            time: 4000  //设置自动关闭时间，设置为4秒
                        });
                        break;
                    }
            }
        });
    });


</script>
</body>
</html>
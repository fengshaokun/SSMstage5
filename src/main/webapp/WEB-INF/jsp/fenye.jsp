<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/12 0012
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.css" />
</head>

<body>

<table class="table">
			<tr>
				<th>学号</th>
				<th>姓名</th>
			</tr>
<c:forEach items="${list.list}" var="list" >
				<tr>
					<td>${list.cityId}</td>
					<td>${list.cityName}</td>
				</tr>
</c:forEach>
		</table>
<center>
    <ul class="pagination">

    </ul>
</center>

<script src="/js/jquery-3.4.0.js"></script>
<script src="/js/jqPaginator.js"></script>
<script >
    $(function() {

        var if_fistime = true;
        $(".pagination").jqPaginator({
            //总页数（pageBean）
            totalPages:${list.pages},
            //可见的页数（前段页面可写死）
            visiblePages: 5,
            //当前页（pageBean）
            currentPage: ${list.pageNum},
            first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
            prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
            next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
            last: '<li class="last"><a href="javascript:void(0);">最后一页</a></li>',
            page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
            onPageChange: function(num) {

              //  alert(num)
                if(if_fistime) {
                    if_fistime = false;
                } else {
                    window.location.href = "/fif/list?pageNum=" + num;
                }
            }

        });
    });


</script>
</body>
</html>

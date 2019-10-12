<!DOCTYPE html>
<head>
    <title>扬尘监控详情</title>
    <script src="/js/jquery-3.4.0.js"></script>
    <script src="/layui/layui.js"></script>
</head>
<body>

            <ul class="list" id="list">


            </ul>


<script>
    $(document).ready(function(){
        $.ajax({
            url:"/fif/list",
            dataType:"json",
            type:"Get",
            async:false,
            success:function(data){
                var ul=document.getElementById("list");
                console.log(data)
                for (var i=0;i<data.length;i++){
                    var obj=document.createElement("li");
                    obj.innerHTML=" <a class=\"item\" href=\"#\">\n" +
                        "                        <p class=\"sign\">1</p>\n" +
                        "                        <div class=\"info\">\n" +
                        "                            <p class=\"t\">"+data[i].a+"</p>\n" +
                        "                            <p class=\"d\">"+data[i].b+"</p>\n" +
                        "                            <p class=\"d\">"+data[i].c+"</p>\n" +
                        "                        </div>\n" +
                        "                        <i class=\"icn icn-right\"></i>\n" +
                        "                    </a>";
                     ul.appendChild(obj);
                    console.log(obj)
                }

                }
        })
    })
</script>
</body>
</html>


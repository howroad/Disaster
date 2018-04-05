<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <div id="wrap" class="container-fluid">
        <h3 class="text-center">日志信息</h3>
        <nav class="navbar navbar-default" id="query" role="navigation">
            <div class="row">
                <div class="navbar-header col-md-2"><span class="navbar-brand">日志信息</span></div>
                <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group margin_l20">
                            <label for="start_date">起始日期：</label>
                            <input type="date" id="start_date" class="form-control"/>
                        </div>
                        <div class="form-group margin_l20">
                            <label for="end_date">结束日期：</label>
                            <input type="date" id="end_date" class="form-control"/>
                        </div>
                        <button type="button" class="btn btn-default margin_l20" id="queryolog">查询</button>
                    </form>
                </div>
            </div>
        </nav>
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>日志内容</th>
                    <th>日期</th>
                </tr>
            </thead>
            <tbody id="olog_tbody"></tbody>
        </table>
        <nav class="text-right">
			<ul class="pagination" id="page_nav"></ul>
		</nav>
    </div>
    
    <script type="text/javascript">
	var total_page = 0;
    function show_list(pageNo){
  		var startDate=$("#start_date").val();
  		var endDate=$("#end_date").val();
		$.ajax({
			method:"post",
			url:"/Disaster/ShowOperateLogServlet",
			data:{
				pageNo:pageNo,
				startDate:startDate,
				endDate:endDate
			},
			success:function(msg){
				var ojson = JSON.parse(msg);
				var page_no = ojson.pageNo;
				total_page = ojson.totalPage;
				var olist = ojson.list;
				console.info(olist.length);
				var str = "";
 				for(var i=0;i<olist.length;i++){
					str +="<tr><td>"+olist[i].ologUser.userName+olist[i].ologAction+"</td><td>"+olist[i].ologTime+"</td></tr>";					
				}
				
				$("#olog_tbody").html(str);
				var str2 = "";
				str2 +="<li "+(page_no==1?"class='active'":"")+"><a href='javascript:show_list(1)'>第 1 页</a></li>";
				var temp1 = page_no<=1?1:(page_no-1);
				str2 +="<li "+(page_no==1?"class='disabled'":"")+"><a href='javascript:show_list("+temp1+")'>上一页</a></li>";
				str2 +="<li><a>"+page_no+"</a></li>";
				str2 +="<li><a class='input-group input-group-sm' style='padding:5px 5px'><input type='text' class='form-control' style='width:50px;height:22px' id='jump_input'/></a></li>";
				str2 +="<li><a href='javascript:jump_page()'>跳转</a></li>";
				var temp2 = page_no>=total_page?total_page:(page_no+1);
				str2 +="<li "+(page_no==total_page?"class='disabled'":"")+"><a href='javascript:show_list("+temp2+")'>下一页</a></li>";
				str2 +="<li "+(page_no==total_page?"class='active'":"")+"><a href='javascript:show_list("+total_page+")'>第 "+total_page+" 页</a></li>";
				$("#page_nav").html(str2); 
				console.info(olist);
			}
		});
	}
    
	function jump_page(){
		var page = $("#jump_input").val();
		if(page>=1){
			page=page>total_page?total_page:page;
			show_list(page);
		}
	}
		
	show_list(1);
	
	$("#queryolog").click(function(){
		show_list(1);
	});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	 .pagination{
        float: right;
        margin: 0;
     }
</style>
</head>
<body>
	<div id="wrap" class="container-fluid">
    <h3 class="text-center">药剂/器械一览</h3>
    <nav class="navbar navbar-default" id="query" role="navigation">
        <div class="row">
            <div class="navbar-header col-md-3"><span class="navbar-brand">查询药剂/器械</span></div>
            <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search">
	                <div class="form-group">
	                    <label for="smallclass-name">药剂/器械名称</label>
	                    <input type="text" class="form-control" id="smallclass-name" placeholder="Search">
	                </div>
                    <div class="form-group margin_l20">
                        <label for="all_user">防治类型：</label>
                        <select name="areatype" id="all_user" class="form-control">
                         	<option value="0">请选择</option>
                            <option value="1">虫害</option>
                            <option value="2">病害</option>
                            <option value="3">鼠害</option>
                        </select>
                    </div>
                    <div class="form-group margin_l20">
                        <label for="all_user2">类别：</label>
                        <select name="areatype" id="all_user2" class="form-control">
                         	<option value="0">请选择</option>
                            <option value="1">药剂</option>
                            <option value="2">器械</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-default" id="query-btn" onclick="cj()">查询</button>
                </form>
            </div>
        </div>
    </nav>
    <input type="hidden" value="" id="hid"/>
    <table class="table table-striped table-bordered table-hover" id="my_table">
        <tr>
            <th>名称</th>
            <th>防治类型</th>
            <th>类别</th>
            <th>主要用途</th>
            <th>库存</th>
        </tr>
        <tbody id="tb">
      
        <tbody>
    </table>
	<!-- 分页 -->
	<div class="text-right">
		<nav class="text-center">
		 	<ul class="pagination" id="page_nav"></ul>
		</nav>
	</div>
    <button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加药剂</button>

    <div class="modal fade add" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加药剂/器械</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="medname" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">防治类型</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="meddisaster">
                                    <option value="1">虫害</option>
                                    <option value="2">病害</option>
                                    <option value="3">鼠害</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类别</label>
                            <div class="col-sm-10">
                                <select name="medtype" class="form-control" id="medtype">
                                    <option value="1">药剂</option>
                                    <option value="2">器械</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">主要用途</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="meduse" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">药品数量</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="mednumber" >
                            </div>
                        </div>
                        
                    </form>
                </div>
                <div class="modal-footer">
                   	<button id="btn" type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
			var total_page = 0;
			var page_no = 1;
			function ck(page){
				$.ajax({
					method:"post",
					url:"/Disaster/MedicineServlet",
					data:{"page":page,"medName":$("#smallclass-name").val(),"meddis":$("#all_user").val(),
						"medType":$("#all_user2").val()},
					async:true,
					success:function(value){
						var jsonObj = JSON.parse(value);
						var str = "";
						for(var i = 0;i<jsonObj.list.length;i++){
							str+="<tr index='"+jsonObj.list[i].medId+"'><td>"+jsonObj.list[i].medName+"</td><td>"+(jsonObj.list[i].medDisaster==1?"虫害":(jsonObj.list[i].medDisaster==2?"病害":"鼠害"))+"</td><td>"+(jsonObj.list[i].medType==1?"药剂":"器械")+"</td><td>"+jsonObj.list[i].medUse+"</td><td>"+jsonObj.list[i].medStock+"</td></tr>"
						}
						$("#tb").html(str);
						$("#tb tr").click(addTrColor);
						//分页开始
						page_no = jsonObj.pageNo;
						var page_size = jsonObj.pageSize;
						total_page = jsonObj.totalPage;
						var total_record = jsonObj.totalRecord;
						var str2 = "";
						str2 +="<li "+(page_no==1?"class='active'":"")+"><a href='javascript:ck(1)'>第 1 页</a></li>";
						var temp1 = page_no<=1?1:(page_no-1);
						str2 +="<li "+(page_no==1?"class='disabled'":"")+"><a href='javascript:ck("+temp1+")'>上一页</a></li>";
						str2 +="<li><a>"+page_no+"</a></li>";
						str2 +="<li><a class='input-group input-group-sm' style='padding:5px 5px'><input type='text' class='form-control' style='width:50px;height:22px' id='jump_input'/></a></li>";
						str2 +="<li><a href='javascript:jump_page()'>跳转</a></li>";
						var temp2 = page_no>=total_page?total_page:(page_no+1);
						str2 +="<li "+(page_no==total_page?"class='disabled'":"")+"><a href='javascript:ck("+temp2+")'>下一页</a></li>";
						str2 +="<li "+(page_no==total_page?"class='active'":"")+"><a href='javascript:ck("+total_page+")'>第 "+total_page+" 页</a></li>";
						$("#page_nav").html(str2);
						//分页结束
					}
				})
			}
		    //分页按钮跳转事件
			function jump_page(){
				var page = $("#jump_input").val();
				if(page>=1){
					page=page>total_page?total_page:page;
					ck(page);
				}
			}
			ck(1);
			
			function cj(){
				ck();
			}
			
			$("#btn").click(function(){
				var arr = $(".add input");
				var reg = /^[0-9]+$/;
				for(var i=0;i<arr.length;i++) {
					if(arr.eq(i).val() === "") {
						alert("输入框值不能为空");
						return false;
					}
				}
				if(!reg.test(arr.eq(arr.length-1).val())){
					alert("请输入正确数字");
					return;
				}
				$.ajax({
					method:"post",
					url:"/Disaster/MedicineAddServlet",
					data:{"medname":$("#medname").val(),"meddisaster":$("#meddisaster").val(),"medtype":$("#medtype").val(),
						"meduse":$("#meduse").val(),"mednumber":$("#mednumber").val()},
					async:true,
					success:function(value){
						var jsonObj = JSON.parse(value);
						console.info(jsonObj);
						if(jsonObj){
							alert("添加失败！")
						}else{
							alert("添加成功！")
						}
						$("#myModal").modal('hide');
						ck();
					}
				})
			})
			
		$("#hid").prop("value", "");
		function addTrColor() {
			$("#my_table tr").removeClass("as");
			$(this).addClass("as");
			$("#hid").prop("value", $(this).attr("index"));
		}
		
</script>
</body>
</html>
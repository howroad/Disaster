<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	#query-btn{
		margin-top: 25px;
	}
</style>
</head>
<body>
	<div id="wrap" class="container-fluid">
    <h3 class="text-center">药剂/器械出库管理</h3>
    <nav class="navbar navbar-default" id="query" role="navigation">
        <div class="row">
            <div class="navbar-header col-md-3"><span class="navbar-brand">查询出库记录</span></div>
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
	                <div class="form-group">
	                    <label for="smallclass-name">领用小班</label>
	                    <input type="text" class="form-control" id="smallclass-name" placeholder="Search">
	                </div>
                    <button type="button" class="btn btn-default" id="query-btn2">查询</button>
                </form>
            </div>
        </div>
    </nav>
    <table class="table table-striped table-bordered table-hover" id="my_table">
        <tr>
            <th>日期</th>
            <th>领用小班</th>
            <th>出库人</th>
        </tr>
        <tbody id="tb">
        
        </tbody>
    </table>

    <input type="hidden" value="" id="inp_slog_id"/>
    <div class="row">
        <div class="col-xs-4 col-md-4">
        	<button class="btn btn-default" data-toggle="modal" data-target="#myModal1" id="add_btn">添加出库信息</button>
        	<button class="btn btn-default" id="btn">查看出库信息</button>
        </div>
		<div class="col-xm-5 col-md-5 text-right pull-right">
        	<!-- 分页开始 -->
			<nav class="text-right">
			 	<ul class="pagination" id="page_nav"></ul>
			</nav>
			<!-- 分页结束 -->
        </div>
    </div>
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel1">添加出库信息</h4>
                </div>
                <div class="modal-body">
                <div class="row">
	                <div class="col-sm-12">
		                <form class="form-horizontal" role="form">
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">领用小班</label>
	                            <div class="col-sm-10">
	                                <select name="" class="form-control" id="sel1">
	                                    
	                                </select>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">出库人</label>
	                            <label class="col-sm-2 mylabel text-left" id="lab">${user.userRName}</label>
	                        </div>
	                    </form>
	                    <input type="hidden" value="" id="hid"/>
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                                <th>物品名称</th>
                                <th>防治类型</th>
                                <th>类别</th>
                                <th>领用数量</th>
                            </tr>
                            <tbody id="tb3">
                            
                            </tbody>
                        </table>
	                </div>
                </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3" id="add_med">添加物品</button>
                    <!-- <button type="button" class="btn btn-primary">移除物品</button> -->
                    <button type="button" class="btn btn-primary" id="slogbtn">出库</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel3">领取物品</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                    	<div class="form-group">
                            <div class="sidebar-search">
                                <div class="row">
                                <div class="col-sm-12">
                                	<div class="col-md-6">
					                    <label for="smallclass_name">药剂/器械名称</label>
					                    <input type="text" class="form-control" id="smallclass_name" placeholder="Search">
					                </div>
				                    <div class="col-md-6">
				                        <label for="all_user">防治类型：</label>
				                        <select name="areatype" id="all_user" class="form-control">
				                         	<option value="0">请选择</option>
				                            <option value="1">虫害</option>
				                            <option value="2">病害</option>
				                            <option value="3">鼠害</option>
				                        </select>
				                    </div>
				                    <div class="col-md-6">
				                        <label for="all_user2">类别：</label>
				                        <select name="areatype" id="all_user2" class="form-control">
				                         	<option value="0">请选择</option>
				                            <option value="1">药剂</option>
				                            <option value="2">器械</option>
				                        </select>
				                    </div>
				                    <div class="col-md-6 text-center">
				                    	<button type="button" class="btn btn-default" id="query-btn" onclick="cj()">查询</button>
				                    </div>
                                </div>
                   				</div>
                            </div>
                    	</div>
                    </form>
                     <table class="table table-striped table-bordered table-hover">
                         <tr>
                             <th></th>
                             <th>物品名称</th>
                             <th>防治类型</th>
                             <th>类别</th>
                             <th>主要用途</th>
                         </tr>
                         <tbody id="ty">
                         
                         </tbody>
                     </table>
                     <ul class="pagination" id="uli">
                     </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="getMedBtn">领取</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel2">查看出库信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <span class="col-sm-2 control-label">领用小班</span>
                            <span class="col-sm-3 mylabel text-left" id="span1"></span>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">出库人</span>
                            <span class="col-sm-3 mylabel text-left" id="span2"></span>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">领用日期</span>
                            <span class="col-sm-3 mylabel text-left" id="span3"></span>
                        </div>
                        <div class="row">
                        	<div class="col-sm-12">
                        	<table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th>物品名称</th>
                                    <th>防治类型</th>
                                    <th>类别</th>
                                    <th>领用数量</th>
                                </tr>
                                <tbody id="td">
                                
                                </tbody>
                            </table>
                        	</div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	ck(1);
	function ck(page){
		$.ajax({
			method:"post",
			url:"/Disaster/MedicineStockoutServlet",
			data:{"page":page,"startdate":$("#start_date").val(),"overdate":$("#end_date").val(),
				"classname":$("#smallclass-name").val()},
			async:true,
			success:function(value){
				var jsonObj = JSON.parse(value);
				var str = "";
				for(var i = 0;i<jsonObj.list.length;i++){
					str+="<tr index="+jsonObj.list[i].slogId+"><td>"+jsonObj.list[i].slogDate+"</td><td>"+jsonObj.list[i].slogClass.clsName+"</td><td>"+jsonObj.list[i].slogUser.userRName+"</td></tr>"
				}
				$("#tb").html(str);
				$("#inp_slog_id").prop("value", "");
			    $("#tb tr").click(function(){
					$("#inp_slog_id").val($(this).attr("index"));
					$("#my_table tr").removeClass("as");
					$(this).addClass("as");
				});
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
	
	$("#query-btn2").click(function(){
		ck(1);
	})
	
	$("#btn").click(function(){
	 	if($("#inp_slog_id").val() == null || $("#inp_slog_id").val() == ""){
			alert("请选择需要查看的信息!");
			reture;
		}
		$.ajax({
			method:"post",
			url:"/Disaster/FindMedicineStockLogServlet",
			data:{"inp":$("#inp_slog_id").val()},
			async:true,
			success:function(value){
				var jsonObj = JSON.parse(value);
				$("#span1").html(jsonObj.slogClass.clsName);
				$("#span2").html(jsonObj.slogUser.userRName);
				$("#span3").html(jsonObj.slogDate);
				var str = "";
				for(var i = 0;i<jsonObj.sdtlList.length;i++){
					str+="<tr><td>"+jsonObj.sdtlList[i].sdtlMed.medName+"</td><td>"+(jsonObj.sdtlList[i].medDisaster==1?"虫害":(jsonObj.sdtlList[i].medDisaster==2?"病害":"鼠害"))+"</td><td>"+(jsonObj.sdtlList[i].medType==1?"药剂":"器械")+"</td><td>"+jsonObj.sdtlList[i].sdtlNum+"</td></tr>"
				}
				$("#td").html(str);
				$("#myModal2").modal();
			}
		})
	})
	
	$("#add_btn").click(function(){
		$.ajax({
			methor:"post",
			url:"/Disaster/AddMedicineStockoutServlet",
			data:"",
			async:true,
			success:function(value){
				var jsonObj = JSON.parse(value);
				var str = "";
				for (var i = 0; i < jsonObj.length; i++) {
					str += "<option value='"+jsonObj[i].clsId+"'>"+jsonObj[i].clsName+"</option>";
				}
				$("#sel1").html(str);
/* 				$("#lab").html(${user.userName}); */
			}
		})
	})
	
	var medIdArr = [];
	$("#add_med").click(fenye(1))
	function fenye(page){
		changeArr();
		$.ajax({
			method:"post",
			url:"/Disaster/MedicineServlet",
			data:{"page":page,"medName":$("#smallclass_name").val(),"meddis":$("#all_user").val(),
				"medType":$("#all_user2").val()},
			async:true,
			success:function(value){
				var jsonObj = JSON.parse(value);
				var str = "";
				for(var i = 0;i<jsonObj.list.length;i++){
					str+="<tr><td><input type='checkbox' value='"+jsonObj.list[i].medId+"'></td><td>"+jsonObj.list[i].medName+"</td><td>"+(jsonObj.list[i].medDisaster==1?"虫害":(jsonObj.list[i].medDisaster==2?"病害":"鼠害"))+"</td><td>"+(jsonObj.list[i].medType==1?"药剂":"器械")+"</td><td>"+jsonObj.list[i].medUse+"</td></tr>"
				}
				$("#ty").html(str);
				$(medIdArr).each(function (i,obj) {
					$("#ty input[value='"+obj+"']").prop("checked", true);
				});
				var arr = "";
				for(var i = 1;i <=jsonObj.totalPage;i++){
					arr += "<li><a href='javascript:fenye("+i+")'>"+i+"</a></li>";
				}
				$("#uli").html(arr);
			}
		})
	}
	function changeArr() {
		$("#ty input:checked").each(function (i,obj) {
			medIdArr.push($(this).val());
		});
		$(medIdArr).each(function (i,obj) {
			if($("#ty input[value='"+medIdArr[i]+"']").prop("checked") == false) {
				medIdArr.splice(i,1,0);
			}
		});
	}	
	function cj(){
		fenye(1);
	}
	
	$("#getMedBtn").click(updateTable2);
	function updateTable2() {
		if($("#ty input:checked").length==0) {
			return;
		}
		changeArr();
		$.ajax({
			method:"post",
			url:"/Disaster/SaveMedServlet",
			data:{"arr":medIdArr.toString()},
			async:true,
			success:function(value) {
				var jsonArr = JSON.parse(value);
				var str = "";
				$(jsonArr).each(function (i,obj) {
					str+="<tr index='"+obj.medId+"'><td>"+obj.medName+"</td><td>"+(obj.medDisaster==1?"虫害":(obj.medDisaster==2?"病害":"鼠害"))+"</td><td>"+(obj.medType==1?"药剂":"器械")+"</td><td><input type='text' id='medNum' class='form-control count'></td></tr>";
				});
				$("#myModal3").modal('hide');
				$("#tb3").html(str);
				//给绑定表格2绑定点击事件
				$("#hid").prop("value", "");
				$("#tb3 tr").mouseup(addTrClass);
				function addTrClass() {
					$("#tb3 tr").removeClass("as");
					$(this).addClass("as");
					$("#hid").prop("value", $(this).attr("index"));
				}
				$("#tb3 input").focus(function () {
					$("#tb3 tr").removeClass("as");
					$(this).parent().parent().addClass("as");
					$("#hid").prop("value", $(this).parent().parent().attr("index"));
				});
				//给领用数量框绑定事件
				$(".count").blur(updateCount);
				$(".count").keydown(function (event) {
					if(event.keyCode == 13) {
						updateCount();
					}
				});
			}
		});
	}
	//修改领用数量
	function updateCount() {
		var reg = /^[0-9]+$/;
		if(!reg.test($(".count").val())){
			alert("请输入正确数字");
			return;
		}
		var id = $("#hid").val();
		var goodsCount = $("#tb3 tr[index='"+id+"'] input").val();
		$.ajax({type:"post",url:"/Disaster/UpdateSdtlServlet",data:{"id":id,"goodsCount":goodsCount}});
	}
	
	$("#slogbtn").click(function () {
		var reg = /^[0-9]+$/;
		if(!reg.test($(".count").val())){
			alert("请输入正确数字");
			return;
		}
		$.ajax({
			method:"post",
			url:"/Disaster/AddSlogServlet",
			async:true,
			data:{"classId":$("#sel1").val()},
			success:function(value) {
				if(JSON.parse(value)) {
					alert("添加成功");
					$("#tb3").html();
					$("#myModal1").modal('hide');
					ck(1);
				} else {
					alert("添加失败");
				}
			}
		});
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会商记录</title>
<style type="text/css">
	.modal-dialog{  width: 800px;  }
	.btns button{  width: 38px;  }
	.btns{  right: 8px;  }
</style>
</head>
<body>
<div class="container-fluid" id="wrap">
    <h3 class="text-center">会商灾情</h3>
    <input type="hidden" value="" id="hid"/>
    <table class="table table-bordered table-hover" id="my_table">
        <tr>
            <th>事件名称</th>
            <th>日期</th>
            <th>发生位置</th>
            <th>防治方案</th>
            <th>灾情状况</th>
        </tr>
        <tbody id="tb">
        </tbody>
    </table>
    <div class="row">
        <div class="col-sm-3">
            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                <button type="button" id="consult_disaster" class="btn btn-default">专家会商</button>
            </div>
        </div>
        <div class="col-xm-5 col-md-5 text-right pull-right">
        	<!-- 分页开始 -->
			<nav class="text-center">
			 	<ul class="pagination" id="page_nav"></ul>
			</nav>
			<!-- /分页结束 -->
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">专家会商</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>事件名称：</label>
                            <span id="dlog_name"></span>
                            <br/><br/>
                            <label>时　　间：</label>
                            <span id="dlog_date"></span>
                            <br/><br/>
                            <label>发生位置：</label>
                            <span id="dlog_area"></span>
                            <br/><br/>
                            <label>灾情描述：</label>
                            <span id="dlog_desc"></span>
                            <br/><br/>
                            <label>灾区图片：</label>
                            <img src="" width="150" height="150" id="dlog_pic"/>
                            <br/><br/><br/><br/>
                        </div>
                        <div class="col-sm-6">
                            <label>影响面积：</label>
                            <span id="dlog_influence"></span>
                            <br/><br/>
                            <label>会商人员：</label>
                            <div class="row">
                            	<div class="col-sm-5 pull-left">
	                            	<select name="sel1" id="sel1" size="5" multiple class="form-control" style="width:120px;height:120px">
	                                </select>
                            	</div>
                                <div class="col-sm-1 btns">
	                                <button type="button" class="btn btn-default btn-sm" onclick="move('right')">&gt;</button>
	                                <button type="button" class="btn btn-default btn-sm" onclick="move('rightall')">&gt;&gt;</button>
	                                <button type="button" class="btn btn-default btn-sm" onclick="move('left')">&lt;</button>
	                                <button type="button" class="btn btn-default btn-sm" onclick="move('leftall')">&lt;&lt;</button>
                                </div>
                                <div class="col-sm-5 pull-right">
	                                <select name="sel2" id="sel2" size="5" multiple class="form-control" style="width:120px;height:120px">
	                                </select>
                                </div>
                            </div>
                            <label for="clog_result"></label>
                            <textarea name="clog_result" id="clog_result" class="form-control" rows="5"></textarea>
                            <br/>
                        </div>
                        <div class="text-center">
	                        <button type="button" class="btn btn-default" id="addclogbtn">添加商会信息</button>
	                        <button type="button" id="btn5" class="btn btn-default" data-dismiss="modal">返回</button>
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-bordered table-hover table-striped">
                                <tr>
                                    <th>日期</th>
                                    <th>会商人员</th>
                                    <th>会商结果</th>
                                </tr>
                                <tbody id="tb2">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

<script type="text/javascript">
    var pageNo = 1;
	var pageSize = 5;
	var total_page = 0;
	var page_no = 1;
	/* function init() {
		$(".pagination li").each(function () {
	        if(pageNo===parseInt($(this).text()[0])){
	            $(this).addClass("active");
	        }
	    });
	}
	init(); */
	
	function updateTable(value) {
		var jsonArr = JSON.parse(value);
		var str = "";
		$(jsonArr.list).each(function (i,obj) {
			str+="<tr index="+obj.dlogId+"><td>"+obj.dlogName+"</td><td>"+obj.dlogDate+"</td><td>"+obj.dlogArea.areaName+"</td><td>"+obj.dlogPlan+"</td><td>无法解决，申请专家会商</td></tr>";
		});
		/*
		var liStr = "";
 		for(var i=1;i<=jsonArr.totalPage;i++) {
			liStr+="<li class='page'><a href='javascript:onpage("+i+")''>"+i+"</a></li>"; 
		} */
		$("#tb").html(str);
		$("#tb tr").click(addTrColor);

		/*
		$(".page").remove();
		$(".pagination li").last().before(liStr);  
		*/
		/*init();*/
		//分页开始
		page_no = jsonArr.pageNo;
		var page_size = jsonArr.pageSize;
		total_page = jsonArr.totalPage;
		var total_record = jsonArr.totalRecord;
		var str2 = "";
		str2 +="<li "+(page_no==1?"class='active'":"")+"><a href='javascript:onpage(1)'>第 1 页</a></li>";
		var temp1 = page_no<=1?1:(page_no-1);
		str2 +="<li "+(page_no==1?"class='disabled'":"")+"><a href='javascript:onpage("+temp1+")'>上一页</a></li>";
		str2 +="<li><a>"+page_no+"</a></li>";
		str2 +="<li><a class='input-group input-group-sm' style='padding:5px 5px'><input type='text' class='form-control' style='width:50px;height:22px' id='jump_input'/></a></li>";
		str2 +="<li><a href='javascript:jump_page()'>跳转</a></li>";
		var temp2 = page_no>=total_page?total_page:(page_no+1);
		str2 +="<li "+(page_no==total_page?"class='disabled'":"")+"><a href='javascript:onpage("+temp2+")'>下一页</a></li>";
		str2 +="<li "+(page_no==total_page?"class='active'":"")+"><a href='javascript:onpage("+total_page+")'>第 "+total_page+" 页</a></li>";
		$("#page_nav").html(str2);
		pageNo=page_no;
		//分页结束
	}
    //分页按钮跳转事件
	function jump_page(){
		var page = $("#jump_input").val();
		if(page>=1){
			page=page>total_page?total_page:page;
			pageNo=page;
			findAll();
		}
	}
	function findAll() {
		$.ajax({type:"post",url:"/Disaster/FindDlogByStageServlet",
		data:{"pageNo":pageNo+"","pageSize":pageSize+""},
		success:function(value){
			updateTable(value);
		}});
	}
	findAll();
	
	//跳转
	function onpage(page){
	    pageNo = parseInt(page);
	    findAll();
	} 
	
	$("#hid").prop("value", "");
	$("#tb tr").click(addTrColor);
	function addTrColor() {
		$("#my_table tr").removeClass("as");
		$(this).addClass("as");
		$("#hid").prop("value", $(this).attr("index"));
	}
	
	var pageNo2 = 1;
	$("#consult_disaster").click(function () {
		if($("#hid").val() === "") {
			alert("请选择要查看的内容");
			return;
		}
		updateTable2();
	});
	function updateTable2() {
		$.ajax({type:"post",url:"/Disaster/FindClogServlet",
			data:{"dlogId":$("#hid").val(),"pageNo":pageNo2+""},
			success:function(value){
				var jsonObj = JSON.parse(value);
				$("#dlog_name").html(jsonObj.dlogName);
				$("#dlog_date").html(jsonObj.dlogDate);
				$("#dlog_area").html(jsonObj.dlogArea.areaName);
				$("#dlog_desc").html(jsonObj.dlogDesc);
				$("#dlog_pic").prop("src", "/Disaster/upload/"+jsonObj.dlogPic);
				$("#dlog_influence").html(jsonObj.dlogInfluence);
				var str = "";
				$(jsonObj.clogList).each(function (i,obj) {
					str+="<tr><td>"+obj.clogDate+"</td><td>"+obj.expNames+"</td><td>"+obj.clogResult+"</td></tr>";
				});
				$("#tb2").html(str);
				$.ajax({type:"post",url:"/Disaster/FindExpNameServlet",
					data:{"dlogType":jsonObj.dlogType},
					success:function(value){
						var jsonArr = JSON.parse(value);
						var str2 = "";
						$(jsonArr).each(function (i,obj) {
							str2+="<option value='"+obj.expId+"'>"+obj.expName+"</option>"
						});
						$("#sel1").html(str2);
						$("#myModal").modal();
				}});
		}});
	}
	
	function move(value) {
		if(value == "right") {
			$("#sel2").append($("#sel1 option:selected"))
			$("#sel1 option:selected").remove();
		} else if(value == "rightall") {
			$("#sel2").append($("#sel1 option"))
			$("#sel1 option").remove();
		} else if(value == "leftall") {
			$("#sel1").append($("#sel2 option"))
			$("#sel2 option").remove();
		} else {
			$("#sel1").append($("#sel2 option:selected"))
			$("#sel2 option:selected").remove();
		}
	}
	
	$("#addclogbtn").click(function () {
		if($("#sel2 option").length == 0 || $("#clog_result").val() == "") {
			alert("请填写完整内容");
			return;
		}
		var arr = "";
		$("#sel2 option").each(function (i,obj) {
			arr += $(this).val()+",";
		});
		$.ajax({type:"post",url:"/Disaster/AddClogServlet",
			data:{"expIdArr":arr,"clogResult":$("#clog_result").val(),"dlogId":$("#hid").val()},
			success:function(value) {
				if(JSON.parse(value)) {
					$("#sel2 option").remove();
					$("#clog_result").val("");
					updateTable2();
				}
			}
		});
	});
</script>    
</div>
</body>
</html>
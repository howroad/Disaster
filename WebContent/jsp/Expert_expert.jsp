<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>专家一览</title>
</head>
<body>
<div class="container-fluid" id="wrap">
    <div class="row">
        <h2 class="text-center">专家一览</h2>
        <div class="table-responsive col-md-12">
            <nav class="navbar navbar-default" id="query" role="navigation">
                <div class="row">
                    <div class="navbar-header col-md-2"><span class="navbar-brand">查询专家信息</span></div>
                    <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label for="exp_company">工作单位</label>
                                <input type="text" class="form-control" id="exp_company" name="exp_company" placeholder="search">
                            </div>
                            <div class="form-group">
                                <label for="exp_special">专长</label>
                                <input type="text" class="form-control" id="exp_special" name="exp_special" placeholder="search">
                            </div>
                            <div class="form-group">
                                <label for="exp_name">专家姓名</label>
                                <input type="text" class="form-control" id="exp_name" name="exp_name" placeholder="search">
                            </div>
                            <button type="button" class="btn btn-default" id="query-btn">查询</button>
                        </form>
                    </div>
                </div>
            </nav>
            <input type="hidden" value="" id="hid"/>
            <table class="table table-bordered table-hover table-striped" id="my_table">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>工作单位</th>
                    <th>专长</th>
                    <th>职务</th>
                    <th>电话</th>
                </tr>
                </thead>
                <tbody id="tb">
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-5">
            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">添加专家</button>
                <button type="button" id="check_information" class="btn btn-default" onclick="check(1)">查看专家信息</button>
                <button type="button" id="change_information" class="btn btn-default" onclick="check(2)">修改专家信息</button>
                <button type="button" id="delete_experts" class="btn btn-default">删除专家</button>
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
        <!-- Modal 添加专家-->
        <div class="modal fade add" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加专家信息</h4>
                    </div>
                    <form id="uploadForm" action="/Disaster/AddExpServlet" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                         <div class="col-sm-6">
                                <label for="expName">姓　　名：</label>
                                <input type="text" id="expName" name="expName"/>
                                <br/><br/>
                                <label for="expBirth">出生年月：</label>
                                <input type="date" id="expBirth" name="expBirth"/>
                                <br/><br/>
                                <label for="expSpecial">专　　长：</label>
                                <input type="text" id="expSpecial" name="expSpecial"/>
                                <br/><br/>
                                <label for="expTel">电　　话：</label>
                                <input type="text" id="expTel" name="expTel"/>
                                <br/><br/>
                                <label for="expAddress">通讯地址：</label>
                                <input type="text" id="expAddress" name="expAddress"/>
                            </div>
                            <div class="col-sm-6">
                                <label>性　　别：</label>
                                <input type="radio" name="expGender" value="男"/>
                                <label>男</label>
                                <input type="radio" name="expGender" value="女"/>
                                <label>女</label>
                                <br/><br/>
                                <label for="expPic">照　　片：</label>
                                <input type="file" id="expPic" name="expPic"/>
                                <br/><br/>
                                <label for="expOffice">职　　务：</label>
                                <input type="text" id="expOffice" name="expOffice"/>
                                <br/><br/>
                                <label for="expCompany">工作单位：</label>
                                <input type="text" id="expCompany" name="expCompany"/>
                                <br/><br/>
                                <label for="expEmail">邮　　箱：</label>
                                <input type="text" id="expEmail" name="expEmail"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                        <button type="submit" class="btn btn-primary" id="add-btn">新添</button>
                    </div>
                     </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- 查看信息-->
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel1">查看专家信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>姓　　名：</label>
                                <span class="expert_name"></span>
                                <br/><br/>
                                <label>出生年月：</label>
                                <span class="expert_date"></span>
                                <br/><br/>
                                <label>性　　别：</label>
                                <span class="expert_gender"></span>
                                <br/><br/>
                                <label>专　　长：</label>
                                <span class="expert_speciality"></span>
                                <br/><br/>
                                <label>电　　话：</label>
                                <span class="expert_phone"></span>
                                <br/><br/>
                                <label>通讯地址：</label>
                                <span class="expert_site"></span>
                            </div>

                            <div class="col-sm-6">
                                <img class="expert_pic" src="" width="150" height="150"/>
                                <br/><br/><br/>
                                <label>职　　务：</label>
                                <span class="expert_duty"></span>
                                <br/><br/>
                                <label>工作单位：</label>
                                <span class="expert_work"></span>
                                <br/><br/>
                                <label>邮　　箱：</label>
                                <span class="expert_mailbox"></span>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- 修改信息-->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel2">修改专家信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>姓　　名：</label>
                                <span class="expert_name"></span>
                                <br/><br/>
                                <label>出生年月：</label>
                                <span class="expert_date"></span>
                                <br/><br/>
                                <label>性　　别：</label>
                                <span class="expert_gender"></span>
                                <br/><br/>
                                <label>专　　长：</label>
                                <span class="expert_speciality"></span>
                                <br/><br/>
                                <label>电　　话：</label>
                                <input type="text" class="expert_phone"/>
                                <br/><br/>
                                <label>通讯地址：</label>
                                <span class="expert_site"></span>
                            </div>
                            <div class="col-sm-6">
                                <img src="" width="150" height="150" class="expert_pic"/>
                                <br/><br/><br/>
                                <label>职　　务：</label>
                                <input type="text" class="expert_duty"/>
                                <br/><br/>
                                <label>工作单位：</label>
                                <input type="text" class="expert_work"/>
                                <br/><br/>
                                <label>邮　　箱：</label>
                                <input type="text" class="expert_mailbox"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="changebtn">修改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>

    <script type="text/javascript">
    	findAll();
	    var pageNo = 1;
		var pageSize = 5;
		var total_page = 0;
		var page_no = 1;
		/* 		
		function init() {
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
				str+="<tr index="+obj.expId+"><td>"+obj.expName+"</td><td>"+obj.expCompany+"</td><td>"+obj.expSpecial+"</td><td>"+obj.expOffice+"</td><td>"+obj.expTel+"</td></tr>";
			});
/* 			var liStr = "";
			for(var i=1;i<=jsonArr.totalPage;i++) {
				liStr+="<li class='page'><a href='javascript:onpage("+i+")''>"+i+"</a></li>"; 
			} */
			$("#tb").html(str);
			$("#tb tr").click(addTrColor);
/* 			$(".page").remove();
			$(".pagination li").last().before(liStr); 
			init(); */
			
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
			$.ajax({type:"post",url:"/Disaster/FindAllExpServlet",
			data:{"expName":$("#exp_name").val(),"expSpecial":$("#exp_special").val(),"expCompany":$("#exp_company").val(),"pageNo":pageNo+"","pageSize":pageSize+""},
			success:function(value){
				updateTable(value);
			}});
		}
		
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
		
		$("#query-btn").click(function () {
			pageNo = 1;
			findAll();
		});
		
		function check(num) {
			if($("#hid").val() === "") {
				alert("请选择要查看的内容");
				return;
			}
			$.ajax({type:"post",url:"/Disaster/FindExpServlet",
				data:{"expId":$("#hid").val()},
				success:function(value){
					var jsonObj = JSON.parse(value);
					$(".expert_name").html(jsonObj.expName);
					$(".expert_date").html(jsonObj.expBirth);
					$(".expert_gender").html(jsonObj.expGender);
					$(".expert_speciality").html(jsonObj.expSpecial);
					$(".expert_site").html(jsonObj.expAddress);
					$(".expert_pic").prop("src", "/Disaster/upload/"+jsonObj.expPic);
					if(num == 1) {
						$(".expert_phone").html(jsonObj.expTel);
						$(".expert_duty").html(jsonObj.expOffice);
						$(".expert_work").html(jsonObj.expCompany);
						$(".expert_mailbox").html(jsonObj.expEmail);
						$("#myModal1").modal();
					} else {
						$(".expert_phone").val(jsonObj.expTel);
						$(".expert_duty").val(jsonObj.expOffice);
						$(".expert_work").val(jsonObj.expCompany);
						$(".expert_mailbox").val(jsonObj.expEmail);
						$("#myModal2").modal();
					}
			}});
		}
		
		$("#changebtn").click(function () {
			$.ajax({type:"post",url:"/Disaster/UpdateExpServlet",
				data:{"expId":$("#hid").val(),"expTel":$(".expert_phone").eq(1).val(),"expOffice":$(".expert_duty").eq(1).val(),"expCompany":$(".expert_work").eq(1).val(),"expEmail":$(".expert_mailbox").eq(1).val()},
				success:function(value){
					if(JSON.parse(value)) {
						alert("修改成功");
						$("#myModal2").modal('hide');
						findAll();
					}else{
						alert("修改失败");
					}
				}});
		});
		
		$("#delete_experts").click(function () {
			if($("#hid").val() === "") {
				alert("请选择要删除的内容");
				return;
			}
			$.ajax({type:"post",url:"/Disaster/DelExpServlet",
				data:{"expId":$("#hid").val()},
				success:function(value){
					if(JSON.parse(value)) {
						if($("#tb tr").length == 1) {
							pageNo -= 1;
						}
						findAll();
						alert("删除成功");
						$("#hid").prop("value", "");
					}
				}});
		});
		/**
		 * 检查输入信息是否重复
		 * @param value 响应信息
		 * @param element 输入框元素
		 * @param text1 没有重复时提示信息
		 * @param text2 有重复时提示信息
		 * @returns true为无重复，false有重复
		 */
		function ckRepeat(value,element,text1,text2) {
			var flag = JSON.parse(value);
			if(flag) {
				element.after("<div class=\"alert alert-success alert-dismissable\">" +
			            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
			            "<strong>恭喜！</strong>"+text1+"</div>");
			} else {
				element.after("<div class=\"alert alert-danger alert-dismissable\">" +
			            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
			            "<strong>注意！</strong>"+text2+"</div>");
			}
			return flag;
		}
		
		$("#uploadForm").on("submit",function(event) {
			var arr = $(".add input");
			for(var i=0;i<arr.length;i++) {
				if(arr.eq(i).val() === "") {
					alert("输入框值不能为空");
					return false;
				}
			}
			var form = this;
			var formData = new FormData(form);
			$.ajax({
				url:this.action,
				type:"post",
				data:formData,
				dataType:"JSON",
				async:true,
				processData:false,
				contentType:false,
				success:function(value) {
					if(JSON.parse(value)) {
						alert("添加成功");
						pageNo = total_page;
						findAll();
					}else{
						alert("添加失败");
					}
				}
			});
			$(".modal").modal('hide');
			return false;
		});
    </script>
</body>
</html>
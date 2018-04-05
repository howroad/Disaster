<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
</head>
<body>
<div id="wrap" class="container-fluid">
    <h3 class="text-center">用户管理</h3>
    <nav class="navbar navbar-default" id="query" role="navigation">
        <div class="row">
            <div class="navbar-header col-md-3"><span class="navbar-brand">查询用户信息</span></div>
            <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group margin_l20">
                        <label for="all_user">所有用户：</label>
                        <select name="areatype" id="user_grant" class="form-control">
                            <option value="0">请选择</option>
                            <option value="1">超级管理员</option>
                            <option value="2">资料管理员</option>
                            <option value="3">灾情管理员</option>
                            <option value="4">专家管理员</option>
                            <option value="5">库房管理员</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-default margin_l20" id="queryuser">查询</button>
                </form>
            </div>
        </div>
    </nav>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>等级</th>
            <th>真实姓名</th>
        </tr>
        </thead>
        <tbody id="user_tbody"></tbody>
    </table>
    <div class="row">
        <div class="col-xs-4 col-md-4">
        	 <button type="button" class="btn btn-default margin_l20" data-toggle="modal" data-target="#add_user_dialog">添加用户</button>
             <button type="button" class="btn btn-default margin_l20 del_user_btn">删除用户</button>
             <button type="button" class="btn btn-default margin_l20" id="update_user_btn">修改用户</button>
        </div>
		<div class="col-xm-5 col-md-5 text-right pull-right">
        	<!-- 分页开始 -->
			<nav class="text-right">
			 	<ul class="pagination" id="page_nav"></ul>
			</nav>
			<!-- 分页结束 -->
        </div>
    </div>

    <!-- 添加用户 -->
    <div class="modal fade" id="add_user_dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">添加用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group div1">
                            <label class="col-sm-4 control-label" for="add_username">用户名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="add_username">
                            </div>
                        </div>
                        <div class="form-group div2">
                            <label class="col-sm-4 control-label" for="add_password">密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="add_password">
                            </div>
                        </div>
                        <div class="form-group div3">
                            <label class="col-sm-4 control-label" for="add_repwd">确认密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="add_repwd">
                            </div>
                        </div>
                        <div class="form-group div4">
                            <label class="col-sm-4 control-label" for="add_relname">真实姓名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="add_relname">
                            </div>
                        </div>
                        <div class="form-group div5">
                            <label class="col-sm-4 control-label" for="add_grant_level">用户等级：</label>
                            <div class="col-sm-6">
                                <select name="" class="form-control" id="add_grant_level">
                                	<option value="0">请选择</option>
                                    <option value="1">超级管理员</option>
                                    <option value="2">资料管理员</option>
                                    <option value="3">灾情管理员</option>
                                    <option value="4">专家管理员</option>
                                    <option value="5">库房管理员</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="adduser">添加</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.添加用户 -->

    <!-- 修改用户 -->
    <div class="modal fade" id="edit_user_dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="edit_username">用户名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_username" readonly />
                            </div>
                        </div>
                        <div class="div6 form-group">
                            <label class="col-sm-4 control-label" for="edit_password">密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_password">
                            </div>
                        </div>
                        <div class="div7 form-group">
                            <label class="col-sm-4 control-label" for="edit_repwd">确认密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_repwd">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="edit_relname">真实姓名：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_relname" readonly />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="edit_grant_level">用户等级：</label>
                            <div class="col-sm-6">
                                <select name="" class="form-control" id="edit_grant_level">
                                    <option value="1">超级管理员</option>
                                    <option value="2">资料管理员</option>
                                    <option value="3">灾情管理员</option>
                                    <option value="4">专家管理员</option>
                                    <option value="5">库房管理员</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update_user_submit_btn">修改</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.修改用户 -->
</div>
<!-- 设置一个隐藏input表单，用来存放userId -->
<input type="hidden" id="hid" value="0"/>
	<script type="text/javascript">
	var total_page = 0;
	var page_no = 1;
	var grant=["","超级管理员","资料管理员","灾情管理员","专家管理员","库房管理员"];
    function show_list(pageNo){
  		var user_grant=$("#user_grant").val();
		$.ajax({
			method:"post",
			url:"/Disaster/ShowUserServlet",
			data:{
				pageNo:pageNo,
				userGrant:user_grant
			},
			success:function(msg){
				var ojson = JSON.parse(msg);
				page_no = ojson.pageNo;
				total_page = ojson.totalPage;
				var olist = ojson.list;
				console.info(olist.length);
				var str = "";
 				for(var i=0;i<olist.length;i++){
					str +="<tr index='"+olist[i].userId+"'><td>"+olist[i].userName+"</td><td>"+olist[i].userPwd+"</td><td>"+grant[olist[i].userGrant]+"</td><td>"+olist[i].userRName+"</td></tr>";					
				}
				$("#user_tbody").html(str);
				//给tr绑定点击事件
				$("#user_tbody tr").click(function(){
					$("#user_tbody tr").removeClass("as");
					$(this).addClass("as");
					$("#hid").val($(this).attr("index"));
				});
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
				//需要初始化hid
				$("#hid").val("0");
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
	
	$("#queryuser").click(function(){
		show_list(1);
	});
	
	$("#adduser").click(adduser);
    
    /**
     * 添加区域
     */
    function adduser() {
        var userName=$("#add_username").val();
        var userPassword=$("#add_password").val();
        var userRepwd=$("#add_repwd").val();
        var userRName=$("#add_relname").val();
        var userGrant=$("#add_grant_level").val();
        $(".alert").remove();
        if(userName==""){
            $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>用户名不能为空</div>");
            return;
        }
        if(userPassword==""){
            $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>密码不能为空</div>");
            return;
        }
        if(userRepwd==""){
            $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>请确认再次密码</div>");
            return;
        }
        if(userRepwd!=userPassword){
            $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>两次密码需要相同</div>");
            return;
        }
        if(userRName==""){
            $(".div4").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>真实姓名不能为空</div>");
            return;
        }
        if(userGrant==0){
            $(".div5").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>请选择权限</div>");
            return;
        }
        $.ajax({
        	method:"post",
        	url:"/Disaster/AddUserServlet",
        	data:{
        		userName:userName,
        		userPassword:userPassword,
        		userRName:userRName,
        		userGrant:userGrant
        	},
        	success:function(msg){
        		if(msg=="true"){
        			alert("添加成功");
        		}else{
        			alert("添加失败");
        		}
                $("#add_user_dialog").modal('hide');
                show_list(total_page);
        	}
        });
    }
    
    
    $(".del_user_btn").click(function(){
		var userId = $("#hid").val();
		if(userId=="0"){
			alert("请选择要删除的一行");
			return;
		}
		//执行ajax删除
		$.ajax({
			url:"/Disaster/DelUserServlet",
			data:{"userId":userId},
			success:function(msg){
        		if(msg=="true"){
        			alert("删除成功");
        		}else{
        			alert("删除失败");
        		}
                show_list(page_no);
			}
		});
	});
    
    //弹出修改模态框
    $("#update_user_btn").click(function(){
		var userId = $("#hid").val();
		if(userId=="0"){
			alert("请选择要修改的一行");
			return;
		}
		//执行ajax查看
		$.ajax({
			url:"/Disaster/FindUserByIdServlet",
			data:{"userId":userId},
			success:function(msg){
				var obj = JSON.parse(msg);
				console.info(obj);
				$("#edit_username").val(obj.userName);
				$("#edit_password").val(obj.userPwd);
				$("#edit_repwd").val(obj.userPwd);
				$("#edit_relname").val(obj.userRName);
				$("#edit_grant_level").val(obj.userGrant);
				$("#edit_user_dialog").modal();
			}
		});
    });
    
    //提交修改
	$("#update_user_submit_btn").click(function(){
		var userId = $("#hid").val();
		var userPwd=$("#edit_password").val();
		var userRepwd=$("#edit_repwd").val();
		var userGrant=$("#edit_grant_level").val();
		$(".alert").remove();
		if(userPwd==""){
            $(".div6").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>密码不能为空</div>");
            return;
        }
		if(userRepwd!=userPwd||userRepwd==""){
            $(".div7").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>两次密码需要相同并且不能为空</div>");
            return;
        }
		
		$.ajax({
        	method:"post",
        	url:"/Disaster/UpdateUserServlet",
        	data:{
        		userId:userId,
        		userPwd:userPwd,
        		userGrant:userGrant
        	},
        	success:function(msg){
        		if(msg=="true"){
        			alert("修改成功");
        		}else{
        			alert("修改失败");
        		}
                $("#edit_user_dialog").modal('hide');
                show_list(page_no);
        	}
        });
	});
    
	</script>
</body>
</html>
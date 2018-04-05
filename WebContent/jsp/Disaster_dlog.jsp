<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid" id="wrap">
        <div class="row">
            <h2 class="text-center">事件记录</h2>
            <div class="table-responsive col-md-12">
                <nav class="navbar navbar-default" id="query" role="navigation">
                    <div class="navbar-header col-md-2"><span class="navbar-brand">事件查询 </span></div>
                    <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label for="dlog_name">事件名称 </label>
                                <input type="text" class="form-control" id="dlog_name" placeholder="Search">
                            </div>
                            <div class="form-group">
                                <label for="dlog_stage">灾情状况 </label>
                                <select id="dlog_stage" class="form-control">
									<option value="0">请选择</option>
									<option value="1">已得到控制</option>
									<option value="2">防治中</option>
									<option value="3">无法解决，申请专家会商</option>
		                        </select>
                            </div>
                            <div class="form-group">
                                <label for="area_name">发生位置 </label>
                                <input type="text" class="form-control" id="area_name" placeholder="Search">
                            </div>
                        </form>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label for="start_date">起始日期 </label>
                                <input type="date" class="form-control" id="start_date" placeholder="Search">
                            </div>
                            <div class="form-group">
                                <label for="end_date">结束日期 </label>
                                <input type="date" class="form-control" id="end_date" placeholder="Search">
                            </div>
                            <button type="button" class="btn btn-default" id="query-btn">查询</button>
                        </form>
                    </div>
                </nav>
                <table class="table table-bordered table-hover table-striped" id="my_table">
                    <thead>
                    <tr>
                        <th>事件名称</th>
                        <th>日期</th>
                        <th>发生位置</th>
                        <th>防治方案</th>
                        <th>灾情状况</th>
                    </tr>
                    </thead>
                    <tbody id="dlog_tbody"></tbody>
                </table>
            </div>
        </div>
        <div class="row">
	        <div class="col-sm-6">
	            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
	                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" id="add_dlog_btn">添加事件</button>
	                <button type="button" class="btn btn-default" id="show_dlog_btn">查看灾情事件</button>
	                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal3" id="apply_exp_btn">申请专家会审</button>
	                <button type="button" class="btn btn-default" id="update_dlog_btn">修改事件信息</button>
	            </div>
	        </div>
	        <div class="col-xm-6 col-md-6 col-sm-6 text-right pull-right">
	        	<!-- 分页开始 -->
				<nav class="text-center">
				 	<ul class="pagination" id="page_nav"></ul>
				</nav>
				<!-- 分页结束 -->
	        </div>
	    </div>
        
        <div class="row">
            <div class="col-xs-6 col-md-6">
                <div class="modal fade small_font" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">添加事件</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <form class="form-horizontal" role="form">
                                        <div class="col-sm-6">
                                            <div class="form-group div1">
                                                <label for="add_dlog_name" class="col-sm-3 col-xs-3 control-label">事件名称</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="add_dlog_name" placeholder="请输入" name="not-none-check">
                                                </div>
                                            </div>
                                            <div class="form-group div2">
                                                <label for="add_dlog_date" class="col-sm-3 col-xs-3 control-label">时间</label>
                                                <div class="col-sm-9">
                                                    <input type="date" class="form-control" id="add_dlog_date" placeholder="请输入" name="not-none-check">
                                                </div>
                                            </div>
                                            <div class="form-group div3">
                                                <label for="add_dlog_stage" class="col-sm-3 col-xs-3 control-label">灾情状况</label>
                                                <div class="col-sm-9">
                                                    <select name="disaster_situation" id="add_dlog_stage" class="form-control">
                                                        <option value="0">请选择</option>
                                                        <option value="1">已得到控制</option>
                                                        <option value="2">防治中</option>
                                                        <option value="3">无法解决，申请专家会商</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div4">
                                                <label for="add_dlog_desc" class="col-sm-3 col-xs-3 control-label">灾情描述</label>
                                                <div class="col-sm-9">
                                                    <textarea name="disaster_des" id="add_dlog_desc" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group div5">
                                                <label for="add_area_id" class="col-sm-3 col-xs-3 control-label">发生位置</label>
                                                <div class="col-sm-9">
                                                    <select name="place_happen" id="add_area_id" class="form-control">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div6">
                                                <label for="add_dlog_loss" class="col-sm-3 col-xs-3 control-label">初步损失</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="add_dlog_loss" placeholder="请输入">
                                                </div>
                                            </div>
                                            <div class="form-group div7">
                                                <label for="add_dlog_plan" class="col-sm-3 col-xs-3 control-label">防治方案</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="add_dlog_plan" placeholder="请输入">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group div8">
                                                <label for="add_dlog_pic" class="col-sm-3 col-xs-3 control-label">灾区图片</label>
                                                <div class="col-sm-9">
                                                    <input type="file" id="add_dlog_pic">
                                                </div>
                                            </div>
                                            <div class="form-group div9">
                                                <label for="add_dlog_type" class="col-sm-3 col-xs-3 control-label">灾害类型</label>
                                                <div class="col-sm-9">
                                                    <select name="disaster_type" id="add_dlog_type" class="form-control">
                                                        <option value="0">请选择</option>
                                                        <option value="1">虫害</option>
                                                        <option value="2">鼠害</option>
                                                        <option value="3">病害</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div10">
                                                <label for="add_dlog_found" class="col-sm-3 col-xs-3 control-label">发现途径</label>
                                                <div class="col-sm-9">
                                                    <select name="find_ways" id="add_dlog_found" class="form-control">
                                                        <option value="0">请选择</option>
                                                        <option value="1">小班巡查发现</option>
                                                        <option value="2">公众发现</option>
                                                        <option value="3">上级部门通报</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div11">
                                                <label for="add_class_id" class="col-sm-3 col-xs-3 control-label">所在小班</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="add_class_id" />
                                                </div>
                                            </div>
                                            <div class="form-group div12">
                                                <label for="add_dlog_influence" class="col-sm-3 col-xs-3 control-label">影响面积</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="add_dlog_influence" placeholder="请输入">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary add-btn" id="add_dlog_submit">确认添加</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="modal fade small_font" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">灾情信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <form class="form-horizontal" role="form">
                                        <div class="col-sm-6">
                                            <div class="form-group div1">
                                                <label for="show_dlog_name" class="col-sm-3 col-xs-3 control-label">事件名称</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="show_dlog_name" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group div2">
                                                <label for="show_dlog_date" class="col-sm-3 col-xs-3 control-label">时间</label>
                                                <div class="col-sm-9">
                                                    <input type="date" class="form-control" id="show_dlog_date" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group div3">
                                                <label for="show_dlog_stage" class="col-sm-3 col-xs-3 control-label">灾情状况</label>
                                                <div class="col-sm-9">
                                                    <select name="disaster_situation" id="show_dlog_stage" class="form-control" disabled>
                                                        <option value="0">请选择</option>
                                                        <option value="1">已得到控制</option>
                                                        <option value="2">防治中</option>
                                                        <option value="3">无法解决，申请专家会商</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div4">
                                                <label for="show_dlog_desc" class="col-sm-3 col-xs-3 control-label">灾情描述</label>
                                                <div class="col-sm-9">
                                                    <textarea name="disaster_des" id="show_dlog_desc" class="form-control" disabled></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group div5">
                                                <label for="show_area_id" class="col-sm-3 col-xs-3 control-label">发生位置</label>
                                                <div class="col-sm-9">
													<input type="text" class="form-control" id="show_area_id" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group div6">
                                                <label for="show_dlog_loss" class="col-sm-3 col-xs-3 control-label">初步损失</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="show_dlog_loss" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group div7">
                                                <label for="show_dlog_plan" class="col-sm-3 col-xs-3 control-label">防治方案</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="show_dlog_plan" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group div8">
                                                <label for="show_dlog_pic" class="col-sm-3 col-xs-3 control-label">灾区图片</label>
                                                <div class="col-sm-9">
                                                    <img alt="图片" src="" id="show_dlog_pic" width="150" height="150"/>
                                                </div>
                                            </div>
                                            <div class="form-group div9">
                                                <label for="show_dlog_type" class="col-sm-3 col-xs-3 control-label">灾害类型</label>
                                                <div class="col-sm-9">
                                                    <select name="disaster_type" id="show_dlog_type" class="form-control" disabled>
                                                        <option value="0">请选择</option>
                                                        <option value="1">虫害</option>
                                                        <option value="2">鼠害</option>
                                                        <option value="3">病害</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div10">
                                                <label for="show_dlog_found" class="col-sm-3 col-xs-3 control-label">发现途径</label>
                                                <div class="col-sm-9">
                                                    <select name="find_ways" id="show_dlog_found" class="form-control" disabled>
                                                        <option value="0">请选择</option>
                                                        <option value="1">小班巡查发现</option>
                                                        <option value="2">公众发现</option>
                                                        <option value="3">上级部门通报</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div11">
                                                <label for="show_class_id" class="col-sm-3 col-xs-3 control-label">所在小班</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="show_class_id" disabled/>
                                                </div>
                                            </div>
                                            <div class="form-group div12">
                                                <label for="show_dlog_influence" class="col-sm-3 col-xs-3 control-label">影响面积</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="show_dlog_influence" placeholder="请输入" disabled>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
			                        <div class="col-sm-12">
			                            <table class="table table-bordered table-hover table-striped">
			                                <tr>
			                                    <th>日期</th>
			                                    <th>会商人员</th>
			                                    <th>会商结果</th>
			                                </tr>
			                                <tbody id="dlog_clog_tbody">
			                                </tbody>
			                            </table>
										<nav class="text-center">
										 	<ul class="pagination" id="page_nav2"></ul>
										</nav>
			                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
               
                 <div class="modal fade small_font" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">修改事件</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <form class="form-horizontal" role="form">
                                        <div class="col-sm-6">
                                            <div class="form-group div1">
                                                <label for="update_dlog_name" class="col-sm-3 col-xs-3 control-label">事件名称</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_dlog_name" placeholder="请输入" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div2">
                                                <label for="update_dlog_date" class="col-sm-3 col-xs-3 control-label">时间</label>
                                                <div class="col-sm-9">
                                                    <input type="date" class="form-control" id="update_dlog_date" placeholder="请输入" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div3">
                                                <label for="update_dlog_stage" class="col-sm-3 col-xs-3 control-label">灾情状况</label>
                                                <div class="col-sm-9">
                                                    <select name="disaster_situation" id="update_dlog_stage" class="form-control">
                                                        <option value="0">请选择</option>
                                                        <option value="1">已得到控制</option>
                                                        <option value="2">防治中</option>
                                                        <option value="3">无法解决，申请专家会商</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group div4">
                                                <label for="update_dlog_desc" class="col-sm-3 col-xs-3 control-label">灾情描述</label>
                                                <div class="col-sm-9">
                                                    <textarea name="disaster_des" id="update_dlog_desc" class="form-control" disabled></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group div5">
                                                <label for="update_area_id" class="col-sm-3 col-xs-3 control-label">发生位置</label>
                                                <div class="col-sm-9">
                                                    <input id="update_area_id" class="form-control" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div6">
                                                <label for="update_dlog_loss" class="col-sm-3 col-xs-3 control-label">初步损失</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_dlog_loss" placeholder="请输入" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div7">
                                                <label for="update_dlog_plan" class="col-sm-3 col-xs-3 control-label">防治方案</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_dlog_plan" placeholder="请输入">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group div8">
                                                <label for="update_dlog_pic" class="col-sm-3 col-xs-3 control-label">灾区图片</label>
                                                <div class="col-sm-9">
                                                    <img alt="图片" src="" id="update_dlog_pic" width="150" height="150"/>
                                                </div>
                                            </div>
                                            <div class="form-group div9">
                                                <label for="update_dlog_type" class="col-sm-3 col-xs-3 control-label">灾害类型</label>
                                                <div class="col-sm-9">
                                                    <input id="update_dlog_type" class="form-control" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div10">
                                                <label for="update_dlog_found" class="col-sm-3 col-xs-3 control-label">发现途径</label>
                                                <div class="col-sm-9">
                                                    <input id="update_dlog_found" class="form-control" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div11">
                                                <label for="update_class_id" class="col-sm-3 col-xs-3 control-label">所在小班</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_class_id" disabled />
                                                </div>
                                            </div>
                                            <div class="form-group div12">
                                                <label for="update_dlog_influence" class="col-sm-3 col-xs-3 control-label">影响面积</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="update_dlog_influence" placeholder="请输入" disabled />
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary add-btn" id="update_dlog_submit">确认修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hid" value="0"/>
    <script type="text/javascript">
	var total_page = 0;
	var page_no = 1;
	var land=["","林地","灌木林","疏林地","苗圃地","密林地"];
	var disaster_satge_arr=["","已得到控制","防治中","无法解决,申请专家会商"];
	var disaster_type_arr=["","虫害","病害","鼠害"];
	var disaster_found_arr=["","小班巡逻发现","公众发现","上级部门通报"];
	//分页显示灾情事件信息
	function show_list(pageNo){
		var dlog_name=$("#dlog_name").val(); 
		var dlog_stage=$("#dlog_stage").val();
		var area_name=$("#area_name").val(); 
		var start_date=$("#start_date").val();
		var end_date=$("#end_date").val(); 
		$.ajax({
			method:"post",
			url:"/Disaster/ShowDlogAjaxServlet",
			data:{
				pageNo:pageNo,
				dlogName:dlog_name,
				dlogStage:dlog_stage,
				areaName:area_name,
				startDate:start_date,
				endDate:end_date
			},
			success:function(msg){
				var ojson = JSON.parse(msg);
				page_no = ojson.pageNo;
				var page_size = ojson.pageSize;
				total_page = ojson.totalPage;
				var total_record = ojson.totalRecord;
				var olist = ojson.list;
				console.info(olist);
				var str = "";
 				for(var i=0;i<olist.length;i++){
					str +="<tr index="+olist[i].dlogId+"><td>"+olist[i].dlogName+"</td><td>"+olist[i].dlogDate+"</td><td>"+olist[i].dlogArea.areaName+"</td><td>"+olist[i].dlogPlan+"</td><td>"+disaster_satge_arr[olist[i].dlogStage]+"</td></tr>";					
				}
 				$("#dlog_tbody").html(str);
 				$("#dlog_tbody tr").click(function(){
 					$("#dlog_tbody tr").removeClass("as");
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
				$("#hid").val("0");
			}
		});
	}
    //分页按钮跳转事件
	function jump_page(){
		var page = $("#jump_input").val();
		if(page>=1){
			page=page>total_page?total_page:page;
			show_list(page);
		}
	}
    //查询事件
	$("#query-btn").click(function(){
		show_list(1);
	});
	//点击弹出添加模态框
	$("#add_dlog_btn").click(function(){
		//获得所有区域
		$.ajax({
			url:"/Disaster/FindAllAreaAjaxServlet",
			success:function(msg){
				var olist = JSON.parse(msg);
				var str = "";
				for(var i=0;i<olist.length;i++){
					str += "<option value='"+olist[i].areaId+"' index='"+(olist[i].areaClass==null?"":olist[i].areaClass.clsName)+"'>"+olist[i].areaName+"</option>";
				}
				console.info(olist);
				$("#add_area_id").html(str);
				//根据区域获得小班
				$("#add_area_id").change(function(){
					$("#add_class_id").val($("#add_area_id option:selected").attr("index"));
				});
			}
		});
	});
    //点击ajax提交数据添加dlog
    $("#add_dlog_submit").click(function(){
		if($("#myModal input[name='not-none-check']").val()==""){
			alert("名称或时间不能空！");
			return;
		}
		if($("#myModal select").val() =="0"){
			alert("下拉框必须选择！");
			return;
		}
    	var formData = new FormData();
    	var img_file = document.getElementById("add_dlog_pic");
    	var fileObj = img_file.files[0];
    	console.info(fileObj);
    	formData.append("dlogId",0);
    	formData.append("dlogName",$("#add_dlog_name").val());
    	formData.append("dlogPic",fileObj);
    	formData.append("dlogDate",$("#add_dlog_date").val());
    	formData.append("dlogType",$("#add_dlog_type").val());
    	formData.append("dlogStage",$("#add_dlog_stage").val());
    	formData.append("dlogDesc",$("#add_dlog_desc").val());
    	formData.append("dlogFound",$("#add_dlog_found").val());
    	formData.append("dlogLoss",$("#add_dlog_loss").val());
    	formData.append("dlogInfluence",$("#add_dlog_influence").val());
    	formData.append("dlogPlan",$("#add_dlog_plan").val());
    	formData.append("dlogArea",$("#add_area_id").val());
    	$.ajax({
    		url:"/Disaster/AddDlogAjaxServlet",
    		type:"post",
    		data:formData,
    		processData:false,
    		contentType:false,
    		success:function(msg){
        		if(msg=="true"){
        			alert("添加成功");
        		}else{
        			alert("添加失败");
        		}
                $("#myModal").modal('hide');
                show_list(total_page);
    		}
    	});
    });
    //点击按钮弹出查看模态框
    $("#show_dlog_btn").click(function(){
    	var dlogId = $("#hid").val();
		if(dlogId=="0"){
			alert("请选择一行！");
			return;
		}
    	//ajax根据Id得到dlogBean
    	$.ajax({
    		url:"/Disaster/FindDlogByIdAjaxServlet",
    		data:"dlogId="+dlogId,
    		success:function(msg){
    			var json = JSON.parse(msg);
    			$("#show_dlog_name").val(json.dlogName);
    			$("#show_dlog_pic").attr("src","/Disaster/upload/"+json.dlogPic);
    			$("#show_dlog_date").val(json.dlogDate);
    			$("#show_dlog_type").val(json.dlogType);
    			$("#show_dlog_stage").val(json.dlogStage);
    			$("#show_dlog_desc").val(json.dlogDesc);
    			$("#show_dlog_found").val(json.dlogFound);
    			$("#show_dlog_loss").val(json.dlogLoss);
    			$("#show_dlog_influence").val(json.dlogInfluence);
    			$("#show_dlog_plan").val(json.dlogPlan);
    			$("#show_area_id").val(json.dlogArea.areaName);
    			$("#show_class_id").val(json.dlogArea.areaClass.clsName);
    			//查询会商记录
    			var str ="";
    			for(var i=0;i<json.clogList.length;i++){
    				str+="<tr><td>"+json.clogList[i].clogDate+"</td><td>"+json.clogList[i].expNames+"</td><td>"+json.clogList[i].clogResult+"</td></tr>";
    			}
    			$("#dlog_clog_tbody").html(str);
    			$("#myModal2").modal();
    		}
    	});
    	
    });
    //修改提交按钮事件
    $("#apply_exp_btn").click(function(){
    	var dlogId = $("#hid").val();
    	if(dlogId=="0"){
			alert("请选择一行！");
			return;
		}
    	$.ajax({
    		url:"/Disaster/DlogApplyExpertAjaxServlet",
    		data:"dlogId="+dlogId,
    		success:function(msg){
        		if(msg=="true"){
        			alert("申请成功");
        		}else{
        			alert("申请失败");
        		}
        		show_list(page_no);
    		}
    	});
    });
    //点击按钮弹出修改模态框
    $("#update_dlog_btn").click(function(){
    	//获得dlogId
    	var dlogId = $("#hid").val();
    	if(dlogId=="0"){
			alert("请选择一行！");
			return;
		}
    	//根据dlogId获得dlogArea
   		$.ajax({
		url:"/Disaster/FindAllAreaAjaxServlet",
		success:function(msg){
			var olist = JSON.parse(msg);
			var str = "";
			for(var i=0;i<olist.length;i++){
				str += "<option value='"+olist[i].areaId+"' index='"+(olist[i].areaClass==null?"":olist[i].areaClass.clsName)+"'>"+olist[i].areaName+"</option>";
			}
			console.info(olist);
			$("#update_area_id").html(str);
			//根据区域获得小班
			$("#update_area_id").change(function(){
				$("#update_class_id").val($("#update_area_id option:selected").attr("index"));
			});
	    	//根据dlogId获得dlogBean里面所有的东西
	    	$.ajax({
	    		url:"/Disaster/FindDlogByIdAjaxServlet",
	    		data:"dlogId="+dlogId,
	    		success:function(msg){
	    			var json = JSON.parse(msg);
	    			$("#update_dlog_name").val(json.dlogName);
	    			$("#update_dlog_pic").attr("src","/Disaster/upload/"+json.dlogPic);
	    			$("#update_dlog_date").val(json.dlogDate);
	    			$("#update_dlog_type").val(disaster_type_arr[json.dlogType]);
	    			$("#update_dlog_stage").val(json.dlogStage);
	    			$("#update_dlog_desc").val(json.dlogDesc);
	    			$("#update_dlog_found").val(disaster_found_arr[json.dlogFound]);
	    			$("#update_dlog_loss").val(json.dlogLoss);
	    			$("#update_dlog_influence").val(json.dlogInfluence);
	    			$("#update_dlog_plan").val(json.dlogPlan);
	    			//alert(json.dlogArea.areaId);
	    			$("#update_area_id").val(json.dlogArea.areaName);
	    			$("#update_class_id").val(json.dlogArea.areaClass.clsName);
	    			$("#myModal4").modal();
	    		}
	    	});
		}});
    	//弹出模态框
    });
    //提交更改灾情状态
    $("#update_dlog_submit").click(function(){
    	var dlogId = $("#hid").val();//获得dlogId
		//提交ajax修改状态和方案
		$.ajax({
			method:"post",
			url:"/Disaster/UpdateDlogAjaxServlet",
			data:{
				dlogId:dlogId,
				dlogStage:$("#update_dlog_stage").val(),
				dlogPlan:$("#update_dlog_plan").val()
			},
			success:function(msg){
        		if(msg=="true"){
        			alert("修改成功");
        		}else{
        			alert("修改失败");
        		}
        		$('#myModal4').modal('hide');
        		show_list(page_no);
			}
			
		});
    });
    show_list(1);
    </script>
</body>
</html>
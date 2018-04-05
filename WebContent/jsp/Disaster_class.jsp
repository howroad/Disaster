<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>小班管理</title>
    <style>
    .bgcolor_red{
    	background-color:red !important;
    }
    
    </style>
</head>
<body>
    <div class="container-fluid" id="wrap">
        <div class="row">
            <h2 class="text-center">小班管理</h2>
            <div class="table-responsive col-md-12">
                <nav class="navbar navbar-default" id="query" role="navigation">
                    <div class="row">
                        <div class="navbar-header col-md-2"><span class="navbar-brand">查询小班信息</span></div>
                        <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <label for="class_name">小班名称</label>
                                    <input type="text" class="form-control" id="class_name" placeholder="Search">
                                </div>
                                <div class="form-group">
                                    <label for="area_name">负责区域</label>
                                    <input type="text" class="form-control" id="area_name" placeholder="Search">
                                </div>
                                <button type="button" class="btn btn-default" id="query-btn">查询</button>
                            </form>
                        </div>
                    </div>
                </nav>
                <table class="table table-bordered table-hover table-striped" id="my_table">
                    <thead>
                    <tr>
                        <th>小班名称</th>
                        <th>负责人</th>
                        <th>负责人电话</th>
                        <th>负责区域</th>
                    </tr>
                    </thead>
                    <tbody id="class_tbody"></tbody>
                </table>
            </div>
        </div>
        <div class="row">
	        <div class="col-sm-5">
	            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
	                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" id="add_class_btn">添加小班</button>
	                <button type="button" class="btn btn-default" id="show_class_btn">查看小班信息</button>
	                <button type="button" class="btn btn-default" id="update_class_btn">修改小班信息</button>
	            </div>
	        </div>
	        <div class="col-xm-5 col-md-5 text-right pull-right">
	        	<!-- 分页开始 -->
				<nav class="text-center">
				 	<ul class="pagination" id="page_nav"></ul>
				</nav>
				<!-- 分页结束 -->
	        </div>
	    </div>
        
        <div class="row">
            <div class="col-xs-4 col-md-4">
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">添加小班</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group div1">
                                        <label for="add_class_name" class="col-sm-3 control-label">名称</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_class_name" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div2">
                                        <label for="add_class_person" class="col-sm-3 control-label">负责人</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_class_person" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div3">
                                        <label for="add_class_tel" class="col-sm-3 control-label">负责人电话</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_class_tel" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div4">
                                        <label for="add_class_pnum" class="col-sm-3 control-label">人员数量</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_class_pnum" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div5">
                                        <label for="add_area_name" class="col-sm-3 control-label">负责区域</label>
                                        <div class="col-sm-9">
                                            <select name="responsible_area" id="add_area_name" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary add-btn">确认添加</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel2">查看小班信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div><span class="col-sm-4 small_span text-right">名称</span>
                                            <span class="col-sm-8 span1" id="show_clsName"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">负责人电话</span>
                                            <span class="col-sm-8 span1" id="show_clsTel"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">负责区域</span>
                                            <span class="col-sm-8 span1" id="show_areaName"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">地类</span>
                                            <span class="col-sm-8 span1" id="show_area_land"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">创建时间</span>
                                            <span class="col-sm-8 span1" id="show_clsDate"></span></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div><span class="col-sm-4 small_span text-right">负责人</span>
                                            <span class="col-sm-8 span1" id="show_clsPerson"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">人员数量</span>
                                            <span class="col-sm-8 span1" id="show_clsPNum"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">林种</span>
                                            <span class="col-sm-8 span1" id="show_areaForest"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">优势树种</span>
                                            <span class="col-sm-8 span1" id="show_areaAdv"></span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">返回</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel3">修改小班信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div><span class="col-sm-4 small_span text-right">名称</span>
                                            <span class="col-sm-8 span1" id="update_clsName"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">负责人电话</span>
                                            <input class="col-sm-8 span1" id="update_clsTel" class="form-control"/></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">负责区域</span>
                                            <span class="col-sm-8 span1" id="update_areaName"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">地类</span>
                                            <span class="col-sm-8 span1" id="update_area_land"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">创建时间</span>
                                            <span class="col-sm-8 span1" id="update_clsDate"></span></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div><span class="col-sm-4 small_span text-right">负责人</span>
                                            <input class="col-sm-8 span1" id="update_clsPerson" class="form-control"/></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">人员数量</span>
                                            <span class="col-sm-8 span1" id="update_clsPNum"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">林种</span>
                                            <span class="col-sm-8 span1" id="update_areaForest"></span></div>
                                        <br/><br/><br/>
                                        <div><span class="col-sm-4 small_span text-right">优势树种</span>
                                            <span class="col-sm-8 span1" id="update_areaAdv"></span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default close-btn" data-dismiss="modal">返回</button>
                                <button type="button" class="btn btn-primary" id="update_submit_btn2">修改</button>
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
    function show_list(pageNo){
		var class_name=$("#class_name").val(); 
		var area_name=$("#area_name").val();
		$.ajax({
			method:"post",
			url:"/Disaster/ShowClassAjaxServlet",
			data:{
				pageNo:pageNo,
				clsName:class_name,
				areaName:area_name
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
					str +="<tr index="+olist[i].clsId+"><td>"+olist[i].clsName+"</td><td>"+olist[i].clsPerson+"</td><td>"+olist[i].clsTel+"</td><td>"+olist[i].clsArea.areaName+"</td></tr>";					
				}
 				$("#class_tbody").html(str);
 				$("#class_tbody tr").click(function(){
 					$("#class_tbody tr").removeClass("as");
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
    
	function jump_page(){
		var page = $("#jump_input").val();
		if(page>=1){
			page=page>total_page?total_page:page;
			show_list(page);
		}
	}
	
    $("#query-btn").click(function(){
    	 show_list(1);
    });
    show_list(1);
    //显示添加模态框
    $("#add_class_btn").click(
		function(){
	    	$.ajax({
	    		//这里获得没有小班的area
	    		url:"/Disaster/ShowNoClassAreaAjaxServlet",
	    		success:function(msg){
	    			var olist = JSON.parse(msg);
	    			console.info(olist)
	    			var str="";
	    			for(var i=0;i<olist.length;i++){
	    				str+="<option value='"+olist[i].areaId+"'>"+olist[i].areaName+"</option>";
	    			}
	    			$("#add_area_name").html(str);
	    		}
	    	});
		}
    );
    $(".add-btn").click(addNewClass);
    /**
     * 添加小班
     */
    function addNewClass() {

        var clsName=$("#add_class_name").val();
        var clsPerson=$("#add_class_person").val();
        var clsTel=$("#add_class_tel").val();
        var clsPNum=$("#add_class_pnum").val();
        var areaId=$("#add_area_name").val();
        $(".alert").remove();
        if(clsName===""){
            $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>名称不能为空</div>");
            return;
        }
        if(clsPerson===""){
            $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>负责人不能为空</div>");
            return;
        }
        if(clsTel===""){
            $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>电话不能为空</div>");
            return;
        }
        var reg_num = /^[0-9]+$/;
        if(clsPNum===""||!reg_num.test(clsPNum)){
            $(".div4").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>人数不能为空且必须为整数</div>");
            return;
        }
        $.ajax({
        	method:"post",
        	url:"/Disaster/AddClassAjaxServlet",
        	data:{
        		clsName:clsName,
        		clsPerson:clsPerson,
        		clsTel:clsTel,
        		clsPNum:clsPNum,
        		areaId:areaId
        	},
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

    }
    //显示小班模态框
	$("#show_class_btn").click(function(){
		var clsId = $("#hid").val();
		if(clsId=="0"){
			alert("请选择一行！");
			return;
		}
		$.ajax({
			url:"/Disaster/FindClassByIdAjaxServlet",
			data:"clsId="+clsId,
			success:function(msg){
				if(msg=="null"){
					return;
				}
				var obj = JSON.parse(msg);
				console.info(obj);
				$("#show_clsName").html(obj.clsName);
				$("#show_clsPerson").html(obj.clsPerson);
				$("#show_clsTel").html(obj.clsTel);
				$("#show_clsPNum").html(obj.clsPNum);
				$("#show_areaName").html(obj.clsArea.areaName);
				$("#show_areaForest").html(obj.clsArea.areaForest);
				$("#show_area_land").html(land[obj.clsArea.areaLand]);
				$("#show_areaAdv").html(obj.clsArea.areaAdv);
				$("#show_clsDate").html(obj.clsDate);
				$("#myModal2").modal();
			}
		});
		
	});
	//弹出修改的那个模态框
	$("#update_class_btn").click(
		function(){
			if($("#hid").val()=="0"){
				alert("请选择一行！");
				return;
			}
			$.ajax({
				url:"/Disaster/FindClassByIdAjaxServlet",
				data:"clsId="+$("#hid").val(),
				success:function(msg){
					if(msg=="null"){
						return;
					}
					var obj = JSON.parse(msg);
					console.info(obj);
					$("#update_clsName").html(obj.clsName);
					$("#update_clsPerson").val(obj.clsPerson);
					$("#update_clsTel").val(obj.clsTel);
					$("#update_clsPNum").html(obj.clsPNum);
					$("#update_areaName").html(obj.clsArea.areaName);
					$("#update_areaForest").html(obj.clsArea.areaForest);
					$("#update_area_land").html(land[obj.clsArea.areaLand]);
					$("#update_areaAdv").html(obj.clsArea.areaAdv);
					$("#update_clsDate").html(obj.clsDate);
					$("#myModal3").modal();
				}
			});
			
		}	
	);
	$("#update_submit_btn2").click(function(){
		$.ajax({
			method:"post",
			url:"/Disaster/UpdateClassAjaxServlet",
			data:{
				clsPerson:$("#update_clsPerson").val(),
				clsTel:$("#update_clsTel").val(),
				clsId:$("#hid").val()
			},
			success:function(msg){
        		if(msg=="true"){
        			alert("修改成功");
        		}else{
        			alert("修改失败");
        		}
                $("#myModal3").modal('hide');
                show_list(page_no);
			}
		});
	});
    </script>
</body>
</html>
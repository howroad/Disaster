<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>区域一览</title>
</head>
<body>
    <div class="container-fluid" id="wrap">
        <div class="row">
            <h2 class="text-center">区域一览</h2>
            <div class="table-responsive col-md-12">
                <nav class="navbar navbar-default" id="query" role="navigation">
                    <div class="row">
                        <div class="navbar-header col-md-2"><span class="navbar-brand">查询区域信息</span></div>
                        <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <label for="area_name">区域名称</label>
                                    <input type="text" class="form-control" id="area_name" placeholder="Search">
                                </div>
                                <div class="form-group">
                                    <label for="area_forest">林种</label>
                                    <input type="text" class="form-control" id="area_forest" placeholder="Search">
                                </div>
                                <div class="form-group">
                                    <label for="class_name">负责小班</label>
                                    <input type="text" class="form-control" id="class_name" placeholder="Search">
                                </div>
                                <button type="button" class="btn btn-default" id="query-btn">查询</button>
                            </form>
                        </div>
                    </div>
                </nav>
                <table class="table table-bordered table-hover table-striped" id="my_table">
                    <thead>
                        <tr>
                            <th>区域名称</th>
                            <th>林种</th>
                            <th>地类</th>
                            <th>优势树种</th>
                            <th>负责小班</th>
                        </tr>
                    </thead>
                    <tbody id="area_tbody"></tbody>
                </table>
            </div>
        </div>
        <div class="row">
	        <div class="col-sm-3">
	            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
	                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">添加区域</button>
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
            <div class="col-xs-1 col-md-1">
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close close-btn" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">添加区域</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group div1">
                                        <label for="add_area_name" class="col-sm-2 control-label">名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="add_area_name" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div2">
                                        <label for="add_area_forest" class="col-sm-2 control-label">林种</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="add_area_forest" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div3">
                                        <label for="add_area_adv" class="col-sm-2 control-label">优势树种</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="add_area_adv" placeholder="请输入">
                                        </div>
                                    </div>
                                    <div class="form-group div4">
                                        <label for="add_area_land" class="col-sm-2 control-label">地类</label>
                                        <div class="col-sm-10">
                                            <select name="areatype" id="add_area_land" class="form-control">
                                                <option value="1">林地</option>
                                                <option value="2">灌木林</option>
                                                <option value="3">疏林地</option>
                                                <option value="4">苗圃地</option>
                                                <option value="5">密林地</option>
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
            </div>
        </div>
    </div>
    <script type="text/javascript">
	var total_page = 0;
	var page_no = 1;
	var land=["","林地","灌木林","疏林地","苗圃地","密林地"];
    function show_list(pageNo){
 		var area_name=$("#area_name").val();
		var area_forest=$("#area_forest").val();
		var class_name=$("#class_name").val(); 
		$.ajax({
			async:true,
			method:"post",
			url:"/Disaster/ShowAreaAjaxServlet",
			data:{
				pageNo:pageNo,
				areaName:area_name,
				areaForest:area_forest,
				clsName:class_name
			},
			success:function(msg){
				var ojson = JSON.parse(msg);
				var page_no = ojson.pageNo;
				var page_size = ojson.pageSize;
				total_page = ojson.totalPage;
				var total_record = ojson.totalRecord;
				var olist = ojson.list;
				console.info(olist.length);
				var str = "";
 				for(var i=0;i<olist.length;i++){
					str +="<tr><td>"+olist[i].areaName+"</td><td>"+olist[i].areaForest+"</td><td>"+land[olist[i].areaLand]+"</td><td>"+olist[i].areaAdv+"</td><td>"+(olist[i].areaClass==null?"":olist[i].areaClass.clsName)+"</td></tr>";					
				}
				
				$("#area_tbody").html(str);
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
    //分页中跳转按钮
	function jump_page(){
		var page = $("#jump_input").val();
		if(page>=1){
			page=page>total_page?total_page:page;
			show_list(page);
		}
	}
	//点击按条件搜索
    $("#query-btn").click(function(){
    	 show_list(1);
    });
	//点击添加模态框中的提交按钮
    $(".add-btn").click(addNewArea);
    
    /**
     * 添加区域
     */
    function addNewArea() {
        var areaName=$("#add_area_name").val();
        var areaForest=$("#add_area_forest").val();
        var areaAdv=$("#add_area_adv").val();
        var areaLand=$("#add_area_land").val();
        $(".alert").remove();
        if(areaName==""){
            $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>名称不能为空</div>");
            return;
        }
        if(areaForest==""){
            $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>树种不能为空</div>");
            return;
        }
        if(areaAdv==""){
            $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>注意！</strong>优势树种不能为空</div>");
            return;
        }
        $.ajax({
        	method:"post",
        	url:"/Disaster/AddAreaAjaxServlet",
        	data:{
        		areaName:areaName,
        		areaForest:areaForest,
        		areaAdv:areaAdv,
        		areaLand:areaLand
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
    show_list(1);
    
    
    </script>
</body>
</html>
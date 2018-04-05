<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="container-fluid" id="wrap">
    <div class="row">
        <h2 class="text-center">病害一览</h2>
        <div class="table-responsive col-md-12">
            <nav class="navbar navbar-default" id="query" role="navigation">
                <div class="row">
                    <div class="navbar-header col-md-2"><span class="navbar-brand">查询病害信息</span></div>
                    <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label for="ill_name">病害名称</label>
                                <input type="text" class="form-control" id="ill_name" name="ill_name" placeholder="search">
                            </div>
                            <div class="form-group">
                                <label for="ill_status">发病症状</label>
                                <input type="text" class="form-control" id="ill_status" name="ill_status" placeholder="search">
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
                    <th>名称</th>
                    <th>主要危害</th>
                    <th>发病规律</th>
                </tr>
                </thead>
                <tbody id="tb">
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3">
            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                <button class="btn btn-default" id="addNewDiseaseBtn">添加新病害</button>
                <button class="btn btn-default" id="checkInfoOfDiseaseBtn">查看详细信息</button>
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
    <div class="modal fade add" id="addNewDiseaseDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelInAdd">添加新病害</h4>
                </div>
                <form id="uploadForm" action="/Disaster/AddIllnessServlet" method="post" enctype="multipart/form-data" class="form-horizontal">
                <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illName">名称</label>
                            <div class="col-sm-10">
                                <input id="illName" type="text" class="form-control" name="illName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illCause">病原</label>
                            <div class="col-sm-10">
                                <input id="illCause" type="text" class="form-control" name="illCause">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illStatus">发病症状</label>
                            <div class="col-sm-10">
                                <textarea id="illStatus" cols="20" rows="3" class="form-control" name="illStatus"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illLaw">发病规律</label>
                            <div class="col-sm-10">
                                <textarea id="illLaw" cols="20" rows="3" class="form-control" name="illLaw"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illPic">图片</label>
                            <div class="col-sm-10">
                                <input id="illPic" type="file" name="illPic">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illHarm">主要危害</label>
                            <div class="col-sm-10">
                                <input id="illHarm" type="text" class="form-control" name="illHarm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="illCure">防治措施</label>
                            <div class="col-sm-10">
                                <textarea id="illCure" cols="20" rows="3" class="form-control" name="illCure"></textarea>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="checkInfoOfDiseaseDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelInInfo">病害详细信息</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div><span class="col-sm-3  text-right">名称</span>
                            <span class="col-sm-8 span1"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">病原</span>
                            <span class="col-sm-8 span2"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">发病症状</span>
                            <span class="col-sm-8 span3"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">发病规律</span>
                            <span class="col-sm-8 span4"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">图片</span>
                            <img src="" width="150" height="150" class="img1"/></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">主要危害</span>
                            <span class="col-sm-8 span5"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">防治措施</span>
                            <span class="col-sm-8 span6"></span></div>
                        <br/><br/><br/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</div>
    <script>
	    var pageNo = 1;
		var pageSize = 5;
		var total_page = 0;
		var page_no = 1;
        $("#addNewDiseaseBtn").click(function(){
            $("#addNewDiseaseDiv").modal()
        })

        $("#checkInfoOfDiseaseBtn").click(function(){
        	if($("#hid").val()=="") {
        		return;
        	}
        	$.ajax({
				type:"post",
				url:"/Disaster/FindIllnessServlet",
				data:{"illId":$("#hid").val()},
				success:function(value) {
					var json = JSON.parse(value);
					$(".span1").html(json.illName);
					$(".span2").html(json.illCause);
					$(".span3").html(json.illStatus);
					$(".span4").html(json.illLaw);
					$(".span5").html(json.illCure);
					$(".span6").html(json.illHarm);
					$(".img1").prop("src","/Disaster/upload/"+json.illPic);
					$("#checkInfoOfDiseaseDiv").modal()
				}
			});
        })
        
        function findAll() {
			$.ajax({
				type:"post",
				url:"/Disaster/FindAllIllnessServlet",
				data:{"pageNo":pageNo,"pageSize":pageSize,"illName":$("#ill_name").val(),"illStatus":$("#ill_status").val()},
				success:function(value) {
					updateTable(value);
				}
			});
		}
        findAll();
        
        function updateTable(value) {
        	var json = JSON.parse(value);
			var str = "";
			$(json.list).each(function (i,obj) {
				str+="<tr index='"+obj.illId+"'><td>"+obj.illName+"</td><td>"+obj.illHarm+"</td><td>"+obj.illLaw+"</td></tr>"
			});
			$("#tb").html(str);
			
			$("#tb tr").click(addTrColor);
			
			//分页开始
			page_no = json.pageNo;
			var page_size = json.pageSize;
			total_page = json.totalPage;
			var total_record = json.totalRecord;
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
    	//跳转
    	function onpage(page){
    	    pageNo = parseInt(page);
    	    findAll();
    	} 
        $("#query-btn").click(function () {
        	pageNo=1;
        	findAll();
		});
        
        function addTrColor() {
			$("#tb tr").removeClass("as");
			$(this).addClass("as");
			$("#hid").val($(this).attr("index"));
		}
        
        $("#uploadForm").on("submit",function(event) {
			var arr = $(".add input");
			for(var i=0;i<arr.length-1;i++) {
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
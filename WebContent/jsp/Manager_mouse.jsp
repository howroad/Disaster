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
        <h2 class="text-center">鼠害一览</h2>
        <div class="table-responsive col-md-12">
            <nav class="navbar navbar-default" id="query" role="navigation">
                <div class="row">
                    <div class="navbar-header col-md-2"><span class="navbar-brand">查询鼠害信息</span></div>
                    <div class="navbar-collapse" id="bs-example-navbar-collapse-1">
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <label for="mou_name">鼠害名称</label>
                                <input type="text" class="form-control" id="mou_name" placeholder="鼠害名" name="mou_name">
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
                    <th>食物</th>
                    <th>主要危害</th>
                </tr>
                </thead>
                <tbody id="tb">
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                <button class="btn btn-default" id="addNewRodentBtn">添加新鼠害</button>
                <button class="btn btn-default" id="checkInfoOfRodentBtn">查看详细信息</button>
            </div>
        </div>
        <div class="col-xm-5 col-md-5 text-right pull-right">
        	<!-- 分页开始 -->
			<nav class="text-right">
			 	<ul class="pagination" id="page_nav"></ul>
			</nav>
			<!-- 分页结束 -->
        </div>
    </div>
    <div class="modal fade" id="addNewRodentDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelInAdd">添加新鼠害</h4>
                </div>
                <form id="uploadForm" action="/Disaster/AddMouseServlet" method="post" enctype="multipart/form-data" class="form-horizontal add">
                <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouName">名称</label>
                            <div class="col-sm-10">
                                <input id="mouName" type="text" class="form-control" name="mouName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouFood">食物</label>
                            <div class="col-sm-10">
                                <input id="mouFood" type="text" class="form-control" name="mouFood">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouBreed">繁殖</label>
                            <div class="col-sm-10">
                                <input id="mouBreed" type="text" class="form-control" name="mouBreed">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouEnemy">天敌</label>
                            <div class="col-sm-10">
                                <input id="mouEnemy" type="text" class="form-control" name="mouEnemy">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouPic">图片</label>
                            <div class="col-sm-10">
                                <input id="mouPic" type="file" name="mouPic">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouHarm">主要危害</label>
                            <div class="col-sm-10">
                                <textarea id="mouHarm" cols="20" rows="3" class="form-control" name="mouHarm"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="mouCure">防治措施</label>
                            <div class="col-sm-10">
                                <textarea id="mouCure" cols="20" rows="3" class="form-control" name="mouCure"></textarea>
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

    <div class="modal fade" id="checkInfoOfRodentDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelInInfo">鼠害详细信息</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div><span class="col-sm-3  text-right">名称</span>
                            <span class="col-sm-8 span1"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">食物</span>
                            <span class="col-sm-8 span2"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">繁殖</span>
                            <span class="col-sm-8 span3"></span></div>
                        <br/><br/><br/>
                        <div><span class="col-sm-3  text-right">天敌</span>
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
        $("#addNewRodentBtn").click(function(){
            $("#addNewRodentDiv").modal()
        })

        $("#checkInfoOfRodentBtn").click(function(){
        	if($("#hid").val()==""){
        		alert("请选择一项");
        		return;
        	}
        	$.ajax({
        		type:"post",
        		url:"/Disaster/FindMouseServlet",
        		data:{"mouId":$("#hid").val()},
        		success:function(value){
        			var json = JSON.parse(value);
        			$(".span1").html(json.mouName);
        			$(".span2").html(json.mouFood);
        			$(".span3").html(json.mouBreed);
        			$(".span4").html(json.mouEnemy);
        			$(".span5").html(json.mouHarm);
        			$(".span6").html(json.mouCure);
        			$(".img1").prop("src","/Disaster/upload/"+json.mouPic);
        			$("#checkInfoOfRodentDiv").modal()
        		}
        	});
        })
        
        function findAll(){
        	$.ajax({
        		type:"post",
        		url:"/Disaster/FindAllMouseServlet",
        		data:{"pageNo":pageNo,"pageSize":pageSize,"mouName":$("#mou_name").val()},
        	    success:function(value){
        	    	updateTable(value);
        	    }
        	});
        }
        findAll();
        
        function updateTable(value) {
        	var json = JSON.parse(value);
			var str = "";
			$(json.list).each(function (i,obj) {
				str+="<tr index='"+obj.mouId+"'><td>"+obj.mouName+"</td><td>"+obj.mouFood+"</td><td>"+obj.mouHarm+"</td></tr>"
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
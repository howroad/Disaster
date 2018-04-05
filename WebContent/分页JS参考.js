function show_product(pageNo){
		var pro_name=$("#pro_name_input").val();
		var start_date=$("#start_date_input").val();
		var end_date=$("#end_date_input").val();
		$.ajax({
			method:"post",
			url:"/Shop/AjaxQueryProductServlet",
			//data:"proName=&startDate=&endDate=&pageNo="+pageNo,
			data:{
				proName:pro_name,
				startDate:start_date,
				endDate:end_date,
				pageNo:pageNo,
				pageSize:6
			},
			success:function(msg){
				var ojson = JSON.parse(msg);
				var page_no = ojson.pageNo;
				var page_size = ojson.pageSize;
				var total_page = ojson.totalPage;
				var total_record = ojson.totalRecord;
				var olist = ojson.list;
				var str = "";
				for(var i=0;i<olist.length;i++){
					str += "<div class='col-sm-6 col-md-4'><div class='thumbnail'><img src='/Shop/upload/"+olist[i].proPic+"' alt='产品图' /><div class='caption'>"
						+"<h3>"+olist[i].proName+"</h3><p>单价:"+olist[i].proPrice+"元</p><p>已售出"+olist[i].saleNum+"件</p>"
						+"<p><a href='/Shop/ShowProductInfoServlet?proId="+olist[i].proId+"' class='btn btn-primary'>查看</a><a href='javascript:add_cart("+olist[i].proId+")' class='btn btn-default'>加入购物车</a>"
						+"</p></div></div></div>";
				}
				$("#product_content").html(str);
				var str2 = "";
				str2 +="<li "+(page_no==1?"class='active'":"")+"><a href='javascript:show_product(1)'>第 1 页</a></li>";
				str2 +="<li "+(page_no==1?"class='disabled'":"")+"><a href='javascript:show_product("+(page_no-1)+")'>上一页</a></li>";
				str2 +="<li><a>"+page_no+"</a></li>";
				str2 +="<li><a class='input-group input-group-sm' style='padding:7px 7px'><input type='text' class='form-control' style='width:50px' id='jump_input'/></a></li>";
				str2 +="<li><a href='javascript:jump_page()'>跳转</a></li>";
				str2 +="<li "+(page_no==total_page?"class='disabled'":"")+"><a href='javascript:show_product("+(page_no+1)+")'>下一页</a></li>";
				str2 +="<li "+(page_no==total_page?"class='active'":"")+"><a href='javascript:show_product("+total_page+")'>第 "+total_page+" 页</a></li>";
				$("#page_nav").html(str2);
				console.info(olist);
			}
		});
	}
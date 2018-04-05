<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="森林病虫害防治系统">
    <meta name="author" content="luhao">
    <title>森林病虫害防治系统 v1.1 by Group2</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/sb-admin-2.css"/>
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="../css/font-awesome.min.css"/>
    <!--zzm-->
    <link rel="stylesheet" href="../css/zzmcss.css">
    <!--luhao-->
    <link rel="stylesheet" href="../css/lu.css"/>

<body>
    <div id="wrapper">
        <!-- 头部导航栏 -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" id="header">
            <div class="navbar-header" id="group2-title">
                <a class="navbar-brand" href="index.jsp">森林病虫害防治系统 v1.1 by Group2</a>
            </div>
            <!-- /.标题结束 -->

            <ul class="nav navbar-top-links navbar-right" id="hover-color">
                <!--消息按钮-->
                <li class="dropdown">
                    <a class="dropdown-toggle tip" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw write-title" ></i>  <i class="fa fa-caret-down write-title"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>赵子墨</strong>
                                    <span class="pull-right text-muted">
                                        <em>2小时前</em>
                                    </span>
                                </div>
                                <div>已经搞定了，欧耶！</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>陈韵蕊</strong>
                                    <span class="pull-right text-muted">
                                        <em>昨天</em>
                                    </span>
                                </div>
                                <div>完蛋了，我忘记做了...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>路昊</strong>
                                    <span class="pull-right text-muted">
                                        <em>2天前</em>
                                    </span>
                                </div>
                                <div>记得把作业做完发我邮箱...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>查看全部消息</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- /.消息按钮结束 -->
                <!--铃铛按钮-->
                <li class="dropdown">
                    <a class="dropdown-toggle tip" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw write-title"></i>  <i class="fa fa-caret-down write-title"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> 新信息
                                    <span class="pull-right text-muted small">2 小时前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 邮件
                                    <span class="pull-right text-muted small">4 分钟前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> 云盘
                                    <span class="pull-right text-muted small">4 小时前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>查看全部警告</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- /.铃铛按钮结束 -->
                <!--个人信息按钮-->
                <li class="dropdown">
                    <a class="dropdown-toggle tip" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw write-title"></i>  <i class="fa fa-caret-down write-title"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="javascript:login_out()"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                        </li>
                    </ul>
                </li>
                <!-- /.个人信息按钮结束 -->
            </ul>
            <!-- /.头部结束 -->

            <!--左边导航栏-->
            <div class="navbar-default sidebar" role="navigation" id="left_nav">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <!--搜索框-->
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="搜索...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                        </li>
                        <!-- /搜索框结束 -->
                        <!--资料管理-->
                        
                        <c:if test="${user.userGrant==1 or user.userGrant==2}">
	                        <li>
	                            <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 资料管理<span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href="javascript:void(0)" id="Manager_insect">虫害一览</a>
	                                </li>
	                                <li>
	                                    <a href="javascript:void(0)" id="Manager_illness">病害一览</a>
	                                </li>
	                                <li>
	                                    <a href="javascript:void(0)" id="Manager_mouse">鼠害一览</a>
	                                </li>
	                            </ul>
	                        </li>
                        </c:if>
                        <c:if test="${user.userGrant!=1 and user.userGrant!=2}">
	                        <li class="disabled" data-toggle="tooltip" title="没有权限!">
	                           <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 资料管理<span class="fa arrow"></span></a>
	                        </li>
                        </c:if>
                        <!-- /资料管理结束 -->
                        <!--灾情防治-->
                        <c:if test="${user.userGrant==1 or user.userGrant==3}">
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-bar-chart-o fa-fw"></i> 灾情防治<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="javascript:void(0)" id="Disaster_area">区域一览</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" id="Disaster_class">小班管理</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" id="Disaster_dlog">事件记录</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${user.userGrant!=1 and user.userGrant!=3}">
	                        <li class="disabled" data-toggle="tooltip" title="没有权限!">
	                          <a href="javascript:void(0)"><i class="fa fa-bar-chart-o fa-fw"></i> 灾情防治<span class="fa arrow"></span></a>
	                        </li>
                        </c:if>
                        <!-- /灾情防治结束 -->
                        <!--专家会商-->
                        <c:if test="${user.userGrant==1 or user.userGrant==4}">
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-sitemap fa-fw"></i> 专家会商<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="javascript:void(0)" id="Expert_expert">专家一览</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" id="Expert_clog">会商灾情</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${user.userGrant!=1 and user.userGrant!=4}">
	                        <li class="disabled" data-toggle="tooltip" title="没有权限!">
	                           <a href="javascript:void(0)"><i class="fa fa-sitemap fa-fw"></i> 专家会商<span class="fa arrow"></span></a>
	                        </li>
                        </c:if>                        
                        <!-- /专家会商结束 -->
                        <!--药剂器械出库管理-->
                        <c:if test="${user.userGrant==1 or user.userGrant==5}">
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-files-o fa-fw"></i> 药剂器械出库管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="javascript:void(0)" id="Medicine_medicine">药剂器械管理</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" id="Medicine_stockout">出库管理</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${user.userGrant!=1 and user.userGrant!=5}">
	                        <li class="disabled" data-toggle="tooltip" title="没有权限!">
	                           <a href="javascript:void(0)"><i class="fa fa-files-o fa-fw"></i> 药剂器械出库管理<span class="fa arrow"></span></a>
	                        </li>
                        </c:if>                          
                        <!-- /药剂器械出库管理结束 -->
                        <!--系统信息-->
                        <c:if test="${user.userGrant==1}">
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-wrench fa-fw"></i> 系统信息<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="javascript:void(0)" id="System_user">用户管理</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" id="System_olog">日志一览</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${user.userGrant!=1}">
	                        <li class="disabled" data-toggle="tooltip" title="没有权限!">
	                           <a href="javascript:void(0)"><i class="fa fa-wrench fa-fw"></i> 系统信息<span class="fa arrow"></span></a>
	                        </li>
                        </c:if>                          
                        <!-- /系统信息结束 -->
                    </ul>
                </div>
            </div>
            <!--左边导航栏结束-->
        </nav>
        <!--导航栏结束-->
        <!--内容部分-->
        <div id="page-wrapper" class="bgchange1"></div>
        <!--内容部分结束-->
        <!--尾部-->
        <div class="footer">
            <div class="footer_content">
                <p>
                    &nbsp;&copy;2018-2018 AUTHOR：<a href="#">J153二组</a>
                </p>
                <p>
                    组长：<a href="#">路昊</a><span>|</span>
                    资料管理：<a href="#">文泓泉</a><span>|</span>
                    灾情防治：<a href="#">赵子墨</a><span>|</span>
                    专家会商：<a href="#">伍辰汉</a><span>|</span>
                    药剂器械出库管理：<a href="#">陈韵蕊</a><span>|</span>
                    系统信息：<a href="#">柯强林</a><span>|</span>
                </p>
                <p>
                    蜀ICP备8888-6666号-1<span>|</span>
                    增值电信业务经营许可证蜀C-20180302<span>|</span>
                    蜀公网安备 86861234567号
                </p>
            </div>
        </div>
        <!--尾部结束-->
    </div>
<!-- jQuery -->
<script src="../js/jQuery-2.2.2-min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/sb-admin-2.js"></script>

<script>

	$(function () { $("[data-toggle='tooltip']").tooltip(); });
    var content = $("#page-wrapper");
    content.load("/Disaster/html/banner.html");
    //虫害一览
    $("#Manager_insect").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Manager_insect.jsp");
    });
    //病害一览
    $("#Manager_illness").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Manager_illness.jsp");
    });
    //鼠害一览
    $("#Manager_mouse").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Manager_mouse.jsp");
    });
    //区域一览
    $("#Disaster_area").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Disaster_area.jsp");
    });
    //小班管理
    $("#Disaster_class").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Disaster_class.jsp");
    });
    //事件记录
    $("#Disaster_dlog").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Disaster_dlog.jsp");
    });
  	//专家一览
    $("#Expert_expert").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Expert_expert.jsp");
    });
    //会商详情
    $("#Expert_clog").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Expert_clog.jsp");
    });
    //药剂器械管理
    $("#Medicine_medicine").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Medicine_medicine.jsp");
    });
    //出库管理
    $("#Medicine_stockout").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/Medicine_stockout.jsp");
    });
    //用户管理
    $("#System_user").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/System_user.jsp");
    });
    //日志一览
    $("#System_olog").click(function(){
    	bgchange();
        content.load("/Disaster/jsp/System_olog.jsp");
    });
    function login_out(){
    	window.location.href="/Disaster/LoginOutServlet";
    }
    function bgchange(){
    	$("#page-wrapper").removeClass("bgchange1");
    	$("#page-wrapper").addClass("bgchange2");
    }
</script>
</body>

</html>

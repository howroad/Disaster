/**
 * 事件记录构造器
 * @param eventName 时间名称
 * @param startDate 开始时间
 * @param endDate 结束时间
 * @param disasterSituation 灾情状况
 * @param disasterDes 灾情描述
 * @param placeHappen 发生地区
 * @param initialLoss 初步损失
 * @param controlPrograms 防止方案
 * @param disasterPicture 灾区图片
 * @param disasterType 灾害类型
 * @param findWays 发现途径
 * @param theClass 所在小班
 * @param affectedArea 影响面积
 * @constructor
 */
function Record(eventName,startDate,endDate,disasterSituation,disasterDes,placeHappen
                ,initialLoss,controlPrograms,disasterPicture,disasterType,findWays
                ,theClass,affectedArea) {
    this.eventName=eventName;
    this.startDate=startDate;
    this.endDate=endDate;
    this.disasterSituation=disasterSituation;
    this.disasterDes=disasterDes;
    this.placeHappen=placeHappen;
    this.initialLoss=initialLoss;
    this.controlPrograms=controlPrograms;
    this.disasterPicture=disasterPicture;
    this.disasterType=disasterType;
    this.findWays=findWays;
    this.theClass=theClass;
    this.affectedArea=affectedArea;
}
/**
 * 初始化数据
 */
function createEventList() {
    eventList=[new Record("松毛虫事件","2011-02-03","2012-05-06","已得到控制","毛毛虫很多","雅安一号地区"
        ,"被吃了很多树","喷洒敌百虫，黑光灯诱蛾","../img/1.jpg","虫害","小班巡查发现"
        ,"雅安一班","50平米"),
        new Record("雅琳枯萎病事件","2012-10-20","2013-01-20","已得到控制","枯萎很多","雅安三号地区"
            ,"病了很多树","喷洒波美度石硫合剂","../img/2.jpg","病害","小班巡查发现"
            ,"雅安一班","50平米"),
        new Record("攀枝花鼠害事件","2012-12-30","","防治中","老鼠很多","卧龙二号地区"
            ,"被吃了很多树","大量放置捕鼠笼","../img/3.jpg","鼠害","小班巡查发现"
            ,"雅安一班","50平米"),
        new Record("成都松林病害事件","2013-05-30","","无法解决，申请专家会商","病死很多","卧龙自然保护区"
            ,"病了很多树","喷洒多菌灵","../img/4.jpg","病害","小班巡查发现"
            ,"雅安一班","50平米")];
    return eventList;
}
var eventList = createEventList();

var pageNo=1;
var pageSize = 5;
/**
 * 更新页数
 */
function page(arr) {
    var pageBtn = $(".pagination li");
    var firstPage = pageBtn.first();
    var lastPage = pageBtn.last();
    firstPage.nextUntil(lastPage).remove();
    var len=Math.ceil(arr.length/pageSize);
    pageBtn.removeClass("active");
    firstPage.removeClass("disabled");
    lastPage.removeClass("disabled");
    for(var i=1;i<=len;i++){
        lastPage.before("<li><a href=\"javascript:void(0)\">"+i+"</a></li>");
    }
    if(pageNo===1){
        firstPage.addClass("disabled");
    }
    if(pageNo===len){
        lastPage.addClass("disabled");
    }
    pageBtn = $(".pagination li");
    pageBtn.each(function () {
        if(pageNo===parseInt($(this).text()[0])){
            $(this).addClass("active");
        }
    });
    pageBtn.click(onpage);
}
/**
 * 更新表格
 * @param arr 数组
 * @param pageNo 当前页数
 */
function updateEventTable(arr, pageNo) {
    page(arr);
    var otbody=$("#my_table").find("tbody");
    otbody.empty();
    for(var i=(pageNo-1)*5;i<arr.length&&i<pageSize+(pageNo-1)*5;i++){
        otbody.append("<tr id='my_tr"+i+"'></tr>");
        var otr = $("#my_tr"+i);
        otr.append("<td>"+arr[i].eventName+"</td>");
        otr.append("<td>"+arr[i].startDate+"</td>");
        otr.append("<td>"+arr[i].placeHappen+"</td>");
        otr.append("<td>"+arr[i].controlPrograms+"</td>");
        otr.append("<td>"+arr[i].disasterSituation+"</td>");
    }
    $("#my_table tr").slice(1).click(chooseTr);
}
updateEventTable(eventList,pageNo);

/**
 * 关闭按钮绑定事件
 */
$(".close-btn").click(function () {
    $(".modal-body input").val("");
    $(".modal-body textarea").val("");
    $(".modal-body select").val("请选择");
    $(".modal-body .span2").text("");
    $(".alert").remove();
});

/**
 * 添加事件
 */
function addNewEvent() {
    var eventName=$("#event_name").val();
    var startDate=$("#start_date").val();
    var disasterSituation=$("#disaster_situation").val();
    var disasterDes=$("#disaster_des").val();
    var placeHappen=$("#place_happen").val();
    var initialLoss=$("#initial_loss").val();
    var controlPrograms=$("#control_programs").val();
    var disasterPicture=$("#disaster_picture").val();
    var disasterType=$("#disaster_type").val();
    var findWays=$("#find_ways").val();
    var theClass=$("#the_class").val();
    var affectedArea=$("#affected_area").val();
    $(".alert").remove();
    if(eventName===""){
        $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>名称不能为空</div>");
        return;
    }
    if(startDate===""){
        $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>时间不能为空</div>");
        return;
    }
    if(disasterSituation==="请选择"){
        $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择灾情状况</div>");
        return;
    }
    if(disasterDes===""){
        $(".div4").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>描述不能为空</div>");
        return;
    }
    if(placeHappen==="请选择"){
        $(".div5").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择发生位置</div>");
        return;
    }
    if(initialLoss===""){
        $(".div6").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>初步损失不能为空</div>");
        return;
    }
    if(controlPrograms===""){
        $(".div7").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>防治方案不能为空</div>");
        return;
    }
    if(disasterPicture===""){
        $(".div8").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>图片不能为空</div>");
        return;
    }
    if(disasterType==="请选择"){
        $(".div9").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择灾害类型</div>");
        return;
    }
    if(findWays==="请选择"){
        $(".div10").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择发现途径</div>");
        return;
    }
    if(theClass==="请选择"){
        $(".div11").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择所在小班</div>");
        return;
    }
    if(affectedArea===""){
        $(".div12").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>影响面积不能为空</div>");
        return;
    }
    eventList.push(new Record(eventName,startDate,"",disasterSituation,disasterDes,placeHappen
        ,initialLoss,controlPrograms,disasterPicture,disasterType,findWays
        ,theClass,affectedArea));
    updateEventTable(eventList,pageNo);
}
$(".add-btn").click(addNewEvent);

/**
 * 模糊查询事件信息
 */
function queryEvent() {
    var arr = [];
    for(var i=0;i<eventList.length;i++){
        if(eventList[i].eventName.indexOf($("#event-name").val())>-1
            &&eventList[i].disasterSituation.indexOf($("#disaster").val())>-1
            &&eventList[i].placeHappen.indexOf($("#place").val())>-1
            &&eventList[i].startDate.indexOf($("#start-date").val())>-1
            &&eventList[i].endDate.indexOf($("#end-date").val())>-1){
            arr.push(eventList[i]);
        }
    }
    updateEventTable(arr,pageNo);
}
$("#query-btn").click(queryEvent);

/**
 * 分页按钮
 */
function onpage(){
    var obtn = $(this).text()[0];
    var len=Math.ceil(eventList.length/pageSize);
    if(obtn==="«"){
        if(pageNo===1){return;}
        pageNo-=1;
    } else if(obtn==="»") {
        if(pageNo===len){return;}
        pageNo+=1;
    } else {
        pageNo=parseInt(obtn);
    }
    updateEventTable(eventList,pageNo);
}

/**
 * 选择表格变色
 */
function chooseTr() {
    $("#my_table tr").removeClass("as");
    $(this).addClass("as");
}
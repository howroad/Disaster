/**
 * 地区构造器
 * @param areaName 地区名称
 * @param treeType 树种
 * @param areaType 地类
 * @param dominantTree 优势树种
 * @param smallClass 负责小班
 * @constructor
 */
function Area(areaName,treeType,areaType,dominantTree,smallClass) {
    this.areaName=areaName;
    this.treeType=treeType;
    this.areaType=areaType;
    this.dominantTree=dominantTree;
    this.smallClass=smallClass;
}

/**
 * 初始化数据
 */
function createAreaList() {
    areaList=[new Area("雅琳一号地区","柏杨林","林地","柏树","雅安一班"),
        new Area("雅安三号地区","针阔林","林地","松树","雅琳二班"),
        new Area("卧龙二号地区","桐林","疏林地","泡桐","卧龙一班"),
        new Area("雅琳二号地区","柏杨林","林地","柏树","卧龙二班"),
        new Area("卧龙自然保护区","竹林","灌木林","箭竹","雅安二班")];
    return areaList;
}
var areaList = createAreaList();

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
function updateAreaTable(arr, pageNo) {
    page(arr);
    var otbody=$("#my_table").find("tbody");
    otbody.empty();
    for(var i=(pageNo-1)*5;i<arr.length&&i<pageSize+(pageNo-1)*5;i++){
        otbody.append("<tr id='my_tr"+i+"'></tr>");
        var otr = $("#my_tr"+i);
        otr.append("<td>"+arr[i].areaName+"</td>");
        otr.append("<td>"+arr[i].treeType+"</td>");
        otr.append("<td>"+arr[i].areaType+"</td>");
        otr.append("<td>"+arr[i].dominantTree+"</td>");
        otr.append("<td>"+arr[i].smallClass+"</td>");
    }
    $("#my_table tr").slice(1).click(chooseTr);
}
updateAreaTable(areaList,pageNo);

/**
 * 关闭按钮绑定事件
 */
$(".close-btn").click(function () {
    $(".modal-body input").val("");
    $(".modal-body select").val("请选择");
    $(".alert").remove();
});

/**
 * 添加区域
 */
function addNewArea() {
    var areaName=$("#area_name").val();
    var treeType=$("#tree_type").val();
    var areaType=$("#area_type").val();
    var dominantTree=$("#dominant_tree").val();
    $(".alert").remove();
    if(areaName===""){
        $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>名称不能为空</div>");
        return;
    }
    if(treeType===""){
        $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>树种不能为空</div>");
        return;
    }
    if(dominantTree===""){
        $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>优势树种不能为空</div>");
        return;
    }
    if(areaType==="请选择"){
        $(".div4").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择地类</div>");
        return;
    }
    areaList.push(new Area(areaName,treeType,areaType,dominantTree,""));
    updateAreaTable(areaList,pageNo);
}
$(".add-btn").click(addNewArea);

/**
 * 模糊查询区域信息
 */
function queryArea() {
    var arr = [];
    for(var j=0;j<areaList.length;j++){
        if(areaList[j].areaName.indexOf($("#area-name").val())>-1
            &&areaList[j].treeType.indexOf($("#forest-species").val())>-1
            &&areaList[j].smallClass.indexOf($("#small-class").val())>-1){
            arr.push(areaList[j]);
        }
    }
    updateAreaTable(arr,pageNo);
}
$("#query-btn").click(queryArea);

/**
 * 分页按钮
 */
function onpage(){
    var obtn = $(this).text()[0];
    var len=Math.ceil(areaList.length/pageSize);
    if(obtn==="«"){
        if(pageNo===1){return;}
        pageNo-=1;
    } else if(obtn==="»") {
        if(pageNo===len){return;}
        pageNo+=1;
    } else {
        pageNo=parseInt(obtn);
    }
    updateAreaTable(areaList,pageNo);
}

/**
 * 选择表格变色
 */
function chooseTr() {
    $("#my_table tr").removeClass("as");
    $(this).addClass("as");
}
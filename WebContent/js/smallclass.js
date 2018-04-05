/**
 * 小班构造器
 * @param smallClassName 小班名称
 * @param principal 负责人
 * @param principalTel 负责人电话
 * @param staffNum 人员数量
 * @param responsibleArea 负责区域
 * @constructor
 */
function SmallClass(smallClassName,principal,principalTel,staffNum,responsibleArea) {
    this.smallClassName=smallClassName;
    this.principal=principal;
    this.principalTel=principalTel;
    this.staffNum=staffNum;
    this.responsibleArea=responsibleArea;
}

/**
 * 初始化数据
 */
function createClassList() {
    classList=[new SmallClass("雅安一班","何元庆","13854785249","10","雅琳一号地区"),
        new SmallClass("雅琳二班","余化龙","18569874587","8","雅安三号地区"),
        new SmallClass("卧龙一班","杨再兴","13635487965","6","卧龙二号地区"),
        new SmallClass("卧龙二班","汪琳","13548796218","12","雅琳二号地区"),
        new SmallClass("雅安二班","狄雷","15748759654","8","卧龙自然保护区")];
    return classList;
}
var classList = createClassList();

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
function updateClassTable(arr, pageNo) {
    page(arr);
    var otbody=$("#my_table").find("tbody");
    otbody.empty();
    for(var i=(pageNo-1)*5;i<arr.length&&i<pageSize+(pageNo-1)*5;i++){
        otbody.append("<tr id='my_tr"+i+"' index='"+i+"'></tr>");
        var otr = $("#my_tr"+i);
        otr.append("<td>"+arr[i].smallClassName+"</td>");
        otr.append("<td>"+arr[i].principal+"</td>");
        otr.append("<td>"+arr[i].principalTel+"</td>");
        otr.append("<td>"+arr[i].responsibleArea+"</td>");
    }
    $("#my_table tr").slice(1).click(chooseTr);
}
updateClassTable(classList,pageNo);

/**
 * 关闭按钮绑定事件
 */
$(".close-btn").click(function () {
    $(".modal-body input").val("");
    $(".modal-body select").val("请选择");
    $(".modal-body .span2").text("");
    $(".alert").remove();
});

/**
 * 添加小班
 */
function addNewClass() {
    var smallClassName=$("#smallclass_name").val();
    var principal=$("#principal").val();
    var principalTel=$("#principal_tel").val();
    var staffNum=$("#staff_num").val();
    var responsibleArea=$("#responsible_area").val();
    $(".alert").remove();
    if(smallClassName===""){
        $(".div1").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>名称不能为空</div>");
        return;
    }
    if(principal===""){
        $(".div2").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>负责人不能为空</div>");
        return;
    }
    if(principalTel===""){
        $(".div3").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>电话不能为空</div>");
        return;
    }
    if(staffNum===""){
        $(".div4").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>人数不能为空</div>");
        return;
    }
    if(responsibleArea==="请选择"){
        $(".div5").after("<div class=\"alert alert-danger alert-dismissable\">" +
            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
            "<strong>注意！</strong>请选择负责区域</div>");
        return;
    }
    classList.push(new SmallClass(smallClassName,principal,principalTel,staffNum,responsibleArea));
    updateClassTable(classList,pageNo);
}
$(".add-btn").click(addNewClass);

/**
 * 模糊查询小班信息
 */
function queryClass() {
    var arr = [];
    for(var i=0;i<classList.length;i++){
        if(classList[i].smallClassName.indexOf($("#smallclass-name").val())>-1
            &&classList[i].responsibleArea.indexOf($("#responsible-area").val())>-1){
            arr.push(classList[i]);
        }
    }
    updateClassTable(arr,pageNo);
}
$("#query-btn").click(queryClass);

/**
 * 分页按钮
 */
function onpage(){
    var obtn = $(this).text()[0];
    var len=Math.ceil(classList.length/pageSize);
    if(obtn==="«"){
        if(pageNo===1){return;}
        pageNo-=1;
    } else if(obtn==="»") {
        if(pageNo===len){return;}
        pageNo+=1;
    } else {
        pageNo=parseInt(obtn);
    }
    updateClassTable(classList,pageNo);
}

/**
 * 选择表格变色
 */
function chooseTr() {
    $("#my_table tr").removeClass("as");
    $(this).addClass("as");
}

/**
 * 查看小班信息
 */
function viewClass() {
    if($(".as").length===0){return;}
    var ospan = $(".modal-body .span1");
    var index = $(".as").attr("index");
    ospan.eq(0).text(classList[index].smallClassName);
    ospan.eq(1).text(classList[index].principalTel);
    ospan.eq(2).text(classList[index].responsibleArea);
    ospan.eq(5).text(classList[index].principal);
    ospan.eq(6).text(classList[index].staffNum);
}
$("#view-btn").click(viewClass);

/**
 * 显示修改小班信息
 */
function viewClass2() {
    if($(".as").length===0){return;}
    var ospan = $(".modal-body .span2");
    var index = $(".as").attr("index");
    ospan.eq(0).text(classList[index].smallClassName);
    ospan.eq(1).val(classList[index].principalTel);
    ospan.eq(2).text(classList[index].responsibleArea);
    ospan.eq(5).val(classList[index].principal);
    ospan.eq(6).text(classList[index].staffNum);
}
$("#update-btn").click(viewClass2);

/**
 * 确定修改小班信息
 */
function updateClass() {
    if($(".as").length===0){return;}
    var ospan = $(".modal-body .span2");
    var index = $(".as").attr("index");
    classList[index].principalTel = ospan.eq(1).val();
    classList[index].principal = ospan.eq(5).val();
    updateClassTable(classList,pageNo);
}
$("#update-btn2").click(updateClass);
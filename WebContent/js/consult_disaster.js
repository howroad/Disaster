/**
 * Created by Administrator on 2018/3/5 0005.
 */
$(".table tr").click(function(){
    $(this).css("background-color","green")
    var num = $(this)
    $("#consult_disaster").click(function(){
        $("#event_name").html(num.find("td").eq(0).text())
        $("#data").html(num.find("td").eq(1).text())
        $("#the_where").html(num.find("td").eq(2).text())
    })
})
/**
 * Created by Administrator on 2018/3/5 0005.
 */
$(".table tr").click(function(){
    var num = $(this)
    $(this).css("background-color","green")
    $("#delete_experts").click(function(){
        num.html("")
        $(".table").append("<tr><td></td><td></td><td></td><td></td><td></td></tr>")
    })
    $("#check_information").click(function(){
        $("#expert_name").html(num.find("td").eq(0).text())
        $("#expert_work").html(num.find("td").eq(1).text())
        $("#expert_speciality").html(num.find("td").eq(2).text())
        $("#expert_duty").html(num.find("td").eq(3).text())
        $("#expert_phone").html(num.find("td").eq(4).text())
    })
    $("#change_information").click(function(){
        $("#experts_name").html(num.find("td").eq(0).text())
        $("#experts_work").html(num.find("td").eq(1).text())
        $("#experts_speciality").html(num.find("td").eq(2).text())
        $("#experts_duty").html(num.find("td").eq(3).text())
        $("#experts_phone").html(num.find("td").eq(4).text())
    })
})
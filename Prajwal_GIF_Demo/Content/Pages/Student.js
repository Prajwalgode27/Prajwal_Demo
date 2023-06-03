$(document).ready(function () {
    GetStudent();
});

function GetStudent() {
    //debugger;
    var activecheck = null;
    $.ajax({
        url: "/Student/StudentList",
        type: "Post",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            ////debugger;
            var html = "";
            $.each(result, function (key, elementValue) {
                html += '<tr>';
                html += '<td>' + elementValue.StudentName + '</td>';
                html += '<td>' + elementValue.ParentName + '</td>';
                html += '<td>' + elementValue.ClassName + '</td>';
                html += '<td>' + elementValue.ParentEmail + '</td>';
                html += '<td>' + elementValue.ParentMobile + '</td>';
                html += '<td><input type="checkbox" id=Activecheck_' + elementValue.Id + ' class="ibtn"></td>';
                html += '<td><a href="#" onclick="return getbyID(' + elementValue.Id + ')">Edit</a></td>';
                activecheck = result;
                html += '</tr>';
            });
            $('.tbody').html(html);
            for (var i = 0; i < activecheck.length; i++) {
                if (activecheck[i].Active == true) {
                    $("#Activecheck_" + activecheck[i].Id).attr('checked', 'checked');
                }
                else {
                    $("#Activecheck_" + + activecheck[i].Id).removeAttr('checked', 'checked');
                }
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
} 

function getbyID(Id) {
    $('#StudentName').css('border-color', 'lightgrey');
    $('#ParentName').css('border-color', 'lightgrey');
    $('#ddlClass').css('border-color', 'lightgrey');
    $('#ParentEmail').css('border-color', 'lightgrey');
    $('#ParentMobile').css('border-color', 'lightgrey');
    $('#Active').css('border-color', 'lightgrey');
   // //debugger;
    $.ajax({
        url: "/Student/getbyID/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",//debugger
        success: function (result) {
            
            $('#Id').val(result.Id);
            $('#StudentName').val(result.StudentName);
            $('#ParentName').val(result.ParentName);
            $('#ddlClass').val(result.ClassName);
            $('#ParentEmail').val(result.ParentEmail);
            $('#ParentMobile').val(result.ParentMobile);
            $('#Active').val(result.Active);
            if (result.Active == true) {
                $("#Active").attr('checked', 'checked');
            } else {
                $("#Active").removeAttr('checked', 'checked');
            }
            $('#myModal').modal('show');
            $('#btnUpdate').show();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}


function updateStudent() {
    //debugger;
    var checkbox = false;
    if ($("#Active").is(":checked")) {
        checkbox = true;
    }
    else {
        checkbox = false;
    }
    var studentObj = {
        Id: $('#Id').val(),
        ParentName: $('#ParentName').val(),
        ClassName: $('#ddlClass').val(),
        StudentName: $('#StudentName').val(),
        ParentEmail: $('#ParentEmail').val(),
        ParentMobile: $('#ParentMobile').val(),
        Active: checkbox,
    };
    $.ajax({
        url: "/Student/UpdateStudent",
        data: JSON.stringify(studentObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#StudentName').val();
            $('#ParentName').val();
            $('#ddlClass').val();
            $('#ParentEmail').val();
            $('#ParentMobile').val();
            $('#Active').val();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$(document).ready(function () {
    $('#updateBtn').click(function () {
        var selectedCheckboxIds = $('input[type="checkbox"]:checked').map(function () {
            return this.id;
        }).get();
        var obj = [{}];
    
        for (let i = 0; i < selectedCheckboxIds.length; i++) {
            var id = selectedCheckboxIds[i].split("_");
            obj = [{
            Id: Number(id[1]),
            Active: true
            }]
        }
        $.ajax({
            url: "/Student/UpdateIsActive",
            method: "post",
            data: JSON.stringify(obj),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    });
});




//function updateCheckBox(arg) {
//  //  //debugger;
//    var objcheck = ""
//    var cart = [];



//    $('input[type=checkbox]').each(function () {
//        if (this.checked) {
//            objcheck = objcheck + this.id + ","
//            objcheck = objcheck.split(",")
//            for (var i = 0; i < (objcheck.length)-1; i++) {
//                var id = objcheck[i].split("_");
//                $("#Activecheck" + id).attr('checked', 'checked');
//                //element.Id=id[1];
//                //element.Active=true;
//                //if (i != 0) {
//                    cart.push({
//                        ID: id[1],
//                        Active: true
//                    });
//                console.log(cart, "cart");
//               // }
//            }
//        }
//    });
//}

//= require active_admin/base
//= require jquery_nested_form
//= require jquery.tagsinput
//= require jquery.tokeninput
//= require bootstrap


function autocomplete_group_fields_setup() {

    $("#group_user_tokens").tokenInput("/admin/groups/autocomplete_user_email", {
        theme: "facebook",
        preventDuplicates: true,
        crossDomain: false,
        prePopulate: $('#group_users_tokens').data('pre')
    });

}


function autocomplete_credit_fields_setup() {

    $("#credit_group_id").tokenInput("/admin/credits/autocomplete_group_name", {
        theme: "facebook",
        preventDuplicates: true,
        crossDomain: false,
        prePopulate: $('#credit_group_id').data('pre'),
        tokenLimit: 1
    });
}


function autocomplete_user_fields_claim() {

    $("#claim_user_tokens").tokenInput("/admin/claims/autocomplete_user_email", {
        theme: "facebook",
        preventDuplicates: true,
        crossDomain: false,
        prePopulate: $('#cclaim_users_tokens').data('pre'),
        tokenLimit: 1
    });
}
$(document).ready(function() {
    $( ".datepicker" ).datepicker("option", "dateFormat", 'dd/mm/yy' );
    $("h1.site_title").remove();
    $("h2").empty();
    $("h2").height(35);
    $("h2").append("<a href='/'><img  src='/assets/vontrip.png' width='140px' height='30px' style='margin-top: 35px;'/></a> ");
    $("div#titlebar_left").append("<a href='/'><img  src='/assets/vontrip.png' width='140px' height='30px' /></a> ");
    $("div#titlebar_left h2").remove();
    $("div#footer p").remove();

    autocomplete_group_fields_setup()
    autocomplete_credit_fields_setup()
    autocomplete_user_fields_claim()

    $(document).on('click', 'body.active_admin a.button', function() {
        $('input.datepicker:not(.hasDatepicker)').datepicker();
        $( ".datepicker" ).datepicker("option", "dateFormat", 'dd/mm/yy' );

    });


    $('body.active_admin a.button').live('click', function() {
        $('input.datepicker:not(.hasDatepicker)').datepicker();
    });
})


function toggle_admin_user(){

    console.log("toggle_admin_user");


    if(document.getElementById("admin_user_user_role_id_1").checked) {     //admin vontrip

        $("#hotel_inputs").hide();

    }else if(document.getElementById("admin_user_user_role_id_2").checked) {     //hotel

        $("#hotel_inputs").show();

    } else{

        $("#hotel_inputs").hide();

    }
}





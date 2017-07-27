$(function() {
  $('#upload_picture_image').live("change", check_picture);
});

function check_picture() {
  if ($("#upload_picture_image").val() == "") {
		return false;
	}
	preview_loading();
	$.ajaxFileUpload({
		url: '/check_picture',
		secureuri: false,
		fileElementId: 'upload_picture_image',
		dataType: 'json',
		success: function (data, status) {
		  if(data.status == 'success') {
        preview_picture();
		  } else if(data.status == 'fail') {
		    show_message(data.message);
		  }
		},
    error: function (data, status, e) {
      show_message("An error occurred while transferring the file");
    }
	});
}

function preview_loading() {
 $(".message-span").hide();
 $("#preview_box").addClass("loading").addClass("min-height");
 $('#preview_image').empty().show();
}

function show_message(message) {
  $("#preview_box").removeClass('loading').removeClass("minHeight");
  $('.message-span').find('span').text(message);
  $('.message-span').show();
}

function preview_picture() {
}
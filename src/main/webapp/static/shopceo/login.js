//登录相关
;
(function(window) {
	var LOGIN = typeof module === 'undefined' ? (window.LOGIN = window.LOGIN || {}) : module.exports;
	var base = $('#base').val();
	// 与后台交互
	_send = function(async, url, value, success, error) {
		$.ajax({
			async : async,
			url : base + '/' + url,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : value,
			dataType : 'json',
			type : 'post',
			success : function(d) {
				success(d);
			},
			error : function(d) {
				error(d);
			}
		});
	};
	// 表单校验
	LOGIN.validateForm = function(formname) {
		$('.' + formname).validate(
		{
			errorElement : 'span',
			errorClass : 'help-block',
			focusInvalid : true,
			rules : {
				phone : {
					required : true,
					minlength: 4,
					maxlength: 32
				},
				password : {
					required : true,
					minlength: 4,
					maxlength: 32
				}
			},
			messages : {
				phone : {
					required : "请输入手机号.",
					minlength: "账号长度不少于4位",
					maxlength: "账号长度不大于32位"
				},
				password : {
					required : "请输入密码.",
					minlength: "密码长度不少于4位",
					maxlength: "密码长度不大于32位"
				}
			},

			highlight : function(element) {
				$(element).closest('.form-group').addClass('has-error');
			},

			success : function(label) {
				label.closest('.form-group').removeClass('has-error');
				label.remove();
			},

			errorPlacement : function(error, element) {
				element.parent('div').append(error);
			},

			submitHandler : function(form) {
				form.submit();
			}
		});
	};
	$('.container').on('click', '.loginbtn', function() {
		if (!$('.loginform').validate().form()) {
			return;
		}
		//var pwd = $('.loginform .password').val();
		//$('.loginform .password').val(hex_sha1(pwd));
		var v = $('.loginform').serialize();
		$(this).addClass('disabled');
		_send(false, 'doLogin.html', v, function(d) {
			if (d) {
				window.location.href = base + "/index.html";
			} else {
				alert('请输入正确的用户名和密码！');
			}
		}, function(d) {
			alert('登录失败！');
		});
		//$('.loginform .password').val(pwd);
		$(this).removeClass('disabled');
	});
})(window);
;
$(function() {
	LOGIN.validateForm('loginform');
	$('.loginform .phone').val($.cookie('shopceo_phone'));
});
$(function() {
	var base = $('#base').val();
	// 获取所有商户信息
	var showAllBusinesses = function() {
		$.ajax({
			url : base + '/' + 'business/showBusinesses.html',
			dataType : 'html',
			success : function(data) {
				$('#page-wrapper').html(data);
			}
		});
	};

	// 跳转到商户信息列表页面
	$('#wrapper').on('click', '.querybusiness', function() {
		showAllBusinesses();
	});

	// 条件获取商户信息
	var showBusinessesByParam = function() {
		var pageNum = $(':hidden[name=pageNumber]').val();
		var pageSize = $(':hidden[name=pageSize]').val();
		$.ajax({
			url : base + '/' + 'business/showBusinesses.html?pageNumber=' + pageNum
					+ '&pageSize=' + pageSize,
			dataType : 'html',
			type : 'POST',
			data : $('.searchbusinessform').serialize(),
			success : function(data) {
				$('#page-wrapper').html(data);
			},
			error : function() {
				alert('查询失败！');
			}
		});
	};

	// 条件查询商户信息
	$('#page-wrapper').on('click', '.searchbusinessbutton', function() {
		showBusinessesByParam();
	});

	// 跳转到添加商户信息页面
	$('#wrapper').on('click', '.addbusiness', function() {
		$.ajax({
			url : base + '/' + 'business/toAddBusiness.html',
			dataType : 'html',
			success : function(data) {
				$('#page-wrapper').html(data);
				$('.addbusinessform').validate(
				{
					errorElement : 'span',
					errorClass : 'help-block',
					focusInvalid : true,
					rules : {
						businessId : {
							required : true,
							maxlength: 255
						},
						name : {
							required : true,
							maxlength: 255
						},
						address : {
							required : true,
							maxlength: 255
						},
						email : {
							required : true,
							maxlength: 255
						},
						phone : {
							required : true,
							minlength: 11,
							maxlength: 11
						},
						city : {
							required : true,
							maxlength: 255
						}
					},
					messages : {
						businessId : {
							required : "请输入商户ID.",
							maxlength: "长度不能超过255位"
						},
						name : {
							required : "请输入商户名称.",
							maxlength: "长度不能超过255位"
						},
						address : {
							required : "请输入商户地址.",
							maxlength: "长度不能超过255位"
						},
						email : {
							required : "请输入商户邮箱.",
							maxlength: "长度不能超过255位"
						},
						phone : {
							required : "请输入商户手机号码.",
							minlength: "长度不能少于11位",
							maxlength: "长度不能超过11位"
						},
						city : {
							required : "请输入商户所在城市.",
							maxlength: "长度不能超过255位"
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
			}
		});
	});

	// 添加商户
	$('#page-wrapper').on(
			'click',
			'.addbusinesssubmit',
			function() {
				// alert($('.addbusinessform').serialize());
				if (!$('.addbusinessform').validate().form()) {
					return;
				}
				$('.addbusinesssubmit').addClass('disabled');
				$.ajax({
					url : base + '/' + 'business/addBusiness.html',
					dataType : 'json',
					type : 'POST',
					data : $('.addbusinessform').serialize(),
					success : function(data) {
						// 关闭提交按钮
						$('.modal .addbusinessresult').html(
								'<h4>成功添加<mark>' + data.result
										+ '</mark>条商户信息！</h4>');
						// 打开模态框
						$('.modal').modal('show');
					},
					error : function() {
						$('.addbusinesssubmit').addClass('disabled');
						$('.modal .addbusinessresult').html('<h4>添加失败！</h4>');
						$('.modal').modal('show');
					}
				});
			});

	// 修改商户信息
	$('#page-wrapper').on('click', '.editbusinesssubmit', function() {
		// alert($('.editbusinessform').serialize());
		$.ajax({
			url : base + '/' + 'business/editBusiness.html',
			dataType : 'json',
			type : 'POST',
			data : $('.editbusinessform').serialize(),
			success : function(data) {
				alert('成功修改' + data.result + '条商户信息！');
				// 关闭模态框
				$('.modal').modal('hide');
				showBusinessesByParam();
			},
			error : function() {
				alert('修改失败！');
				$('.modal').modal('hide');
			}
		});
	});

	// 删除商户
	$('#page-wrapper').on('click', '.removebusinesssubmit', function() {
		// alert($('.removebusinessform').serialize());
		$.ajax({
			url : base + '/' + 'business/removeBusiness.html',
			dataType : 'json',
			type : 'POST',
			data : $('.removebusinessform').serialize(),
			success : function(data) {
				alert('成功删除' + data.result + '条商户信息！');
				// 关闭模态框
				$('.modal').modal('hide');
				showBusinessesByParam();
			},
			error : function() {
				alert('删除失败！');
				$('.modal').modal('hide');
			}
		});
	});

	// 模态框关闭时触发
	$('#page-wrapper').on('hidden.bs.modal', '.modal', function() {
		// 打开添加商品提交按钮
		$('.addbusinesssubmit').removeClass('disabled');
	});

});
/** ******************* js方法 ********************** */
var base = $('#base').val();
// 获取商户信息编辑页面
var toEditBusiness = function(id) {
	$.ajax({
		url : base + '/' + 'business/toEditBusiness.html',
		dataType : 'html',
		data : 'id=' + id,
		success : function(data) {
			$('#editBusinessModal .modal-body').html(data);
		}
	});
};
// 获取商户信息删除页面
var toRemoveBusiness = function(id) {
	$.ajax({
		url : base + '/' + 'business/toRemoveBusiness.html',
		dataType : 'html',
		data : 'id=' + id,
		success : function(data) {
			$('#removeBusinessModal .modal-body').html(data);
		}
	});
};
// 跳转到分页页面
var toPage = function(pageNo, url) {
	var form = $("form .searchform").val();
	$.ajax({
		url : base + '/' + url + '.html?pageNumber=' + pageNo,
		dataType : 'html',
		type : 'POST',
		data : $('.' + form).serialize(),
		success : function(data) {
			$('#page-wrapper').html(data);
			/****广告信息模块****/
			$('td.ow').each(function() {
				$(this).html(Adv.getOwner($(this).attr('oid')));
			});
		},
		error : function() {
			alert('查询失败！');
		}
	});
};

//主模块
;
(function(window) {
	var Main = typeof module === 'undefined' ? (window.Main = window.Main || {})
			: module.exports;
	
})(window);

// 广告相关
;
(function(window) {
	var Adv = typeof module === 'undefined' ? (window.Adv = window.Adv || {})
			: module.exports;
	var base = $('#base').val();
	var _toPage = function(url, cb) {
		var form = $("form .searchform").val();
		$.ajax({
			url : base + '/' + url,
			dataType : 'html',
			type : 'POST',
			data : $('.' + form).serialize(),
			success : function(d) {
				$('#page-wrapper').html(d);
				if (cb) {
					cb();
				}
			},
			error : function() {
				alert('网络异常');
			}
		});
	};
	Adv.toQ = function() {
		_toPage('ad/toQuery.html', function() {
			$('td.ow').each(function() {
				$(this).html(Adv.getOwner($(this).attr('oid')));
			});
		});
		// 渲染owner

	};// to query
	Adv.getOwner = function(ownerId) {
		if (ownerId == '-10086') {
			return '系统管理员';
		} else {
			// 发起请求 查 出商家名
			return '商家发布';
		}
		;
	};
	Adv.toC = function() {
		_toPage('ad/toCreate.html');
	};// to add
	
	// 与后台交互
	Adv.send = function(url, v, s, e) {
		$.ajax({
			url : base + '/' + url,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : v,
			dataType : 'json',
			type : 'post',
			success : function(d) {
				s(d);
			},
			error : function(d) {
				e(d);
			}
		});
	};
	// 编辑广告
	Adv.toEdit = function(pid, adid, adname, adurl, addesc, adtdurl, ownerid) {
		$(".editadform .pid").val(pid);
		$(".editadform .adid").val(adid);
		$(".editadform .adname").val(adname);
		$(".editadform .adurl").val(adurl);
		$(".editadform .addesc").val(addesc);
		$(".editadform .adtdurl").val(adtdurl);
		$(".editadform .ownerid").val(ownerid);
	};
	$('#page-wrapper').on('click', '.editadsubmit', function() {
		var v = $('.editadform').serialize();
		Adv.send('ad/edit.html', v, function(d) {
			$('#editAdModal').modal('hide');
			if (d == 1) {
				alert('修改成功！');
				Adv.toQ();
			} else {
				alert('修改失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	// 删除广告
	Adv.toRemove = function(pid, adid) {
		$(".removeadform .pid").val(pid);
		$(".removeadform .adid").text(adid);
	};
	$('#page-wrapper').on('click', '.removeadsubmit', function() {
		var v = $('.removeadform').serialize();
		Adv.send('ad/remove.html', v, function(d) {
			$('#removeAdModal').modal('hide');
			if (d == 1) {
				alert('删除成功！');
				Adv.toQ();
			} else {
				alert('删除失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	
	// event for advertise..导航菜单栏部分
	$('#wrapper').on('click', '.queryadv', function() {
		Adv.toQ();
	});
	$('#wrapper').on('click', '.addadv', function() {
		Adv.toC();
	});
	
	// 主页面部分事件
	// event for create ad..
	$('#page-wrapper').on('click', '.addadvbtn', function() {
		var v = $('.addadvform').serialize();
		if (v == '') {
			return;
		}
		$('.addadvbtn').addClass('disabled');
		Adv.send('ad/create.html', v, function(d) {
			$('.modal .addadvresult').html('<h4>成功添加广告<mark>' + d.adid + '</mark>！</h4>');
			// 打开模态框
			$('#addadvmodal').modal('show');
		},function(d) {
			alert('出现异常！');
		});
		$('.addadvbtn').removeClass('disabled');
	});
	// event for query ad..
	$('#page-wrapper').on('click', '.searchadbutton', function() {
		Adv.toQ();
	});
})(window);
// 广告与商户关系
;
(function(window) {
	var Ad2B = typeof module === 'undefined' ? (window.Ad2B = window.Ad2B || {})
			: module.exports;
	var base = $('#base').val();
	var _toPage = function(url, cb) {
		var form = $("form .searchform").val();
		$.ajax({
			url : base + '/' + url,
			dataType : 'html',
			type : 'POST',
			data : $('.' + form).serialize(),
			success : function(d) {
				$('#page-wrapper').html(d);
				if (cb) {
					cb();
				}
			},
			error : function() {
				alert('网络异常');
			}
		});
	};
	Ad2B.toH = function() {
		_toPage('adtobiz/toHandle.html');
	};// to Handle
	Ad2B.toA = function() {
		_toPage('adtobiz/toAddHandle.html');
	};// to Handle
	$('#wrapper').on('click', '.hanldeadv', function() {
		Ad2B.toH();
	});
	$('#wrapper').on('click', '.addhandle', function() {
		Ad2B.toA();
	});
	// 与后台交互
	Ad2B.send = function(url, v, s, e) {
		$.ajax({
			url : base + '/' + url,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : v,
			dataType : 'json',
			type : 'post',
			success : function(d) {
				s(d);
			},
			error : function(d) {
				e(d);
			}
		});
	};
	Ad2B.add = function() {
		var v = $('.addhandleform').serialize();
		if (v == '') {
			return;
		}
		$('.addhandlebtn').addClass('disabled');
		Adv.send('adtobiz/handle.html', v, function(d) {
			$('.modal .addhandleresult').html('<h4>成功添加广告<mark>' + d.adid + '</mark>和商户<mark>' + d.bizid + '</mark>的关联！</h4>');
			// 打开模态框
			$('#addhandlemodal').modal('show');
		},function(d) {
			alert('出现异常！');
		});
		$('.addhandlebtn').removeClass('disabled');
	};
	Ad2B.toEdit = function(pid, adid, bizid, codeurl, remark) {
		$(".editatbform .pid").val(pid);
		$(".editatbform .adid").val(adid);
		$(".editatbform .bizid").val(bizid);
		$(".editatbform .codeurl").val(codeurl);
		$(".editatbform .remark").val(remark);
	};
	Ad2B.toRemove = function(pid, adid, bizid) {
		$(".removeatbform .pid").val(pid);
		$(".removeatbform .adid").text(adid);
		$(".removeatbform .bizid").text(bizid);
	};
	
	// 执行添加
	$('#page-wrapper').on('click', '.addhandlebtn', function() {
		Ad2B.add();
	});
	
	// 修改
	$('#page-wrapper').on('click', '.editatbsubmit', function() {
		var v = $('.editatbform').serialize();
		Adv.send('adtobiz/editHandle.html', v, function(d) {
			$('#editATBModal').modal('hide');
			if (d == 1) {
				alert('修改成功！');
				Ad2B.toH();
			} else {
				alert('修改失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	
	// 删除
	$('#page-wrapper').on('click', '.removeatbsubmit', function() {
		var v = $('.removeatbform').serialize();
		Adv.send('adtobiz/removead2b.html', v, function(d) {
			$('#removeATBModal').modal('hide');
			if (d == 1) {
				alert('删除成功！');
				Ad2B.toH();
			} else {
				alert('删除失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	
	$('#page-wrapper').on('click', '.searchatbbutton', function() {
		Ad2B.toH();
	});

})(window);
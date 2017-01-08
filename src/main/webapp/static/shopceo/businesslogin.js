// 广告与商户关系
;
(function(window) {
	var BLogin = typeof module === 'undefined' ? (window.BLogin = window.BLogin || {})
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
	BLogin.toH = function() {
		_toPage('adtobiz/toUserHandle.html');
	};// to Handle
	BLogin.toA = function() {
		_toPage('adtobiz/toUserAddHandle.html');
	};// to Handle
	$('#wrapper').on('click', '.hanldeadv', function() {
		BLogin.toH();
	});
	$('#wrapper').on('click', '.addhandle', function() {
		BLogin.toA();
	});
	// 与后台交互
	BLogin.send = function(url, v, s, e) {
		$.ajax({
			url : url,
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
	BLogin.add = function() {
		var v = $('.addhandleform').serialize();
		if (v == '') {
			return;
		}
		$('.addhandlebtn').addClass('disabled');
		BLogin.send('adtobiz/handle.html', v, function(d) {
			$('.modal .addhandleresult').html('<h4>成功添加广告<mark>' + d.adid + '</mark>和商户<mark>' + d.bizid + '</mark>的关联！</h4>');
			// 打开模态框
			$('#addhandlemodal').modal('show');
		},function(d) {
			alert('出现异常！');
		});
		$('.addhandlebtn').removeClass('disabled');
	};
	BLogin.toEdit = function(pid, adid, bizid, codeurl, remark) {
		$(".editatbform .pid").val(pid);
		$(".editatbform .adid").val(adid);
		$(".editatbform .bizid").val(bizid);
		$(".editatbform .codeurl").val(codeurl);
		$(".editatbform .remark").val(remark);
	};
	BLogin.toRemove = function(pid, adid, bizid) {
		$(".removeatbform .pid").val(pid);
		$(".removeatbform .adid").text(adid);
		$(".removeatbform .bizid").text(bizid);
	};
	
	// 执行添加
	$('#page-wrapper').on('click', '.addhandlebtn', function() {
		BLogin.add();
	});
	
	// 修改
	$('#page-wrapper').on('click', '.editatbsubmit', function() {
		var v = $('.editatbform').serialize();
		BLogin.send('adtobiz/editHandle.html', v, function(d) {
			$('#editATBModal').modal('hide');
			if (d == 1) {
				alert('修改成功！');
				BLogin.toH();
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
		BLogin.send('adtobiz/removead2b.html', v, function(d) {
			$('#removeATBModal').modal('hide');
			if (d == 1) {
				alert('删除成功！');
				BLogin.toH();
			} else {
				alert('删除失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	
	$('#page-wrapper').on('click', '.searchatbbutton', function() {
		BLogin.toH();
	});

})(window);

//广告相关
;
(function(window) {
	var UserAd = typeof module === 'undefined' ? (window.UserAd = window.UserAd || {})
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
	UserAd.toQ = function() {
		_toPage('ad/toQuery.html', function() {
			//$('td.ow').each(function() {
				//$(this).html(UserAd.getOwner($(this).attr('oid')));
			//});
		});
		// 渲染owner

	};// to query
	UserAd.getOwner = function(ownerId) {
		if (ownerId == '-10086') {
			return '系统管理员';
		} else {
			// 发起请求 查 出商家名
			return '商家发布';
		}
		;
	};
	UserAd.toC = function() {
		_toPage('ad/toUserCreate.html');
	};// to add
	
	// 与后台交互
	UserAd.send = function(url, v, s, e) {
		$.ajax({
			url : url,
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
	UserAd.toEdit = function(pid, adid, adname, adurl, addesc, adtdurl, ownerid) {
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
		UserAd.send('ad/edit.html', v, function(d) {
			$('#editAdModal').modal('hide');
			if (d == 1) {
				alert('修改成功！');
				UserAd.toQ();
			} else {
				alert('修改失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	// 删除广告
	UserAd.toRemove = function(pid, adid) {
		$(".removeadform .pid").val(pid);
		$(".removeadform .adid").text(adid);
	};
	$('#page-wrapper').on('click', '.removeadsubmit', function() {
		var v = $('.removeadform').serialize();
		UserAd.send('ad/remove.html', v, function(d) {
			$('#removeAdModal').modal('hide');
			if (d == 1) {
				alert('删除成功！');
				UserAd.toQ();
			} else {
				alert('删除失败！');
			}
		}, function(d) {
			alert('出现异常！');
		});
	});
	
	// event for advertise..导航菜单栏部分
	$('#wrapper').on('click', '.queryadv', function() {
		UserAd.toQ();
	});
	$('#wrapper').on('click', '.addadv', function() {
		UserAd.toC();
	});
	
	// 主页面部分事件
	// event for create ad..
	$('#page-wrapper').on('click', '.addadvbtn', function() {
		var v = $('.addadvform').serialize();
		if (v == '') {
			return;
		}
		$('.addadvbtn').addClass('disabled');
		UserAd.send('ad/create.html', v, function(d) {
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
		UserAd.toQ();
	});
})(window);

//跳转到分页页面
var toPage = function(pageNo, url) {
	var form = $("form .searchform").val();
	$.ajax({
		url : url + '.html?pageNumber=' + pageNo,
		dataType : 'html',
		type : 'POST',
		data : $('.' + form).serialize(),
		success : function(data) {
			$('#page-wrapper').html(data);
			/****广告信息模块****/
			//$('td.ow').each(function() {
				//$(this).html(Adv.getOwner($(this).attr('oid')));
			//});
		},
		error : function() {
			alert('查询失败！');
		}
	});
};
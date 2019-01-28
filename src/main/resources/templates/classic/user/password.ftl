<#include "/classic/utils/ui.ftl"/>
<@layout "修改用户信息">

<div class="panel panel-default stacked">
	<div class="panel-heading">
		<ul class="nav nav-pills account-tab">
			<li><a href="profile">基本信息</a></li>
            <li><a href="email">修改邮箱</a></li>
			<li><a href="avatar">修改头像</a></li>
			<li class="active"><a href="password">修改密码</a></li>
		</ul>
	</div>
	<div class="panel-body">
		<div id="message">
		<#include "/classic/inc/action_message.ftl"/>
		</div>
		<div class="tab-pane active" id="passwd">
			<form id="submitForm" action="password" method="post" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-lg-3" for="password">当前密码</label>
					<div class="col-lg-4">
						<input type="password" class="form-control" name="oldPassword" maxlength="18" placeholder="请输入当前密码" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-3" for="password">新密码</label>
					<div class="col-lg-4">
						<input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码" maxlength="18" required>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-3" for="password2">确认密码</label>
					<div class="col-lg-4">
						<input type="password" class="form-control" name="password2" data-required placeholder="请再输入一遍新密码" maxlength="18" required>
					</div>
				</div>
				<div class="form-group">
					<div class="text-center">
					<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</div><!-- /form-actions -->
			</form>
		</div>
	</div><!-- /panel-content -->
</div><!-- /panel -->

<script type="text/javascript">
$(function () {
    $("#submitForm").validate({
        rules: {
            oldPassword: 'required',
            password: 'required',
            password2: {
                required: true,
                equalTo: "#password"
            }
        },
        messages: {
            password2: {
                required: '请输入确认密码',
                equalTo: '两次输入的密码不一致'
            }
        },
        errorElement: "em",
        errorPlacement: function (error, element) {
            error.addClass("help-block");
            error.insertAfter(element);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).closest("div").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).closest("div").addClass("has-success").removeClass("has-error");
        }
    });

	$('#pw').validate({
		onKeyup : true,
		onChange : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		},
		conditional : {
			confirm : function() {
				return $(this).val() == $('#password').val();
			}
		},
		description : {
			passwd : {
				conditional : '<div class="alert alert-danger">两次输入的密码不一致</div>'
			}
		}
	});
});
</script>
</@layout>
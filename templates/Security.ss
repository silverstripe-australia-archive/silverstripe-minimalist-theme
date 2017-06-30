<!DOCTYPE html>
<html lang="en">
    <head>
        <% base_tag %>
        <meta charset="utf-8">
        <title>Community Demo</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

		<% require themedCSS(foundation-min) %>
		<% require themedCSS(basic) %>
		<% require themedCSS(login) %>

		<!--[if lt IE 9]>
		<script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="//oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
    </head>

    <body class="type-Security">
		<header id="header">
			<div class="content">
				<p id="ss">
					<a href="$BaseHref"><img src="$ThemeDir/images/ss_logo_white.png" /></a>
				</p>
			</div>
		</header>

		<div class="container primary-container">
			<div class="row typography">
				<div class="large-12 columns">
					$Content
					$Form
				</div>
			</div>
		</div>
		<script type="text/javascript">
		//<![CDATA[
		(function($){
			var gLogin = $('#GoogleLoginForm_LoginForm_action_dologin');
			if (gLogin.length > 0){
				gLogin.attr('src', '');
			}
		})(jQuery);
		//]]>
		</script>
		<% require javascript(themes/minimalist-theme/js/foundation.min.js) %>
	</body>
</html>


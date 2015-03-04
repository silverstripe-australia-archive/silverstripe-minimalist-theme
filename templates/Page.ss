<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <% base_tag %>
        <meta charset="utf-8">
        <title>$Site.Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

		<% require themedCSS('normalize') %>
		<% require themedCSS('foundation-min') %>
		<% require themedCSS('info-lists') %>
		<% require themedCSS('typography') %>
		<% require themedCSS('basic') %>

        <link rel="shortcut icon" href="favicon.ico">
        <link rel="apple-touch-icon" href="favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicon.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicon.png">
		
		<!--[if lt IE 9]>
		<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="http://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->

    </head>

    <body class="$ClassName">
		<div class="off-canvas-wrap" data-offcanvas>
			<div class="inner-wrap">
				<% if $HideHeader %>
				<% else %>
				<header class="primary">
					<nav role="navigation" class="top-bar" data-topbar>
						<section class="top-bar-section">
							<% include MemberMenu %>
						</section>
					</nav>
					<% include MainMenu %>
					<div id="searchform-modal" class="reveal-modal full search-modal" data-reveal>
						$SearchForm
					</div>
				</header>
				
				<% end_if %>
				<a class="exit-off-canvas"></a>
				<div class="container <% if $HideHeader %>hide-wrapping<% end_if %> primary-container<% if CSSClassesFor('Body') %> $CSSClassesFor('Body')<% end_if %>">
					$PreLayout
					
					$Layout
					
					$PostLayout
				</div>
		 
				$Footer
		
				<% if $AllowComments %>
					<input type="hidden" id="pageAndId" value="$ClassName$ID" />
				<% end_if %>
				<div id="comments-modal" class="reveal-modal xlarge" data-reveal></div>
			</div>
		</div>
		
	</body>
</html>


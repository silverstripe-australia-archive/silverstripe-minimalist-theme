<section class="main typography">
	<% include Breadcrumbs %>
	<div class="row content-start">
		<div class="large-8 columns">
			<h1>$Title</h1>
			$Content
			$Form
		</div>
		<div class="large-3 columns">
			<div class="actions-panel" data-saveable-info="$ClassName-$ID"></div>
			<% include Commenter Targeted=1 %>
		</div>
	</div>
</section>
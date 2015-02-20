<section class="main typography">
	<% include Breadcrumbs %>
	<div class="row content-start">
		<div class="large-11 columns">
			<h1>$Title</h1>
			
			$Content
			
			<% if Action == "index" %>
				<div class="actions-panel">$Form</div>
			<% else %>
				$Form
			<% end_if %>
			
			<p><span class="label">Created</span><span class="value">$Created.Nice</span></p>
			<p><span class="label">Last modified</span><span class="value">$LastEdited.Nice</span></p>
			
		</div>
		<div class="large-1 columns">
			<div class="actions-panel" data-saveable-info="$ClassName-$ID"></div>
			<% include Commenter Targeted=1 %>
		</div>
	</div>
</section>
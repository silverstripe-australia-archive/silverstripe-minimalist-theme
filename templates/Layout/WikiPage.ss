<% include PageMeta %>

<div class="typography">
	<h1>$Title</h1>
	$Content
	<% if Action == "index" %>
		<div class="actions-panel">$Form</div>
	<% else %>
		$Form
	<% end_if %>
</div>
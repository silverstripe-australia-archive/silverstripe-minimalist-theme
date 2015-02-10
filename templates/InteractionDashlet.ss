<% if Items %>
	<ol>
		<% loop Items %>
			<li>
				<div class="dashlet-item-info">$Views <span class="glyphicon glyphicon-eye-open"></span></div>
				<a href="$Link" data-pageid="$ItemID">$Title</a>
			</li>
		<% end_loop %>
	</ol>
<% end_if %>

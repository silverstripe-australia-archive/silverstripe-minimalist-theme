<div class="page-meta">
	<ul class="clearfix">
		<li>
			<span class="label">Created</span>
			<span class="value">$Created.Nice</span>
		</li>
		<li>
			<span class="label">Last modified</span>
			<span class="value">$LastEdited.Nice</span>
		</li>
		<%-- Basic breadcrumb for levels 2 and 3 --%>
		<% if Level(2) %><% if $Level(2).ID != $ID %>
			<li>
				<span class="label">Located in</span>
				<span class="value">
				<% with Level(2) %>
					<a href="$Link">$MenuTitle</a><% end_with %>
					<% if Level(3) %>
						<% if $Level(3).ID != $ID %>
						/ <% with Level(3) %><a href="$Link">$MenuTitle</a><% end_with %>
						<% end_if %>
					<% end_if %>
				</span>
			</li>
		<% end_if %><% end_if %>
	</ul>
</div>
<% if Level(2) %><% if $Level(2).ID != $ID %>
	<li>
		<span class="label">In</span>
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
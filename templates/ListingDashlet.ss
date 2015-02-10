<% if Items %>
	<ul id="ListingDashlet-$ID" class="type-$ListType.ATT">
		<% loop Items %>
			<li><% if Link %><a href="$Link">$Title.XML</a><% else %>$Title.XML<% end_if %></li>
		<% end_loop %>
	</ul>
<% end_if %>
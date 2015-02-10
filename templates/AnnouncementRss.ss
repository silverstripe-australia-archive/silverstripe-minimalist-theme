<% if $getRSS %>
	<% if $RssHeader %>
	<h3>$RssHeader</h3>
	<% end_if %>
	<% loop $RSS %>
		<p class="rss-item">
			<a href="$link" target='_blank' class='external'>$title</a><br />
			<span class="meta text-small">$ItemDate.Nice</span>
		</p>
	<% end_loop %>
<% else %>
	<p>Feed currently unavailable</p>
<% end_if %>
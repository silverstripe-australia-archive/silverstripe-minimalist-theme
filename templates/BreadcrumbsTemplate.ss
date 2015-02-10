<% if $Pages %>
	<ul class="breadcrumbs">
		<% loop $Pages.exclude("ClassName", "Site") %>
			<li>
				<% if $Last %>
					$MenuTitle.XML
				<% else %>
					<a href="$Link" data-urlsegment="$URLSegment" class="breadcrumb-$Pos">$MenuTitle.XML</a>
				<% end_if %>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>

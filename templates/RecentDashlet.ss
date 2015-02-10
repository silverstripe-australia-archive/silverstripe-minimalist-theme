<div class="dashlet-content-anchor recent-dashlet-content">
	<% if Items %>
		<ol class="recent-dashlet">
			<% loop Items %>
				<li class="clearfix">
					<div class="dashlet-item-info">$LastEdited.TimeDiff <span class="ago">ago</span></div>
					<a href="$Link" data-pageid="$ID">$Title.XML</a>
				</li>
			<% end_loop %>
		</ol>
	<% end_if %>
</div>
<input id="DashboardID" value="$Dashboard.ID" type="hidden" />
<input id="DashboardUrl" value="$Link" type="hidden"/>

<div class="main typography">
	<div class="bg-image" style="background-image: url($ThemeDir/images/wallpaper.png)"></div>
	$Dashboard
</div>

<div class="actions-panel">
	<div id="header-buttons" class="actions-items clearfix">
		<a href="$Link(adddashlet)" title="Add a dashlet" data-reveal-id="add-dashlet-modal" data-reveal-ajax="true">
			<span class="typcn typcn-plus"></span>
		</a>
		<a href="timeline" class="comment-list-trigger" title="Comments ($ContextUser.UnreadPosts.count unread)">
			<span class="typcn typcn-messages"></span>
			<% if $ContextUser.UnreadPosts.count %>
			<span class="comment-count comment-count-$ContextUser.UnreadPosts.count" >$ContextUser.UnreadPosts.count</span>
			<% else %>
			<span class="comment-count comment-count-0"></span>
			<% end_if %>
			<span class="visually-hidden">Comments</span>
		</a>
	</div>
</div>

<div id="add-dashlet-modal" class="reveal-modal small" data-reveal></div>
<div id="edit-dashlet-modal" class="reveal-modal small" data-reveal></div>

<% require javascript('themes/ssau-minimalist/js/dashboards.js') %>
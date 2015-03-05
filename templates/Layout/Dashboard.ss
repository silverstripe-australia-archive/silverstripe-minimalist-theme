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
		<% include Commenter %>
	</div>
</div>

<div id="add-dashlet-modal" class="reveal-modal small" data-reveal></div>
<div id="edit-dashlet-modal" class="reveal-modal small" data-reveal></div>

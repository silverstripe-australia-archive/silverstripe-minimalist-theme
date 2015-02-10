<ul class="right">
<% if $ContextUser %>
	<li class="member icon has-dropdown">
		<a href="#" class="toggle-menu" title="My actions">
			<span class="typcn typcn-user-outline"></span>
			<span class="title hide">My actions</span>
		</a>
		<ul class="dropdown">
			<% with $List("SiteDashboardPage") %>
				<% if Count != 0 %><li><a href="$First.Link">Dashboard</a></li><% end_if %>
			<% end_with %>
			<% with $List("MemberProfilePage") %>
				<% if Count != 0 %><li><a href="$First.Link">Profile</a></li><% end_if %>
			<% end_with %>
		</ul>
	</li>
	<%-- Favourites/bookmarks --%>
	<li class="favourites-listing icon has-dropdown">
		<a class="toggle-menu" href="#" title="View favourites">
			<span class="typcn typcn-bookmark"></span>
			<span class="title hide">Favourites</span>
		</a>
		<ul class="dropdown saved-info-listing"></ul>
	</li>
<% else %>
	<% with $List("MemberProfilePage").First %>
		<li class="login icon clearfix">
			<a href="$Link">
				<span class="typcn typcn-lock-closed-outline"></span>
				<span class="title">$Title</span>
			</a>
		</li>
	<% end_with %>
<% end_if %>
	<li class="icon">
		<a href="#" class="right-off-canvas-toggle" aria-expanded="false" title="Open menu">
			<span class="typcn typcn-th-menu"></span>
		</a>
	</li>
</ul>
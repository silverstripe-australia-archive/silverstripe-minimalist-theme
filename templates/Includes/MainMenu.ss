<% if SiteMenu(1) %>
	<nav role="navigation" class="right-off-canvas-menu">
		<ul class="off-canvas-list">
			<li><span class="label">Menu</span></li>
			<% loop SiteMenu(1) %>
				<% if $Children %>
					<li class="has-submenu"><a href="$Link">$MenuTitle</a>
						<ul class="right-submenu">
							<li class="back">
								<a class="text-right" href="#" title="Close this menu">
									<span class="visually-hidden">Back</span>
									<span class="round-icon"><span class="typcn typcn-arrow-right"></span></span>
								</a>
							</li>
							<li><span class="label">$MenuTitle</label></li>
							<% loop Children %>
								<li><a href="$Link">$MenuTitle</a></li>
							<% end_loop %>
						</ul>
				<% else %>
					<li><a href="$Link">$MenuTitle</a>
				<% end_if %>
				</li>
			<% end_loop %>
		</ul>
	</nav>
<% end_if %>
<nav role="navigation">
	<ul>
		<% loop Menu(1) %>
			<li class="$LinkingMode<% if $LinkingMode = "current" || $LinkingMode = "section"%> active<% end_if %>"><a href="$Link">$MenuTitle.XML</a></li>
		<% end_loop %>
	</ul>
</nav>
<div class="nav-toggle"><span class="glyphicon glyphicon-chevron-left"></span></div>
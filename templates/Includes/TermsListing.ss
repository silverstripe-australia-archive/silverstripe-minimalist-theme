<% if Terms %>
	<dl class="taxonomy bottom-divider">
		<dt><span class="typcn typcn-tags"></span> Tags</dt>
		<dd>
			<ul class="inline-list">
				<% loop Terms %>
					<li class="label outline round">$Name</li>
				<% end_loop %>
			</ul>
		</dd>
	</dl>
<% end_if %>
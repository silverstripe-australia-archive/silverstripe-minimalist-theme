<% if Results.MoreThanOnePage %>
	<nav class="$Position">
		<ul class="pagination clearfix">
			<% if Results.NotFirstPage %>
				<li class="prev"><a href="$Results.PrevLink" title="View the previous page">Prev</a></li>
			<% end_if %>
			<% loop Results.PaginationSummary(5) %>
				<li>
					<% if CurrentBool %>
						<span class="current">$PageNum</span>
					<% else %>
						<% if Link %>
							<a class="link" href="$Link" title="View page number $PageNum">$PageNum</a>
						<% else %>
							<span class="nonav">&hellip;</span>
						<% end_if %>
					<% end_if %>
				</li>
			<% end_loop %>
			<% if Results.NotLastPage %>
				<li class="next"><a href="$Results.NextLink" title="View the next page">Next</a></li>
			<% end_if %>
		</ul>
	</nav>
<% end_if %>
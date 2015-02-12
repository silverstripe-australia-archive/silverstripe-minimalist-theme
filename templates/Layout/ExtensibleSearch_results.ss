<section class="main typography">
	<h1>Search results</h1>
	<% if FacetCrumbs %>
		<ul class="facetCrumbs">
			<% loop FacetCrumbs %>
				<li><a href="$RemoveLink">$Name</a></li>
			<% end_loop %>
		</ul>
	<% end_if %>

	$Content
	
	<% include SearchPagination Position="top" %>
	
	<% if Results %>
		<% if ListingTemplateID %>
			$TemplatedResults
		<% else %>
			<ul class="plain results-list">
				<% loop Results %>
					<li>
						<% if MenuTitle %>
							<h2><a class="result-title" href="<% if HolderAnchorLink %>$HolderAnchorLink<% else %>$Link<% end_if %>">$MenuTitle</a></h2>
						<% else %>
							<h2><a class="result-title" href="<% if HolderAnchorLink %>$HolderAnchorLink<% else %>$Link<% end_if %>">$Title</a></h2>
						<% end_if %>
						<% if Content %>
							<p class="summary">$Content.Summary</p>
						<% else_if MetaDescription %>
							<p class="summary">$MetaDescription</p>
						<% end_if %>
						<p class="more">
							<% if HolderAnchorLink %>
								<a class="meta" href="$HolderAnchorLink" title="Read more about &quot;{$Title}&quot;">$HolderAnchorLink</a>
							<% else %>
								<a class="meta" href="$Link" title="Read more about &quot;{$Title}&quot;">$Link</a>
							<% end_if %>
						</p>
					</li>
				<% end_loop %>
			</ul>
		<% end_if %>
	<% else %>
		<p>Sorry, your search query did not return any results.</p>
	<% end_if %>

	<% include SearchPagination Position="bottom" %>

</section>

<section class="main typography">
	<div class="row">
		<div class="large-12 columns">
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
									<h2 class="text-large"><a class="result-title" href="<% if HolderAnchorLink %>$HolderAnchorLink<% else %>$Link<% end_if %>">$MenuTitle</a></h2>
								<% else %>
									<h2 class="text-large"><a class="result-title" href="<% if HolderAnchorLink %>$HolderAnchorLink<% else %>$Link<% end_if %>">$Title</a></h2>
								<% end_if %>
								<% if Content %>
									<p class="summary">$Content.Summary</p>
								<% else_if MetaDescription %>
									<p class="summary">$MetaDescription</p>
								<% end_if %>
								<p class="more">
									<span class="meta date">Last update <em>$LastEdited.Format(d M Y g:i a)</em></span> <a class="text-small" href="$Link" title="Read more about &quot;{$Title}&quot;">$AbsoluteLink</a>
								</p>
							</li>
						<% end_loop %>
					</ul>
				<% end_if %>
			<% else %>
				<p>Sorry, your search query did not return any results.</p>
			<% end_if %>
		
			<% include SearchPagination Position="bottom" %>
		</div>
	</div>

</section>

<% require themedCSS("info-lists") %>

<div class="main typography">

	<div class="banner full-banner">
		<div class="row">
			<div class="large-12 columns">
				<div class="decor decor-icons">
					<span class="typcn typcn-calendar-outline"></span>
				</div>
				<p class="title">
					<a class="white" href="$Parent.Link">
						<span class="typcn typcn-arrow-back"></span>
						<span class="text-small">$Parent.Title</span>
					</a>
				</p>
			</div>
		</div>
	</div>
	
	<div class="row content-start">
	
		<div class="large-8 columns">
			<h1>$Title</h1>
			<p class="meta date-time"><% with $CurrentDate %>$DateRange<% end_with %></p>
			$Content
		</div>
		
		<aside class="large-3 columns">
			<div class="actions-panel" data-saveable-info="$ClassName-$ID">
				<% with $CurrentDate %>
					<a href="$ICSLink" title="<% _t('CalendarEvent.ADD','Add to Calendar') %>">
						<span class="typcn typcn-calendar-outline"></span>
					</a>
				<% end_with %>
			</div>
			<% include TermsListing %>

			<a href="{$BaseHref}timeline?tags=$ClassName$ID" class="comment-list-trigger in-page-action" title="View comments" data-tooltip aria-haspopup="true">
				<span class="typcn typcn-messages"></span>
				<% if $ContextUser.UnreadPosts.count %>
					<span class="comment-count comment-count-$ContextUser.UnreadPosts.count" >$ContextUser.UnreadPosts.count</span>
				<% else %>
					<span class="comment-count comment-count-0"></span>
				<% end_if %>
				<span class="visually-hidden"> comments</span>
			</a>
		</aside>
	</div>

</div>
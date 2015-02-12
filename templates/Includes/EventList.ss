
<% loop Events %>
<div class="vevent row">
	<div class="large-9 columns">
		<h3 class="summary"><% if Announcement %>$Title<% else %><a class="url" href="$Link">$Event.Title</a><% end_if %></h3>
		<p class="dates meta">$DateRange <% if AllDay %><% _t('ALLDAY','All Day') %><% else %><% if StartTime %>$TimeRange<% end_if %><% end_if %></p>
		<% if Announcement %>
			$Content
		<% else %>
			<% with Event %>$Content.LimitWordCount(40)<% end_with %> <a href="$Link"><% _t('MORE','Read more&hellip;') %></a>
		<% end_if %>
		<% if OtherDates %>
			<div class="event-calendar-other-dates">
				<h4><% _t('Calendar.ADDITIONALDATES','Additional Dates for this Event') %>:</h4>
				<ul>
					<% loop OtherDates %>
					<li><a href="$Link" title="$Event.Title">$DateRange <% if StartTime %> $TimeRange<% end_if %></a></li>
					<% end_loop %>
				</ul>
			</div>
		<% end_if %>
	</div>
	<div class="large-3 columns">
		<p>
			<a href="$ICSLink">
				<span class="round-icon">
					<span class="typcn typcn-calendar-outline"></span>
				</span>
				<span class="label"><% _t('ADD','Get ICS info') %></span>
			</a>
		</p>
	</div>
</div>
<% end_loop %>

<% if MoreEvents %>
<a href="$MoreLink" class="calendar-view-more"><% _t('Calendar.VIEWMOREEVENTS','View more events...') %></a>
<% end_if %>

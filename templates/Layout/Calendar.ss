<div class="main typography">

	<div class="banner full-banner">
		<div class="row has-title has-buttons">
			<div class="large-6 columns">
				<h1 class="title small-title">$Title</h1>
			</div>
			<div class="large-3 columns">
				<a class="button outline white" href="#" data-reveal-id="calendar-nav-modal">Open date navigator</a>
			</div>
			<div class="large-3 columns">
				<a class="rss button outline white" href="$Link(rss)" title="<% _t('SUBSCRIBE','Calendar RSS Feed') %>">
					<span class="typcn typcn-rss"></span>
				</a>
			</div>
		</div>
	</div>

	<div class="row content-start">

		<div class="large-8 columns">

			$Content
			
			<h2 class="text-medium text-light">$DateHeader</h2>

			<% if Events %>
				<div id="event-calendar-events">
					<% include EventList %>
				</div>
			<% else %>
				<p><% _t('NOEVENTS','There are no events') %>.</p>
			<% end_if %>
			
		</div>

		<div class="large-3 columns">
			<div class="event-calendar-controls reveal-modal" id="calendar-nav-modal" data-reveal>
				<div class="widget-navigator">
					$CalendarWidget
				</div>
				<div class="month-jumper">
					$MonthJumper
				</div>
				<%-- <% include QuickNav %> --%>
			</div>
		</div>

	</div>
</div>

<% require javascript('themes/symbiote-minimalist/Calendar.js') %>
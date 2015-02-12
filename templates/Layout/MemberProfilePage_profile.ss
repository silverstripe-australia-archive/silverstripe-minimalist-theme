<section class="main typography">
	<div class="banner full-banner">
		<div class="row">
			<div class="large-12 columns">
				<h1>$Title</h1>
				<ul class="tabs" data-tab role="tablist">
					<li class="tab-title active" role="presentational" >
						<a href="#panel1" role="tab" tabindex="0" aria-selected="true" controls="panel1">
							<span class="typcn typcn-user-outline"></span>&nbsp;Profile
						</a>
					</li>
					<li class="tab-title" role="presentational" >
						<a href="#panel2" role="tab" tabindex="0"aria-selected="false" controls="panel2">
							<span class="typcn typcn-messages"></span>&nbsp;Posts
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="tabs-content">
		<div id="panel1" class="content active">
			<div class="row">
				<div class="large-12 columns">
					$Content
					<% if $CanAddMembers %>
						<p><%t MemberProfiles.ADDMEMBERLINK 'You can use this page to <a href="{addLink}">add a new member</a>.' addLink=$Link(add) %></p>
						<h2><%t MemberProfiles.YOURPROFILE 'My profile' %></h2>
						$Form
					<% else %>
						<h2><%t MemberProfiles.YOURPROFILE 'My profile' %></h2>
						$Form
					<% end_if %>
				</div>
			</div>
		</div>
		<div id="panel2" class="content">
			<div class="row">
				<div class="large-6 columns">
					<% if $CurrentUser %>
						<h2>Latest posts</h2>
						<p><a href="timeline/user/$CurrentUser.ID">My timeline</a></p>
						<div class="posts my-posts">
							<% if $List('MicroPost').Filter('OwnerID', $CurrentUser.ID).Sort('Created DESC').Limit(10) %>
								<% loop $List('MicroPost').Filter('OwnerID', $CurrentUser.ID).Sort('Created DESC') %>
									<h3 class="title text-medium text-light no-space-below">$Title</h3>
									<ul class="meta inline-list">
										<li><span class="date">$LastEdited.Format('d M Y')</span></li>
										<li>$NumReplies replies</li>
										<li><a href="$Link">View thread</a></li>
									</ul>
								<% end_loop %>
							<% else %>
								<p>No posts.</p>
							<% end_if %>
						</div>
					<% end_if %>
				</div>
				<div class="large-6 columns">
				</div>
			</div>
		</div>
	</div>
</section>

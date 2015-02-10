<% require css(memberprofiles/css/MemberProfileViewer.css) %>
<section class="main typography">
	<div class="row">
		<div class="large-12 columns">
			<h1>$Title</h1>
			
			<div class="content member-profile <% if IsSelf %>member-profile-self<% end_if %>">
				<% if IsSelf %>
					<p class="message"><%t MemberProfiles.THISISYOURPROFILE 'This is your profile!' %> <a href="$Parent.Link"><%t MemberProfiles.EDITPROFILE 'Edit Profile' %></a></p>
				<% end_if %>
				<% loop Sections %>
					<div id="$ClassName" class="member-profile-section">
						<% if ShowTitle %><h3>$Title</h3><% end_if %>
						$Me
					</div>
				<% end_loop %>
			</div>
		</div>
	</div>
</section>
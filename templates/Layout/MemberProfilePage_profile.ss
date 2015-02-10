<section class="main typography">
	<div class="row">
		<div class="large-12 columns">

			<h1>$Title</h1>
			$Content

			<% if $CanAddMembers %>
				<h2><%t MemberProfiles.ADDMEMBER 'Add Member' %></h2>
				<p><%t MemberProfiles.ADDMEMBERLINK 'You can use this page to <a href="{addLink}">add a new member</a>.' addLink=$Link(add) %></p>
				<h2><%t MemberProfiles.YOURPROFILE 'Your Profile' %></h2>
				$Form
			<% else %>
				$Form
			<% end_if %>

		</div>
	</div>
</section>

<% if $Poll.Visible %>
	<% if $Poll.Description %>
		$Poll.Description
	<% end_if %>

	<% if not CurrentUser %>
		<p><a href="$List('MemberProfilePage').First.Link" class="btn">Register to vote</a></p>
	<% else %>
		<% if $ShouldShowResults %>
			<p>Thanks for your vote!</p>
			<p>And for the scavengers out there, the final answer is</p><p>SilverStripe Australia</p>
		<% else %>
			$DefaultForm
		<% end_if %>
	<% end_if %>
<% end_if %>

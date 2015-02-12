<span class="round-icon">
	<span class="typcn typcn-messages"></span>
</span>
<span class="label">
	<% if $ContextUser.UnreadPosts.count %>
		<span class="comment-count comment-count-$ContextUser.UnreadPosts.count" >$ContextUser.UnreadPosts.count</span>
	<% else %>
		<span class="comment-count comment-count-0"></span> 
	<% end_if %> Comments
</span>
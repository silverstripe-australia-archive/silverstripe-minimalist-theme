<% if Posts %>
	<% if $QueryOffset %>
	<input type="hidden" value="$QueryOffset.ATT" name="postOffset" />
	<% end_if %>
	<% if SortBy %>
	<input type="hidden" value="$SortBy.ATT" name="timelineSort" />
	<% end_if %>

	<% loop Posts %>
		<div class="microPost row <% if $ParentID > 0 %>hasparent<% else %>toplevel <% if $Top.Options.ShowTitlesOnly %>collapsed-post<% end_if %> <% end_if %><% if $isUnreadByUser %> unread<% end_if %>" data-id="$ID" data-owner="$Owner.ID" data-parent="$ParentID" id="post$ID" data-rating="$WilsonRating" data-sortby="$Top.SortBy" data-editable="1">
			<div class="postOptions large-3 columns">
				<div class="author">
					<p class="details">
						<span><% if $Owner.ID == $ContextUser.ID %>Me<% else %>$Owner.FirstName<% end_if %></span><br />
						<abbr class="meta postTime" title="$Created" data-created="$Created">$Created.Format("d M Y")</abbr>
						<% if $isEdited %>
							<span class="edited-mark" title="Edited at $LastEdited">*</span>
						<% end_if %>
					</p>
				</div>
				
				<div class="post-actions">
				<% if $Top.Options.Voting %>
				<a href="#" class="vote" data-dir="1" data-id="$ID">Up</a>
				<a href="#" class="vote" data-dir="-1" data-id="$ID">Down</a>
				<span class="upCount">$Up</span><span class='vote-separator'>|</span><span class="downCount">$Down</span>
				<% end_if %>
				
				<% if $ParentID == 0 %>
					<a href="$Link" class="permaLink" data-tooltip aria-haspopup="true" class="has-tip" title="Permalink">
						<span class="typcn typcn-link-outline"></span>
					</a>&nbsp;
				<% end_if %>
				
				<% if Deleted %>
				<% else %>
					<% if checkPerm('Delete') %>
						<a href="#" class="deletePost" title="Delete this post" data-tooltip aria-haspopup="true" class="has-tip">
							<span class="typcn typcn-trash"></span>
						</a>&nbsp;
					<% end_if %>
				<% end_if %>
				
				<% if not $Top.Options.ShowReply %>
				<a href="#" class="replyToPost">reply</a>
				<% end_if %>
				</div>
				
			</div>
			
			<% if $Top.Options.ShowTitlesInPost && $ParentID == 0 %>
			<h3 class="micro-post-title">
				<% if $Top.Options.ShowTitlesOnly %>
				<a class="post-expander" data-id="post$ID" href="$Link" title="Link to view the full text of $Title.ATT">$Title</a>
				<% else %>
				$Title
				<% end_if %>
			</h3>
			<% end_if %>
				
			<div class="microPostContent postText typography large-8 columns">
				<% include PostContent %>
				
				<% if $ParentID == 0 || $Top.Options.Threaded %>
					<%-- note that the action is left blank and filled in with JS because otherwise the
					recursive template loses context of what to fill in, so we use our top level form --%>
					<div class="reply">
						<form id="replyTo$ID" method="POST" action="" class="replyForm <% if not $Top.Options.ShowReply %>visually-hidden<% end_if %>">
							<input type="hidden" value="$SecurityID" name="SecurityID" />
							<input type="hidden" name="ParentID" value="$ID" />
							<textarea placeholder="Add reply..." name="Content" class="expandable postContent"></textarea>
							<div class="Actions">
								<input type="submit" value="Reply" name="action_savepost" />
								<button class="no-style toggle-reply small">Cancel</button>
							</div>
						</form>
						<button class="no-style toggle-reply small">
							<span class="typcn typcn-arrow-forward-outline"></span> Reply
						</button>
					</div>
				<% end_if %>
				
				<!-- needed to match >.microPostContent>.postReplies selector for auto-loading replies -->
				<div class="postReplies">
				<% if $Top.Options.Replies %>
					<% if Posts %>
						<% include Timeline Options=$Top.Options %>
					<% end_if %>
				<% end_if %>
				</div>
			</div>
		</div>
	<% end_loop %>
<% end_if %>

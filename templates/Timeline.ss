<% if Posts %>
	<% loop Posts %>
		<div class="microPost row <% if $ParentID > 0 %>hasparent<% else %>toplevel<% end_if %><% if $isUnreadByUser %> unread<% end_if %>" data-id="$ID" data-owner="$Owner.ID" data-parent="$ParentID" id="post$ID" data-rating="$WilsonRating" data-sortby="$Top.SortBy" data-editable="1">
			<div class="postOptions large-4 columns">
				<div class="author">
					<p class="details">
						<span><% if $Owner.ID == $ContextUser.ID %>Me<% else %>$Owner.FirstName<% end_if %></span><br />
						<abbr class="meta postTime" title="$Created" data-created="$Created">$Created.Format("d M Y")</abbr>
						<% if $isEdited %>
							<span class="edited-mark" title="Edited at $LastEdited">*</span>
						<% end_if %>
					</p>
				</div>
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
			</div>
			
			<div class="postText typography large-8 columns">
				<% include PostContent %>
				<% if $ParentID == 0 %>
					<%-- note that the action is left blank and filled in with JS because otherwise the
					recursive template loses context of what to fill in, so we use our top level form --%>
					<div class="reply">
						<form method="POST" action="" class="replyForm visually-hidden">
							<input type="hidden" value="$SecurityID" name="SecurityID" />
							<input type="hidden" name="ParentID" value="$ID" />
							<textarea placeholder="Add reply..." name="Content" class="expandable postContent"></textarea>
							<div class="Actions">
								<input type="submit" value="Reply" name="action_savepost" />
								<button class="no-style toggle-reply">Cancel</button>
							</div>
						</form>
						<button class="no-style toggle-reply"><span class="typcn typcn-arrow-forward-outline"></span> Reply</button>
					</div>
				<% end_if %>
				<% if Top.ShowReplies %>
					<div class="postReplies">
						<% if Posts %>
							<% include Timeline ShowReplies=0 %>
						<% end_if %>
					</div>
				<% end_if %>
			</div>
		</div>
	<% end_loop %>
<% end_if %>

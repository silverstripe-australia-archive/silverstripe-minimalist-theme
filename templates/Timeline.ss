<% if Posts %>
	<% if $QueryOffset %>
		<input type="hidden" value="$QueryOffset.ATT" name="postOffset" />
	<% end_if %>
	<% if SortBy %>
		<input type="hidden" value="$SortBy.ATT" name="timelineSort" />
	<% end_if %>

	<% loop Posts %>
		<div class="row">
			<div class="microPost <% if $ParentID > 0 %>hasparent<% else %>toplevel <% if $Top.Options.ShowTitlesOnly %>collapsed-post<% end_if %> <% end_if %><% if $isUnreadByUser %> unread<% end_if %>" data-id="$ID" data-owner="$Owner.ID" data-parent="$ParentID" id="post$ID" data-rating="$WilsonRating" data-sortby="$Top.SortBy" data-editable="1">
		
				<div class="large-4 columns">
					<div class="postOptions">
						<div class="author">
							<p class="details">
								<span><% if $Owner.ID == $ContextUser.ID %>Me<% else %>$Owner.FirstName<% end_if %></span>
								<abbr class="meta postTime" title="$Created" data-created="$Created">$Created.Format("d M Y")</abbr>
								<% if $isEdited %>
									<span class="edited-mark" title="Edited at $LastEdited">*</span>
								<% end_if %>
							</p>
						</div>
						<% if Deleted %>
						<% else %>
							<% if checkPerm('Delete') %>
								<a href="#" class="deletePost" title="Delete this post" data-tooltip aria-haspopup="true" class="has-tip">
									<span class="typcn typcn-trash"></span>
								</a>&nbsp;
							<% end_if %>
						<% end_if %>
					</div>
					<% if $ParentID > 0 %><% else %>
						<div class="post-actions">
							<% if $Top.Options.Voting %>
								<ul class="inline-list">
									<li>
										<a href="#" class="vote" data-dir="1" data-id="$ID" title="Vote up">
											<span class="typcn typcn-thumbs-up"></span>
										</a>
										<span class="upCount">$Up</span>
									</li>
									<li>
										<a href="#" class="vote" data-dir="-1" data-id="$ID" title="Vote down">
											<span class="typcn typcn-thumbs-down"></span>
										</a>
										<span class="downCount">$Down</span>
									</li>
								</ul>
							<% end_if %>
						
							<% if $ParentID == 0 %>
								<a href="$Link" class="permaLink" data-tooltip aria-haspopup="true" class="has-tip" title="Permalink">
									<span class="typcn typcn-link-outline"></span>
								</a>&nbsp;
							<% end_if %>
						
							<% if not $Top.Options.ShowReply %>
								<a href="#" class="replyToPost">reply</a>
							<% end_if %>
						</div>
					<% end_if %>
				</div>
				<div class="large-8 columns">
					<% if $Top.Options.ShowTitlesInPost && $ParentID == 0 %>
					<h3 class="micro-post-title">
						<% if $Top.Options.ShowTitlesOnly %>
						<a class="post-expander" data-id="post$ID" href="$Link" title="Link to view the full text of $Title.ATT">$Title</a>
						<% else %>
						$Title
						<% end_if %>
					</h3>
					<% end_if %>
					<div class="microPostContent postText typography">
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
										<button class="no-style toggle-reply small">
											<span class="typcn typcn-cancel-outline text-large"></span>&nbsp;Cancel
										</button>
									</div>
								</form>
								<button class="toggle-reply small">
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
						
						<% if $ParentID > 0 %>
							<div class="post-actions">
								<% if $Top.Options.Voting %>
									<a href="#" class="vote" data-dir="1" data-id="$ID" title="Vote up"><span class="typcn typcn-thumbs-up"></span></a> <span class="upCount">$Up</span>
									<a href="#" class="vote" data-dir="-1" data-id="$ID" title="Vote down"><span class="typcn typcn-thumbs-down"></span></a> <span class="downCount">$Down</span>
								<% end_if %>
							
								<% if $ParentID == 0 %>
									<a href="$Link" class="permaLink" data-tooltip aria-haspopup="true" class="has-tip" title="Permalink">
										<span class="typcn typcn-link-outline"></span>
									</a>&nbsp;
								<% end_if %>
							
								<% if not $Top.Options.ShowReply %>
									<a href="#" class="replyToPost">reply</a>
								<% end_if %>
							</div>
						<% end_if %>
					</div>
				</div>

			</div><%-- end .microPost --%>
		</div><%-- end .row --%>
	<% end_loop %>
<% end_if %>

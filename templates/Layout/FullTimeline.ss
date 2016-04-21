<section class="main typography content-start">
	
	<div class="timeline-box">
	<input type="hidden" id="MemberDetails" data-member='$MemberDetails.ATT' />
	<input type="hidden" value="$PostForm.FormAction" id="PostFormUrl" />
	

	<% if $Post %>
		<input type="hidden" name="timelineUpdateUrl" value="$Link(flatlist)/$Post" />
		<div class="StatusFeed autorefresh row">
			<div class="large-12 columns">
				$Timeline
			</div>
		</div>
	<% else %>
		<input type="hidden" name="timelineUpdateUrl" value="$Link(flatlist)" />
		<% if $ContextUser %>
			<div class="row">
				<div class="large-12 columns">
					
					<div class="postForm content large" id="post-something">
						<% with PostForm %>
							<% include PostForm Options=$Top.Options %>
						<% end_with %>
					</div>
				</div>
			</div>

			<% if $Top.Options.EnableUploads %>
			<% with UploadForm %>
			<form $FormAttributes >
			$HiddenFields
			<% with FieldMap %>
			$Attachment.FieldHolder
			<% end_with %>
			</form>
			<% end_with %>
			<% end_if %>

		<% end_if %>

		<div class="StatusFeed autorefresh row">
			<div class="large-12 columns">
				$Timeline
			</div>
		</div>

		<div class="row">
			<div class="feed-actions large-12 columns">
				<a href="#" class="moreposts button secondary expand">Load more...</a>
			</div>
		</div>

	<% end_if %>
	</div>
</section>
<section class="main typography content-start">
	
	<input type="hidden" id="MemberDetails" data-member='$MemberDetails.ATT' />
	<input type="hidden" value="$PostForm.FormAction" id="PostFormUrl" />

	<div class="row">
		<div class="large-12 columns">
		<% if $ContextUser %>
			<div class="uploadForm">
				<% with $UploadForm %>
					<form $FormAttributes>
						<% with FieldMap %>
							$Attachment
						<% end_with %>
						<ul id="uploadedFiles"></ul>
						$HiddenFields
					</form>
				<% end_with %>
			</div>
		<% end_if %>
		</div>
	</div>
		
	<input type="hidden" name="timelineUpdateUrl" value="$Link(flatlist)" />

	<% if $Post %>
		<div id="StatusFeed" class="autorefresh row">
			<div class="large-12 columns">
				$Timeline
			</div>
		</div>
	<% else %>
		<% if $ContextUser %>
			<div class="row">
				<div class="large-12 columns">
					<% with PostForm %>
						<% include PostForm %>
					<% end_with %>
				</div>
			</div>
		<% end_if %>

		<div id="StatusFeed" class="autorefresh row">
			<div class="large-12 columns">
				$Timeline
			</div>
		</div>

		<div class="row">
			<div class="feed-actions large-12 columns">
				<a href="#" class="moreposts button expand">Load more...</a>
			</div>
		</div>

	<% end_if %>

</section>
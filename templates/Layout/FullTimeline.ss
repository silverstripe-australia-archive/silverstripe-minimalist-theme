<section class="main typography">
	
	<input type="hidden" id="MemberDetails" data-member='$MemberDetails.ATT' />
	<input type="hidden" value="$PostForm.FormAction" id="PostFormUrl" />
			
	<div class="row">
		<div class="large-12 columns">
		<% if $ContextUser %>
			<div class="uploadForm">
				<% with $UploadForm %>
					<form $FormAttributes>
						<% with FieldMap %>
							<input type="hidden" name="SecurityID" value="$SecurityID" />
							$Attachment
						<% end_with %>
						<ul id="uploadedFiles"></ul>
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
					<div class="postForm">
						<% with PostForm %>
							<form $FormAttributes >
								<% with FieldMap %>
									$Content
									<input type="hidden" name="SecurityID" value="$SecurityID" />
									$Up.Actions
									<input type="button" name="uploadTrigger" value="Upload" />
									<% if $PostTarget %>
										<p>Include</p>
										$PostTarget
									<% end_if %>
								<% end_with %>
							</form>
						<% end_with %>
					</div>
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

		</div>

	<% end_if %>

</section>
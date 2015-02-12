<section class="main typography">
	<div class="row">
		<div class="large-12 columns">
			<h1>$Title</h1>
			$Content
			<% if AllChildren %>
				<% if checkMediaHolder %>
					<% loop checkMediaHolder %>
						<div>
							<h4><strong><a href='{$Link}'>{$Title}</a></strong></h4>
							<div>{$Content.Summary}</div>
							<br>
						</div>
					<% end_loop %>
				<% else %>
					<% loop PaginatedChildren %>
						<div class='media-holder'>
							<h4><strong><a href='<% if $ExternalLink %>{$ExternalLink}<% else_if not $Content && Attachments.count == 1 %>$Attachments.first.Link<% else %>{$Link}<% end_if %>' class='<% if $ExternalLink %>external<% else %>media-page<% end_if %>'<% if $ExternalLink %> target='_blank'<% end_if %>>{$Title}</a></strong></h4>
							<div><em>{$Date.Nice}</em></div>
							<% if $Author %>
								<div><em>{$Author}</em></div>
							<% end_if %>
							<% if $Abstract %>
								<div>{$Abstract}</div>
							<% end_if %>
							<br>
							<div class='media-page-toggle'>
								<div>{$Content}</div>
								<% if Images %>
									<p>
										<% loop Images %>
											<span><a href='$Link'>{$CroppedImage(100, 100)}</a></span>
										<% end_loop %>
									</p>
								<% end_if %>
								<% if Attachments %>
									<em><strong>Attachments:</strong></em>
										<% loop Attachments %>
											<div><a href='{$Link}'>{$Title}</a></div>
										<% end_loop %>
								<% end_if %>
								{$CommentsForm}
							</div>
						</div>
					<% end_loop %>
					<% if PaginatedChildren.MoreThanOnePage %>
						<div>
							<% if PaginatedChildren.NotFirstPage %>
								<span><a href='{$Top.Link}?{$PaginatedChildren.PaginationGetVar}={$PaginatedChildren.PaginationPrevious}'>Previous</a></span>
							<% end_if %>
							<% loop PaginatedChildren.Pages %>
								<% if $CurrentBool %>
									<span>{$PageNum}</span>
								<% else %>
									<span><a href='{$Top.Link}?{$Up.PaginationGetVar}={$Up.getPaginationNumber($PageNum)}'>{$PageNum}</a></span>
								<% end_if %>
							<% end_loop %>
							<% if PaginatedChildren.NotLastPage %>
								<span><a href='{$Top.Link}?{$PaginatedChildren.PaginationGetVar}={$PaginatedChildren.PaginationNext}'>Next</a></span>
							<% end_if %>
						</div>
					<% end_if %>
				<% end_if %>

			<% else %>
				<p>There is currently no media available.</p>
			<% end_if %>

		</div>
	</div>
</section>
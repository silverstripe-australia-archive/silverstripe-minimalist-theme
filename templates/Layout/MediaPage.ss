<section class="main typography">
	<% include Breadcrumbs %>
	<div class="row content-start">

		<article class="large-6 columns">
			<h1>$Title</h1>

			<p class="meta"><% if $getAttribute('Author').Content %>By <em>$getAttribute('Author').Content</em> on <% else %>Published <% end_if %><em>$Date.Format('d M Y')</em></p>
			<p class="meta media-page-attributes">
				<% loop $MediaAttributes %>
					<% if $Title != 'Author' && $Content %>
						<span class="media-page-attribute {$TemplateClass}"><em><strong>{$Title}: </strong>{$Content}</em></span><br>
					<% end_if %>
				<% end_loop %>
				<br>
			</p>
			<div class="media-page-content">$Content</div>
			$Form
		</article>

		<aside class="large-6 columns">
			<div class="actions-panel" data-saveable-info="$ClassName-$ID">
				<% include Commenter Targeted=1 %>
			</div>
			<% if Images %>
				<h2 class="visually-hidden">Images</h2>
				<ul class="slides">
					<li class="slidesjs-previous slidesjs-navigation"><a><span class="typcn typcn-arrow-left"></span></a></li>
					<li class="slidesjs-next slidesjs-navigation"><a><span class="typcn typcn-arrow-right"></span></a></li>
					<% loop Images %>
						<li class="slide">
							<div class="meta"><span class="pos">$Pos</span> of $TotalItems</div>
							<div>$SetRatioSize(600,600)</div>
						</li>
					<% end_loop %>
				</ul>
			<% end_if %>

			<% if $Tags %>
			<dl class="tags">
				<dt><span class="typcn typcn-tags"></span> Tags</dt>
				<dd>
					<ul class="inline-list tight">
						<% loop $Tags %>
							<li><a class="label round outline" href="{$Up.getParent.Link}?tag={$Title.URLATT}">$Title</a></li>
						<% end_loop %>
					</ul>
				</dd>
			</dl>
			<% end_if %>

		</aside>
	</div>

	<div id="comments-modal" class="reveal-modal full" data-reveal></div>
</section>



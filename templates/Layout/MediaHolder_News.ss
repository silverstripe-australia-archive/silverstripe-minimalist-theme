<div class="main typography media-holder-news" data-url="$Link">
	<div class="banner full-banner">
		<div class="row">
			<div class="large-6 columns">
				<div class="decor decor-icons">
					<span class="typcn typcn-microphone-outline"></span>
				</div>
				<h1>$Title</h1>
			</div>
			<div class="large-6 columns">
				$DateFilterForm
			</div>
		</div>
	</div>
	
	<% if not IsFiltered %>
	<div class="banner news-features">
		<div class="row">
			<div class="large-12 columns">
				<h2 class="title">Currently featured
					<a class="char-icon collapse" data-icon-collapsed="typcn-arrow-down" data-icon="typcn-arrow-up">
						<span class="typcn typcn-arrow-up"></span>
					</a>
				</h2>
			</div>
		</div>
		<div class="row">
			<% loop $AllChildren.Sort('Created DESC').Limit(2) %>
				<div class="large-6 columns">
					<div class="panel clearfix">
						<div class="image">$Images.First.CroppedImage(300,300)</div>
						<div class="overview">
							<h3>$Title</h3>
							<p><% if $Abstract %>$Abstract<% else %>$Content.LimitWordCount(25)<% end_if %></p>
							<p><a class="button outline tiny more-link" href="$Link">Read article</a></p>
						</div>
					</div>
				</div>
			<% end_loop %>
		</div>
	</div>
	<% end_if %>
	
	<div class="row content-start">
		<div class="large-8 columns">
			$Content
			<% if AllChildren %>
				<% if $CheckMediaHolder %>
					<% loop $CheckMediaHolder %>
						<div class="child-holder">
							<h2><a href="$Link">$Title</a></h2>
							$Content.Summary
						</div>
					<% end_loop %>
				<% else %>
					<% loop $PaginatedChildren(10) %>
						<div class="news-list-item clearfix $FirstLast">
							<div class="thumb"><% if Images %>$Images.First.SetRatioSize(180,180)<% end_if %></div>
							<div class="content">
								<h2><a href="$Link">$Title</a></h2>
								<p class="meta news-meta">
									<span>On </span><em>$Date.Format("d F Y")</em><% if $getAttribute('Author').Content %><span> by </span><em>$getAttribute('Author').Content</em><% end_if %>
								</p>
								<% if $Abstract %>
									<p class="abstract">$Abstract</p>
								<% else %>
									<p class="abstract">$Content.LimitWordCount(40)</p>
								<% end_if %>
							</div>
						</div>
					<% end_loop %>
					
					<% if $PaginatedChildren(10).MoreThanOnePage %>
						<nav>
							<ul class="pagination">
								<% if $PaginatedChildren(10).NotFirstPage %>
									<li><a href="$PaginatedChildren(10).PrevLink">Previous</a></li>
								<% end_if %>
								<% loop $PaginatedChildren(10).Pages %>
									<% if $CurrentBool %>
										<li class="current"><span>$PageNum</span></li>
									<% else %>
										<% if $Link %>
											<li><a href="$Link">$PageNum</a></li>
										<% else %>
											<li class="unavailable"><span>&hellip;</span></li>
										<% end_if %>
									<% end_if %>
								<% end_loop %>
								<% if $PaginatedChildren(10).NotLastPage %>
									<li><a href="$PaginatedChildren(10).NextLink">Next</a></li>
								<% end_if %>
							</ul>
						</nav>
					<% end_if %>
				<% end_if %>
			<% else %>
				<p>There is currently no media available.</p>
			<% end_if %>
			
		</div>
		<div class="large-3 columns">
		</div>
	</div>
	
</div>
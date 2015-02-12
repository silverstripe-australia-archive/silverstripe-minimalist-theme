;(function($){
	$(document).foundation();
	
	$(document)
		.on('open', '.reveal-modal.full', function(){
			$('.primary-container').addClass('chopped');
		})
		.on('opened', '.reveal-modal', function(){
			var $modal = $(this);
			if ($modal.find('.close-reveal-modal').length < 1){
				$modal.prepend('<a class="close-reveal-modal">&times;</a>');
			}									 
		})
		.on('closed', '.reveal-modal.full', function(){
			$('.primary-container').removeClass('chopped');
		});
	
	$('.news-features a.collapse').on('click', function(e){
		e.preventDefault();
		var $toggler = $(this);
		var $features = $toggler.closest('.news-features');
		$features.toggleClass('collapsed');
		var $icon = $features.find('span');
		if ($features.hasClass('collapsed')){
			$icon.removeClass($toggler.attr('data-icon'));
			$icon.addClass($toggler.attr('data-icon-collapsed'));
		}
		else {
			$icon.removeClass($toggler.attr('data-icon-collapsed'));
			$icon.addClass($toggler.attr('data-icon'));
		}
	});

	// Comments/replies
	$('a[data-dropdown="post-something"]').entwine({
		onmatch: function() {
			$(document).foundation('dropdown', 'reflow');
		}
	});
	
	
	$('.microPostContent .replyForm').entwine({
		onmatch: function(){
			this.addClass('visually-hidden');
		}
	});
	$('.microPostContent .toggle-reply').entwine({
		onclick: function(){
			if (this.parent().hasClass('Actions')){
				var $form = this.closest('form');	
				$form.next('.toggle-reply').removeClass('visually-hidden');
			}
			else {
				var $form = this.prev('form');
				this.addClass('visually-hidden');
			}
			$form.toggleClass('visually-hidden');
		}
	});
	
	
	$(document).on('click', 'a.comment-list-trigger', function (e) {
		e.preventDefault();

		var me = $(this);
		setTimeout(function () {
			var counter = me.find('.comment-count');
			counter.addClass('comment-count-0').text('0');
		}, 1000);
		
		
		if (e.shiftKey) {
			var url = $(this).attr('href');

			var width = $(window).width() / 3;
			var height = $(window).height();

			var options = 
				"all=no," +
				"titlebar=no," + 
				"scrollbars=yes," + 
				"chrome=yes," +
				"toolbar=no," +
				"dialog=no," +
				"resizable=yes," + 
				"modal=no," +
				"dependent=yes," +
				"width="+width+"px," +
				"height="+height+"px";

			var sep = '?'; 
			if (url.indexOf('?') > 0) {
				sep = '&';
			}
			url += sep + 'popup=1';
			var comments = window.open(url, 'comments', options);
			comments.focus();
		}
		else {
			$('#comments-modal')
				.foundation('reveal', 'open', {
					url: me.attr('href'),
					dataFilter: function(data, type){
						data = '<a class="close-reveal-modal">&times;</a><div class="modal-heading">Comments</div>' + data;
						return data;
					}
				});
		}

		return false;
	});
	
	// Slides
	var $slides = $('ul.slides');
	if ($slides.length > 0){
		$slides.each(function(){
			var w = h = 0;
			$(this).find('.slide').each(function(){
				var $slide = $(this);
				if (w < $slide.width()){
					w = $slide.width();
				}
				if (h < $slide.height()){
					h = $slide.height();
				}
			});
			$(this).slidesjs({
				width: w,
				height: h,
				navigation: {active: false, effect: 'fade'},
				pagination: {active: false}
			});			  
		});
	}
	
})(jQuery);
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
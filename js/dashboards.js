// Replication from frontend-dashboards/javascript/dashboards.js
// with a fair bit removed and dialogs using Foundation Reveal

;(function($) {
	$(function() {
		var segment = 'dashboard';
		if ($('#DashboardUrl').length) {
			segment = $('#DashboardUrl').val();
		}

		var gridster = $(".gridster ul.grid-container").gridster({
			widget_margins: [10, 10],
			widget_base_dimensions: [120, 120],
			avoid_overlapped_widgets: true,
			resize: {
				enabled: true,
				handle_class: 'dashlet-resize', //Setting the class of the resize handle
				stop: function(e, i, widget) {
					$.post($(widget[0].firstElementChild).attr('data-link') + '/save', this.serialize($(widget))[0])
					.done(function(data) {});

					if(this.$changed.length > 0) {
						for(var i = 0; i < $(this.$changed).length; i++) {
							$.post($(this.$changed[i].firstElementChild).attr('data-link') + '/save', this.serialize($(this.$changed))[i])
							.done(function() {});
						}
					}
					this.$changed = $([]);
				}
			},
			draggable: {
				handle: '.dashlet-title h3',
				stop: function(e, i) {
					if(this.$changed.length > 0) {
						for(var i = 0; i < $(this.$changed).length; i++) {
							$.post($(this.$changed[i].firstElementChild).attr('data-link') + '/save', this.serialize($(this.$changed))[i])
							.done(function() {});
						}
					}

					//See above in resize.stop to see why we do this.
					this.$changed = $([]);
				}
			}
		}).data('gridster');
		
		// prevent selection of content
		$(document).on('mousedown', '.dashlet-title h3', function (e) { e.preventDefault(); });

		$(document).on('click', '.dashlet-action-refresh', function (e) {
			e.preventDefault();
			var dashlet = $(this).closest(".dashlet");
			dashlet.refresh();
			return false;
		});

		$(document).on('click', ".dashlet-action-edit", function() {
			var dashlet = $(this).parents(".dashlet");
			var id      = dashlet.data("id");
			var title	= $(this).attr('title');
			$('#edit-dashlet-modal').foundation('reveal', 'open', {
				url: segment + "editorfor",
				data: { 
					DashletID: id
				},
				success: function(data){
					return '<div class="modal-heading">' + title + '</div>' + data;
				}
			});
			return false;
		});
		
		$(document).on('opened.fndtn.reveal', '#edit-dashlet-modal', function (){
			var $modal = $(this);
			var $form = $modal.find('form');
			$modal.find('input[name="action_deletedashlet"]').remove();
			$form.find('input[name="action_savedashlet"]').on('click', function(e){
				e.preventDefault();
				e.stopImmediatePropagation();
				$form.ajaxSubmit({
					success: function(data){
						$form.replaceWith(data);
						$modal.foundation('reveal', 'close');
					}
				});
				return false;
			});
			
		});

		$(document).on('click', ".dashlet-action-delete", function() {
			var dashlet = $(this).parents(".dashlet");
			var id      = dashlet.data("id");

			if(confirm("Are you sure you want to delete this dashlet?")) {
				$.post(segment + "/deletedashlet", { "DashletID": id }, function(resp) {
					if(resp.success) dashlet.remove();
				});
			}

			return false;
		});
		
		$('div.dashlet').entwine({
			refresh: function () {
				var id = this.attr('data-id');
				var reloadUrl = segment + '/loaddashlet';
				this.loadUrl(reloadUrl, {DashletID: id});
			},
			loadUrl: function (reloadUrl, params) {
				var _this = this;
				$.get(reloadUrl, params, function (data) {
					if (data && data.length && data.indexOf('dashlet') >= 0) {
						_this.replaceWith(data);
						delete _this;
					}
				})
			}
		});
		
		$('div.dashlet form.ajax-form').entwine({
			onsubmit: function (e) {
				var parentDiv = $(this).parents('div.dashlet');
				parentDiv.css('opacity', '0.5');
				$(this).ajaxSubmit({
					success: function(replace) {
						parentDiv.refresh();
						parentDiv.css('opacity', '1.0');
					}
				});
				
				return false;
			}
		});

	})
})(jQuery);

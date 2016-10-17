/*
* Template Name: Unify - Responsive Bootstrap Template
* Author: @htmlstream
* Website: http://htmlstream.com
*/
jQuery(document).ready(function() {
	App.init();
	StyleSwitcher.initStyleSwitcher();
});
var App = function () {
	// We extend jQuery by method hasAttr
	$.fn.hasAttr = function(name) {
	  return this.attr(name) !== undefined;
	};

	// Fixed Header
	function handleHeader() {
		jQuery(window).scroll(function() {
		  if (jQuery(window).scrollTop() > 100) {
			jQuery('.header-fixed .header-sticky').addClass('header-fixed-shrink');
		  } else {
			jQuery('.header-fixed .header-sticky').removeClass('header-fixed-shrink');
		  }
		});
	}

	// Header Mega Menu
	function handleMegaMenu() {
		jQuery(document).on('click', '.mega-menu .dropdown-menu', function(e) {
			e.stopPropagation();
		})
	}

	// Search Box (Header)
	function handleSearch() {
		jQuery('.search').on("click", function () {
			if(jQuery('.search-btn').hasClass('fa-search')){
				jQuery('.search-open').fadeIn(500);
				jQuery('.search-btn').removeClass('fa-search');
				jQuery('.search-btn').addClass('fa-times');
			} else {
				jQuery('.search-open').fadeOut(500);
				jQuery('.search-btn').addClass('fa-search');
				jQuery('.search-btn').removeClass('fa-times');
			}
		});
	}



	// Sidebar Navigation Toggle
	function handleToggle() {
		jQuery('.list-toggle').on('click', function() {
			jQuery(this).toggleClass('active');
		});
	}


	// Full Screen
	var handleFullscreen = function() {
		var WindowHeight = jQuery(window).height();
		var HeaderHeight = 0;

		if (jQuery(document.body).hasClass("promo-padding-top")) {
		  HeaderHeight = jQuery(".header").height();
		} else {
		  HeaderHeight = 0;
		}

		jQuery(".fullheight").css("height", WindowHeight - HeaderHeight);

		jQuery(window).resize(function() {
		  var WindowHeight = jQuery(window).height();
			jQuery(".fullheight").css("height", WindowHeight - HeaderHeight);
		});
	}





	// Bootstrap Tooltips and Popovers
	function handleBootstrap() {
		/* Bootstrap Carousel */
		jQuery('.carousel').carousel({
			interval: 15000,
			pause: 'hover'
		});

		/* Tooltips */
		jQuery('.tooltips').tooltip();
		jQuery('.tooltips-show').tooltip('show');
		jQuery('.tooltips-hide').tooltip('hide');
		jQuery('.tooltips-toggle').tooltip('toggle');
		jQuery('.tooltips-destroy').tooltip('destroy');

		/* Popovers */
		jQuery('.popovers').popover();
		jQuery('.popovers-show').popover('show');
		jQuery('.popovers-hide').popover('hide');
		jQuery('.popovers-toggle').popover('toggle');
		jQuery('.popovers-destroy').popover('destroy');
	}

	return {
		init: function () {
			handleBootstrap();
			handleSearch();

			handleToggle();
			handleHeader();
			handleMegaMenu();

			handleFullscreen();
		},



		// Scroll Bar
		initScrollBar: function () {
			jQuery('.mCustomScrollbar').mCustomScrollbar({
				theme:"minimal",
				scrollInertia: 200,
				scrollEasing: "linear"
			});
		},

		// Sidebar Menu Dropdown
		initSidebarMenuDropdown: function() {
		  function SidebarMenuDropdown() {
			jQuery('.header-v7 .dropdown-toggle').on('click', function() {
			  jQuery('.header-v7 .dropdown-menu').stop(true, false).slideUp();
			  jQuery('.header-v7 .dropdown').removeClass('open');

			  if (jQuery(this).siblings('.dropdown-menu').is(":hidden") == true) {
				jQuery(this).siblings('.dropdown-menu').stop(true, false).slideDown();
				jQuery(this).parents('.dropdown').addClass('open');
			  }
			});
		  }
		  SidebarMenuDropdown();
		},

		// Animate Dropdown
		initAnimateDropdown: function() {
		  function MenuMode() {
			jQuery('.dropdown').on('show.bs.dropdown', function() {
			  jQuery(this).find('.dropdown-menu').first().stop(true, true).slideDown();
			});
			jQuery('.dropdown').on('hide.bs.dropdown', function() {
			  jQuery(this).find('.dropdown-menu').first().stop(true, true).slideUp();
			});
		  }

		  jQuery(window).resize(function() {
			if (jQuery(window).width() > 768) {
			  MenuMode();
			}
		  });

		  if (jQuery(window).width() > 768) {
			MenuMode();
		  }
		},
	};
}();
var StyleSwitcher = function () {

	return {

		//Style Switcher
		initStyleSwitcher: function() {
			var panel = jQuery('.style-switcher');

			jQuery('.style-switcher-btn').click(function () {
				jQuery('.style-switcher').show();
			});

			jQuery('.theme-close').click(function () {
				jQuery('.style-switcher').hide();
			});

			jQuery('li', panel).click(function () {
				var color = jQuery(this).attr("data-style");
				var data_header = jQuery(this).attr("data-header");
				setColor(color, data_header);
				jQuery('.list-unstyled li', panel).removeClass("theme-active");
				jQuery(this).addClass("theme-active");
			});

			var setColor = function (color, data_header) {
				jQuery('#style_color').attr("href", "assets/css/theme-colors/" + color + ".css");
				if(data_header == 'light'){
					jQuery('.logo img').attr("src", "assets/img/themes/logo1-" + color + ".png");
					jQuery('#logo-footer').attr("src", "assets/img/themes/logo2-" + color + ".png");
					jQuery('.navbar-brand img').attr("src", "assets/img/themes/logo1-" + color + ".png");
				} else if(data_header == 'dark'){
					jQuery('.logo img').attr("src", "assets/img/themes/logo1-" + color + ".png");
					jQuery('#logo-footer').attr("src", "assets/img/themes/logo2-" + color + ".png");
				}
			}

			//Boxed Layout
			jQuery('.skins-btn').click(function(){
				jQuery(this).addClass("active-switcher-btn");
				jQuery(".handle-skins-btn").removeClass("active-switcher-btn");
				jQuery("body").addClass("dark");
			});
			jQuery('.handle-skins-btn').click(function(){
				jQuery(this).addClass("active-switcher-btn");
				jQuery(".skins-btn").removeClass("active-switcher-btn");
				jQuery("body").removeClass("dark");
			});


			//Boxed Layout
			jQuery('.boxed-layout-btn').click(function(){
				jQuery(this).addClass("active-switcher-btn");
				jQuery(".wide-layout-btn").removeClass("active-switcher-btn");
				jQuery("body").addClass("boxed-layout container");
			});
			jQuery('.wide-layout-btn').click(function(){
				jQuery(this).addClass("active-switcher-btn");
				jQuery(".boxed-layout-btn").removeClass("active-switcher-btn");
				jQuery("body").removeClass("boxed-layout container");
			});

		}

	};

}();
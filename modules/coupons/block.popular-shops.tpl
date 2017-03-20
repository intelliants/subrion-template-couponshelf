{if !empty($coupon_blocks.popular_shops)}
	<div class="box__caption -alt">{$block.title}</div>
	<div class="owl-carousel f-shops js-f-shops">
		{foreach $coupon_blocks.popular_shops as $featured_shop}
			<div class="f-shops__item">
				<a class="f-shops__item__thumb" href="{ia_url type='url' item='shops' data=$featured_shop}">
					{if $featured_shop.shop_image}
						{ia_image file=$featured_shop.shop_image type='thumbnail' title=$featured_shop.title|escape}
					{else}
						<img src="http://free.pagepeeker.com/v2/thumbs.php?size=m&url={$featured_shop.website|escape:url}" alt="Generated by pageppeker.com">
					{/if}
				</a>
				<a class="f-shops__item__title" href="{ia_url type='url' item='shops' data=$featured_shop}">{$featured_shop.title}</a>
			</div>
		{/foreach}
	</div>
{/if}
{ia_print_js files='_IA_TPL_owl.carousel.min'}
{ia_add_js}
$(function() {
	$('.js-f-shops').owlCarousel({
		items: 6,
		margin: 20,
		dots: false,
		nav: false,
		loop: true,
		autoplay: true,
		autoplayTimeout: 3000,
		autoplayHoverPause: true,
		navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
		responsive: {
			0: {
				items: 2
			},
			500: {
				items: 3
			},
			768: {
				items: 6
			}
		}
	});
});
{/ia_add_js}
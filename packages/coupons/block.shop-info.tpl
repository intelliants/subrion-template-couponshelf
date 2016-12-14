{if isset($shop)}
	<div class="shop-info">
		<div class="shop-info__img">
			{if $shop.shop_image}
				<a href="{$smarty.const.IA_URL}shop/{$shop.title_alias}.html">
					{printImage imgfile=$shop.shop_image.path title=$shop.title|escape:'html' class='img-responsive center-block'}
				</a>
			{else}
				<a href="{$smarty.const.IA_URL}shop/{$shop.title_alias}.html">
					<img src="http://api.webthumbnail.org?width=150&height=150&format=png&screen=1024&url={$shop.website}" alt="Generated by WebThumbnail.org" class="img-responsive center-block">
				</a>
			{/if}
		</div>

		<h4 class="ia-item__title">{$shop.title} <a class="pull-right" href="{$smarty.const.IA_URL}shop/{$shop.title_alias}.html"><span class="fe fe-open"></span></a></h4>

		<ul class="list-unstyled">
			<li>{lang key='coupons'}: {$shop.num_coupons|string_format:'%d'}</li>
			<li><span class="fe fe-link"></span>
				{if $shop.affiliate_link && 'http://' != $shop.affiliate_link}
					<a href="{$shop.affiliate_link}">{lang key='website'}</a>
				{else}
					<a href="{$shop.website}">{lang key='website'}</a>
				{/if}
			</li>
		</ul>

		{ia_hooker name='smartyViewListingAuthorBlock'}
	</div>
{/if}
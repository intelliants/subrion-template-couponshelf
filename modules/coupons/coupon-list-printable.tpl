<div class="coupon{if $listing.featured} -featured{/if}{if $listing.sponsored} -sponsored{/if}">
    <div class="coupon__img">
        {if $listing.shop_image}
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">
                {ia_image file=$listing.shop_image type='thumbnail' title=$listing.shop_title|escape:'html' class='img-responsive'}
            </a>
        {else}
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">
                <img src="http://free.pagepeeker.com/v2/thumbs.php?size=m&url={$listing.shop_website|escape:url}" alt="Generated by pageppeker.com" class="img-responsive">
            </a>
        {/if}
    </div>
    <div class="coupon__body">
        <div class="coupon__type">
            {lang key='printable_coupon'}
            {*
            {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
            {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
            *}
        </div>
        <div class="coupon__title">
            {ia_url type='link' item='coupons' data=$listing text=$listing.title}
        </div>
        <div class="coupon__desc">{$listing.short_description|strip_tags|truncate:150:'...'}</div>
        <div class="coupon__shop">
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">{$listing.shop_title}</a>
            {if $listing.category_parent_id > 0 && (!isset($category) || $category._pid > 1)}
                / <a href="{$core.packages.coupons.url}{$listing.category_alias}/">{$listing.category_title}</a>
            {/if}
        </div>
    </div>
    <div class="coupon__price">
        <div class="coupon__price-wrp">
            <div class="coupon__actions">
                {printFavorites item=$listing itemtype='coupons' guests=true}
                {accountActions item=$listing itemtype='coupons'}
            </div>

            {if $listing.expire_date != 0}
                <div class="coupon__time-left js-countdown" data-countdown="{$listing.expire_date}"></div>
            {/if}

            <a href="{ia_url type='url' item='coupons' data=$listing}" class="btn-coupon btn-coupon-link"><span class="fa fa-print"></span> {lang key='print_coupon'}</a>

            <div class="coupon-rate">
                <a href="#" class="thumbs-up" data-id="{$listing.id}" data-trigger="up"><i class="fa fa-smile-o"></i></a>
                <span class="rate good" id="thumb_result_{$listing.id}">{$listing.thumbs_num|default:0}</span>
                <a href="#" class="thumbs-down" data-id="{$listing.id}" data-trigger="down"><i class="fa fa-frown-o"></i></a>
            </div>
        </div>
    </div>
</div>
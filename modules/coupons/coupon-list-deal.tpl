<div class="coupon -deal{if $listing.featured} -featured{/if}{if $listing.sponsored} -sponsored{/if}">
    <div class="coupon__img">
        {if $listing.gallery}
            <a href="{ia_url type='url' item='coupons' data=$listing}">
                {ia_image file=$listing.gallery[0] type='thumbnail' title=$listing.shop_title|escape}
            </a>
        {elseif $listing.shop_image}
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">
                {ia_image file=$listing.shop_image type='thumbnail' title=$listing.shop_title|escape class='img-responsive'}
            </a>
        {else}
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">
                <img src="http://free.pagepeeker.com/v2/thumbs.php?size=m&url={$listing.shop_website|escape:url}" alt="Generated by pageppeker.com" class="img-responsive">
            </a>
        {/if}
    </div>
    <div class="coupon__body">
        <div class="coupon__type">
            {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
            {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
            {lang key='deal_coupon'}
        </div>
        <div class="coupon__title">
            {ia_url type='link' item='coupons' data=$listing text=$listing.title}
        </div>
        <div class="coupon__desc">{$listing.short_description|strip_tags|truncate:150:'...'}</div>
        <div class="coupon__shop">
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">{$listing.shop_title}</a>
            {if $listing.category_parent_id > 0 && !empty($category) && $category.parent_id > 1}
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

            <div class="coupon__price-price">
                {if $listing.item_price && '0.00' != $listing.item_price}
                    {if $listing.item_discount}
                        <span class="coupon__price-price__current">{$listing.cost_formatted}</span><br>
                        <span class="coupon__price-price__old">{lang key='old_price'} <span>{$listing.item_price_formatted}</span></span>
                        <span class="coupon__price-price__save">{lang key='you_save'} {$listing.item_discount_formatted}</span>
                    {else}
                        <span class="coupon__price-price__current">{$listing.item_price_formatted}</span>
                    {/if}
                {else}
                    <span class="coupon__price-price__current">{$listing.cost_formatted}</span><br>
                    {if $listing.item_discount}
                        <span class="coupon__price-price__save">{lang key='you_save'} {$listing.item_discount_formatted}</span>
                    {/if}
                {/if}
            </div>

            <a href="{ia_url type='url' item='coupons' data=$listing}" class="btn-coupon btn-coupon-link"><span class="fa fa-shopping-cart"></span> {lang key='get_deal'}</a>

            <div class="coupon-rate">
                <a href="#" class="thumbs-up" data-id="{$listing.id}" data-trigger="up"><i class="fa fa-smile-o"></i></a>
                <span class="rate good" id="thumb_result_{$listing.id}">{$listing.thumbs_num|default:0}</span>
                <a href="#" class="thumbs-down" data-id="{$listing.id}" data-trigger="down"><i class="fa fa-frown-o"></i></a>
            </div>
        </div>
    </div>
</div>
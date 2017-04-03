<div class="coupon -deal{if $listing.featured} -featured{/if}{if $listing.sponsored} -sponsored{/if}">
    <div class="coupon__img">
        {if $listing.gallery}
            <a href="{ia_url type='url' item='coupons' data=$listing}">
                {ia_image file=$listing.gallery[0] type='thumbnail' title=$listing.shop_title|escape}
            </a>
        {elseif $listing.shop_image}
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
            {lang key='deal_coupon'}
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

            <div class="coupon__price-price">
                <span class="coupon__price-price__current">{(int)$listing.discounted_price}</span>
                <span class="coupon__price-price__old">{(int)$listing.item_price}</span>
                <span class="coupon__price-price__save">{lang key='you_save'}: {(int)$listing.discount_saving}</span>
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

{*
<div class="ia-item ia-item--border {if $listing.featured} ia-item--featured{/if}{if $listing.sponsored} ia-item--sponsored{/if}" data-affiliate-link="{if $listing.affiliate_link && 'http://' != $listing.affiliate_link}{$listing.affiliate_link}{elseif $listing.shop_affiliate_link && 'http://' != $listing.shop_affiliate_link}{$listing.shop_affiliate_link}{/if}" id="coupon-list-{$listing.id}">
    <div class="ia-item__image">
        {if $listing.coupon_image}
            {assign 'imgthumb' $listing.coupon_image|unserialize}
            <a href="{printImage imgfile=$imgthumb.path url=true fullimage=true}" rel="ia_lightbox">
                {printImage imgfile=$imgthumb.path title=$listing.title|escape:'html' class='img-responsive'}
            </a>
        {elseif $listing.shop_image}
            <a href="{printImage imgfile=$listing.shop_image.path url=true fullimage=true}" rel="ia_lightbox">
                {printImage imgfile=$listing.shop_image.path title=$listing.shop_title|escape:'html' class='img-responsive'}
            </a>
        {else}
            <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html" class="ia-item-thumbnail">
                <img src="http://api.webthumbnail.org?width=150&height=150&format=png&screen=1024&url={$listing.shop_website}" alt="Generated by WebThumbnail.org" class="img-responsive">
            </a>
        {/if}

        <div class="coupon-rate text-center">
            <a href="#" class="thumbs-up" data-id="{$listing.id}" data-trigger="up"><i class="fa fa-thumbs-up"></i></a>
            <span class="rate good" id="thumb_result_{$listing.id}">{$listing.thumbs_num|default:0}</span>
            <a href="#" class="thumbs-down" data-id="{$listing.id}" data-trigger="down"><i class="fa fa-thumbs-down"></i></a>
        </div>
    </div>

    <div class="ia-item__labels">
        {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
        {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
    </div>

    <div class="ia-item__content">
        <div class="ia-item__actions">
            {printFavorites item=$listing itemtype='coupons' guests=true}
            {accountActions item=$listing itemtype='coupons'}
        </div>

        <div class="ia-item__title">
            {ia_url type='link' item='coupons' data=$listing text=$listing.title} <small>{lang key='from'} <a href="{$smarty.const.IA_URL}shop/{$listing.shop_alias}.html">{$listing.shop_title}</a></small>
        </div>

        {if $listing.item_price && '0.00' != $listing.item_price}
            <div class="coupon-price clearfix">
                {if $listing.activations_left < 10}
                    <p>Hurry up. Only {$listing.activations_left} activations left. {$listing.activations_sold} sold.</p>
                {/if}

                {if $listing.item_discount}
                    <span class="label label-disabled">{$core.config.coupon_item_price_currency}{$listing.item_price}</span>
                    <span class="label label-success">{$core.config.coupon_item_price_currency}{$listing.discounted_price|string_format:"%.2f"}</span>
                    <span class="label-saving">{lang key='you_save'} {$core.config.coupon_item_price_currency}{$listing.discount_saving|string_format:"%.2f"}</span>
                {else}
                    <span class="label label-warning">{$core.config.coupon_item_price_currency}{$listing.item_price}</span>
                {/if}

                {if $core.config.purchase_coupon_codes}
                    {coupon_code coupon=$listing}
                {/if}
            </div>
        {/if}

        {if $listing.expire_date != 0}
            <div class="coupon-expire text-danger">
                <span class="fa fa-clock-o"></span>
                <span class="js-countdown" data-countdown="{$listing.expire_date}" title="{lang key='coupon_expire'}"></span>
            </div>
        {/if}

        <p>{$listing.short_description|strip_tags|truncate:150:'...'}</p>

        <p class="coupon-tags text-fade-50">
            <span class="fa fa-tags"></span>
            {if $listing.coupon_tags}
                {lang key='coupon_tags'}: {$listing.coupon_tags|replace:',':', '}
            {else}
                {lang key='no_coupon_tags'}
            {/if}
        </p>
    </div>

    <div class="ia-item__panel">
        {if $listing.member_id}
            <span class="ia-item__panel__item pull-left">
                <span class="fa fa-user"></span> <a href="{$smarty.const.IA_URL}member/{$listing.account_username}.html">{$listing.account}</a>
            </span>
        {/if}

        {if $listing.category_parent_id > 0 && (!isset($category) || $category._pid > 1)}
            <span class="ia-item__panel__item pull-left">
                <span class="fa fa-folder-o"></span> <a href="{$core.packages.coupons.url}{$listing.category_alias}/">{$listing.category_title}</a>
            </span>
        {/if}

        <span class="ia-item__panel__item pull-right">
            {$listing.views_num} {lang key='views_since'} {$listing.date_added|date_format:$core.config.date_format}
        </span>
    </div>
</div>
{ia_add_js}
$(function () {
    $('#coupon-list-{$listing.id} h4.media-heading a:first').on('click', function(e)
    {
        e.preventDefault();

        var affiliateLink = $('#coupon-list-{$listing.id}').data('affiliate-link');
        var couponLink    = '{ia_url type='url' item='coupons' data=$listing}';

        if ('undefined' != typeof affiliateLink && '' != affiliateLink)
        {
            window.location.href = couponLink;
            window.open(affiliateLink, '_blank');
        }
        else
        {
            window.location.href = couponLink;
        }
    });
});
{/ia_add_js}
*}
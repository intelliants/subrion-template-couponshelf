<div class="d-view">
    <div class="d-view__title">
        <h1>{$item.title}</h1>
        <p>
            {ia_url type='link' item='ccats' data=$coupon_category text=$coupon_category.title rel='tag'}</span>
            <span>/</span>
            {$item.date_added|date_format:$core.config.date_format}
            <span>/</span>
            <a href="{$smarty.const.IA_URL}member/{$item.account_username}.html">{$item.account}</a>
        </p>
    </div>

    <div class="d-view__info">
        {if $item.gallery}
            <div class="owl-carousel sl-gallery">
                {foreach $item.gallery as $img}
                    <div class="sl-gallery__item">
                        {ia_image file=$img type='large' title=$img.title|default:$item.title|escape}
                    </div>
                {/foreach}
            </div>

            {ia_add_js}
$(function()
{
    $('.sl-gallery').owlCarousel({
        items: 1,
        margin: 0,
        dots: true,
        nav: true,
        loop: true,
        autoplay: true,
        autoplayTimeout: 6000,
        autoplaySpeed: 1300,
        autoplayHoverPause: true,
        navText: ['<span class="fe fe-arrow-left"></span>','<span class="fe fe-arrow-right"></span>']
    });
});
            {/ia_add_js}
        {elseif $item.coupon_image}
            <div class="d-view__info__img">
                {ia_image file=$item.coupon_image type='large' title=$item.title|default:$item.title|escape class='img-responsive'}
            </div>
        {/if}

        <div class="d-view-deal">
            <div class="d-view-deal__actions">
                {foreach $core.actions as $name => $action}
                    {if 'action-favorites' == $name}
                        {printFavorites item=$item itemtype=$item.item guests=true}
                    {else}
                        <a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                            <span class="fa fa-{$name}"></span>
                        </a>
                    {/if}
                {/foreach}
            </div>
            <div class="d-view-deal__type">{lang key="{$item.coupon_type}_coupon"}</div>
            {if 'deal' == $item.coupon_type}
                <div class="d-view-deal__price">
                    <span class="d-view-deal__price__current">{(int)$item.discounted_price}</span>
                    <span class="d-view-deal__price__old">{lang key='old_price'}: <span>{(int)$item.item_price}</span></span>
                    <span class="d-view-deal__price__save">{lang key='you_save'}: {(int)$item.discount_saving}</span>
                </div>
            {/if}

            <div class="d-view-deal__buy">
                {if 'deal' == $item.coupon_type}
                    <a href="#" class="d-view-deal__buy__btn">{lang key='buy'}</a>
                {else}
                    <a href="#" class="d-view-deal__buy__btn js-print-coupon"><span class="fa fa-print"></span> {lang key='print_coupon'}</a>
                {/if}

                <div class="coupon-rate">
                    <a href="#" class="thumbs-up" data-id="{$item.id}" data-trigger="up"><i class="fa fa-smile-o"></i></a>
                    <span class="rate good" id="thumb_result_{$item.id}">{$item.thumbs_num|default:0}</span>
                    <a href="#" class="thumbs-down" data-id="{$item.id}" data-trigger="down"><i class="fa fa-frown-o"></i></a>
                </div>
            </div>

            <div class="d-view-deal__more">
                {if $item.expire_date != 0}
                    <div class="d-view-deal__more__item -time-left">
                        <span class="fe fe-clock"></span> <span class="js-countdown" data-countdown="{$item.expire_date}"></span>
                    </div>
                {/if}
                {if $item.activations}
                    <div class="d-view-deal__more__item -activations">
                        <span class="fe fe-bag"></span> {$item.activations_sold} {lang key='bought'}
                    </div>
                {/if}
                <div class="d-view-deal__more__item -views">
                    <span class="fe fe-eye"></span> {$item.views_num}
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-9">
        <div class="d-view-tabs">
            <ul class="nav nav-tabs nav-tabs-nice">
                <li class="active"><a data-toggle="tab" href="#tab-description">{lang key='description'}</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="tab-description">
                    {$item.short_description}
                    {$item.description}
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <!-- Go to www.addthis.com/dashboard to customize your tools -->
        <div class="addthis_inline_share_toolbox m-b"></div>

        {ia_blocks block='shop'}
    </div>
</div>

{ia_hooker name='smartyViewCouponBeforeFooter'}
{ia_add_media files='js:_IA_URL_packages/coupons/js/front/view'}

{*
<div class="couponItem">
    <div class="meta">
        <p>
            <span><span class="fa fa-calendar"></span> {$item.date_added|date_format:$core.config.date_format}</span>
            {if $item.expire_date != 0}
            <span class="text-danger"><span class="fa fa-clock-o"></span> {lang key='coupon_expire'} {$item.expire_date|date_format:$core.config.date_format}</span>
            {/if}
        </p>
        <p><span class="text-success"><span class="fe fe-eye"></span> {$item.views_num} {lang key='views_since'} {$item.date_added|date_format:$core.config.date_format}</span></p>
    </div>

    {if 'simple' == $item.coupon_type && $item.coupon_code}
        <div class="code clearfix">
            <div class="coupon-code">
                {$item.coupon_code}
                <div class="code-copy clip_{$item.id}" data-clipboard-text="{$item.coupon_code}" title="{lang key='coupon_copy_to_clipboard'}" data-affiliate-link="{if $item.affiliate_link && 'http://' != $item.affiliate_link}{$item.affiliate_link}{elseif $item.shop_affiliate_link && 'http://' != $item.shop_affiliate_link}{$item.shop_affiliate_link}{/if}"></div>
            </div>
        </div>
    {elseif 'deal' == $item.coupon_type && $core.config.purchase_coupon_codes}
        <div class="code clearfix">
            {coupon_code coupon=$item}
        </div>
    {else}
        <div class="text-center">
            <a href="{printImage imgfile=$item.coupon_image url=true fullimage=true}" rel="ia_lightbox[{$item.title}]">
                {printImage imgfile=$item.coupon_image fullimage="true" class='img-responsive' title=$item.title|escape}
            </a>
        </div>
    {/if}

    {if $item.item_price && '0.00' != $item.item_price}
        <hr>
        <div class="coupon-price">
            {if $item.item_discount}
                {if 'fixed' == $item.item_discount_type}
                    {assign var=discount_total value=($item.item_price - $item.item_discount)}
                    {assign discount $item.item_discount}
                {else}
                    {assign var=discount_total value=($item.item_price - $item.item_price * $item.item_discount / 100)}
                    {assign var=discount value=($item.item_price * $item.item_discount / 100)}
                {/if}

                <span class="label label-disabled">{$core.config.coupon_item_price_currency}{$item.item_price}</span>
                <span class="label label-success">{$core.config.coupon_item_price_currency}{$discount_total|string_format:"%.2f"}</span>
                <span class="label-saving">{lang key='you_save'} {$core.config.coupon_item_price_currency}{$discount|string_format:"%.2f"}</span>
            {else}
                <span class="label label-warning">{$core.config.coupon_item_price_currency}{$item.item_price}</span>
            {/if}
        </div>
        <hr>
    {/if}

    <div class="code-share">
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style ">
            <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
            <a class="addthis_button_tweet"></a>
            <a class="addthis_counter addthis_pill_style"></a>
        </div>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#username=xa-4c6e050a3d706b83"></script>
        <!-- AddThis Button END -->
    </div>

    <p class="text-box lead text-info">
        {$item.short_description|strip_tags}
    </p>

    {if $item.description}
        <div class="text-box">{$item.description}</div>
    {/if}

    <div class="clearfix">
        <div class="coupon-rate text-center pull-left">
            <a href="#" class="thumbs-up" data-id="{$item.id}" data-trigger="up"><i class="fa fa-thumbs-up"></i></a>
            <span class="rate good" id="thumb_result_{$item.id}">{$item.thumbs_num|default:0}</span>
            <a href="#" class="thumbs-down"  data-id="{$item.id}" data-trigger="down"><i class="fa fa-thumbs-down"></i></a>
        </div>

        {if $item.affiliate_link && 'http://' != $item.affiliate_link}
            <a href="{$item.affiliate_link}" class="btn btn-warning pull-right" target="_blank">{lang key='more_info'}</a>
        {elseif $item.shop_affiliate_link && 'http://' != $item.shop_affiliate_link}
            <a href="{$item.shop_affiliate_link}" class="btn btn-warning pull-right" target="_blank">{lang key='more_info'}</a>
        {/if}
    </div>

    {if $item.coupon_tags}
        <p class="text-fade-50">
            <span class="fa fa-tags"></span> {lang key='tags'}:
            {if $item.coupon_tags}
                {foreach explode(',', $item.coupon_tags) as $tag}
                    <a href="{$tag}" class="tag">{$tag}</a>{if !$tag@last}, {/if}
                {/foreach}
            {else}
                {lang key='no_coupon_tags'}
            {/if}
        </p>
    {/if}

    <div class="meta clearfix">
        <span><span class="fa fa-shopping-cart"></span> {ia_url type='link' item='shops' data=$shop text=$shop.title}</span>
        {if $item.category_id}
            <span><span class="fa fa-folder-o"></span> {ia_url type='link' item='ccats' data=$coupon_category text=$coupon_category.title rel='tag'}</span>
        {/if}
        {if $item.member_id}
            <span><span class="fa fa-user"></span> <a href="{$smarty.const.IA_URL}member/{$item.account_username}.html">{$item.account}</a></span>
        {/if}
    </div>
</div>

{ia_add_js}
$(function()
{
    // Copy code
    var clip_{$item.id} = new ZeroClipboard($('.clip_{$item.id}'),
    {
        moviePath: '{$smarty.const.IA_CLEAR_URL}js/utils/zeroclipboard/ZeroClipboard.swf',
        hoverClass: 'hover',
        activeClass: 'active'
    });

    clip_{$item.id}.on('complete', function(client, args)
    {
        var affiliateLink = $(this).data('affiliate-link');

        if('undefined' != typeof affiliateLink && '' != affiliateLink) {
            window.open(affiliateLink);
        }
    });

    // Picking tags
    $('.couponItem .tag').on('click', function(e)
    {
        e.preventDefault();

        var tag = $.trim($(this).attr('href'));
        $('input[name="q"]').val(tag).closest('form').submit();
    });
});

$(function() {
    $('.js-delete-coupon').on('click', function(e) {
        e.preventDefault();

        intelli.confirm(_t('delete_coupon_confirmation'), { url: $(this).attr('href') });
    });
});
{/ia_add_js}
*}
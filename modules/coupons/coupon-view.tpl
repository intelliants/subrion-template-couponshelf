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

    <div class="d-view__info{if 'deal' == $item.type} -deal{/if}">
        {if $item.gallery}
            {if count($item.gallery) > 1}
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
            {else}
                <div class="sl-gallery">
                    <div class="sl-gallery__item">{ia_image file=$item.gallery[0] type='large' title=$item.title|default:$item.title|escape class='img-responsive'}</div>
                </div>
            {/if}
        {elseif $item.image}
            <div class="d-view__info__img">
                {ia_image file=$item.image type='large' title=$item.title|default:$item.title|escape class='img-responsive'}
            </div>
        {/if}

        <div class="d-view-body">
            <div class="d-view-body__actions">
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
            <div class="d-view-body__type">{lang key="{$item.type}_coupon"}</div>

            {if 'deal' == $item.type}
                <div class="d-view-body__price">
                    {if $item.item_price && '0.00' != $item.item_price}
                        {if $item.item_discount}
                            <span class="d-view-body__price__current">{$core.config.coupon_item_price_currency}{$item.cost}</span>
                            <span class="d-view-body__price__old">{lang key='old_price'} <span>{$core.config.coupon_item_price_currency}{$item.item_price}</span></span>
                            <span class="d-view-body__price__save">{lang key='you_save'}
                                {if 'percent' == $item.item_discount_type}
                                    {$item.item_discount}%
                                {else}
                                    {$core.config.coupon_item_price_currency}{$item.item_discount|string_format:"%.2f"}
                                {/if}
                            </span>
                        {else}
                            <span class="d-view-body__price__current">{$core.config.coupon_item_price_currency}{$item.item_price}</span>
                        {/if}
                    {else}
                        <span class="d-view-body__price__current">{$core.config.coupon_item_price_currency}{$item.cost}</span>
                        {if $item.item_discount}
                            <span class="d-view-body__price__save">
                                {lang key='you_save'} 
                                {if 'percent' == $item.item_discount_type}
                                    {$item.item_discount}%
                                {else}
                                    {$core.config.coupon_item_price_currency}{$item.item_discount|string_format:"%.2f"}
                                {/if}
                            </span>
                        {/if}
                    {/if}
                </div>
            {/if}

            <div class="d-view-body__buy">
                {if 'deal' == $item.type}
                    {if isset($item.buy_code_link)}<a href="{$item.buy_code_link}" class="d-view-body__buy__btn">{lang key='buy'}</a>{/if}
                {else}
                    <a href="#" class="d-view-body__buy__btn js-print-coupon"><span class="fa fa-print"></span> {lang key='print_coupon'}</a>

                    {ia_add_js}
$(function() {
    $('.js-print-coupon').click(function (e) {
        e.preventDefault();

        window.print();
    });
})
                    {/ia_add_js}
                {/if}

                <div class="coupon-rate">
                    <a href="#" class="thumbs-up" data-id="{$item.id}" data-trigger="up"><i class="fa fa-smile-o"></i></a>
                    <span class="rate good" id="thumb_result_{$item.id}">{$item.thumbs_num|default:0}</span>
                    <a href="#" class="thumbs-down" data-id="{$item.id}" data-trigger="down"><i class="fa fa-frown-o"></i></a>
                </div>
            </div>

            <div class="d-view-body__more">
                {if $item.expire_date != 0}
                    <div class="d-view-body__more__item -time-left">
                        <span class="fe fe-clock"></span> <span class="js-countdown" data-countdown="{$item.expire_date}"></span>
                    </div>
                {/if}
                {if $item.activations}
                    <div class="d-view-body__more__item -activations">
                        <span class="fe fe-bag"></span> {$item.activations_sold} {lang key='bought'}
                    </div>
                {/if}
                <div class="d-view-body__more__item -views">
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
                {if isset($codes)}
                    <li><a data-toggle="tab" href="#tab-stats">{lang key='sales_statistics'}</a></li>
                {/if}
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="tab-description">
                    {$item.short_description}
                    {$item.description}
                </div>
                {if isset($codes)}
                    <div class="tab-pane" id="tab-stats">
                        {if $codes}
                            <table class="table">
                                <tbody>
                                    {$total = 0}
                                    {foreach $codes as $codeEntry}
                                        {$total = $total + $codeEntry.amount}
                                        <tr>
                                            <td>
                                                <p>{lang key='simple_coupon'} <strong>{$codeEntry.code}</strong></p>
                                                <p>{$codeEntry.owner|escape}</p>
                                                <p><small>{lang key='transaction'} #{$codeEntry.reference_id}</small></p>
                                            </td>
                                            <td>{$codeEntry.date_paid|date_format}</td>
                                            <td>
                                                <select class="form-control js-code-status" data-id="{$codeEntry.id}">
                                                    {foreach $codeStatuses as $status}
                                                        <option value="{$status}"{if $codeEntry.status == $status} selected{/if}>{lang key=$status}</option>
                                                    {/foreach}
                                                </select>
                                            </td>
                                            <td>{$codeEntry.currency} {$codeEntry.amount}</td>
                                        </tr>
                                    {/foreach}
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>{lang key='total'}: {$total}</td>
                                    </tr>
                                </tbody>
                            </table>
                        {else}
                            <div class="alert alert-info">{lang key='no_codes_bought'}</div>
                        {/if}
                    </div>
                {/if}
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
{ia_add_media files='js:_IA_URL_modules/coupons/js/front/view'}

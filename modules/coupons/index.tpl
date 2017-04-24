{if isset($category.title)}
    <div class="lead">{$category.description}</div>
{/if}

{if isset($categories) && $categories}
    <div class="cats">
        {foreach $categories as $cat}
            <a href="{ia_url type='url' item='ccats' data=$cat text=$cat.title rel='tag'}" class="cats__item">
                <span class="cats__item__icon">
                    <span class="fa {if $cat.icon}{$cat.icon}{else}fa-folder-o{/if}"></span>
                </span>
                <span class="cats__item__title">{$cat.title}</span>
            </a>
        {/foreach}
    </div>
{/if}

{if !empty($coupons)}
    {if isset($sorting)}
        <div class="ia-sorting">
            <div class="ia-sorting__count">
                {lang key='coupons_found'}: {$pagination.total}
            </div>

            <div class="ia-sorting__sorting">
                <div class="btn-group">
                    <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" href="#">
                        {if 'date_added' == $sorting[0]}
                            {lang key='date'}
                        {elseif 'thumbs_num' == $sorting[0]}
                            {lang key='likes'}
                        {elseif 'views_num' == $sorting[0]}
                            {lang key='popularity'}
                        {/if}
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
                        <li><a href="{$smarty.const.IA_SELF}?sort=likes" rel="nofollow"><span class="fa fa-dollar"></span> {lang key='likes'}</a></li>
                        <li><a href="{$smarty.const.IA_SELF}?sort=popularity" rel="nofollow"><span class="fa fa-eye"></span> {lang key='popularity'}</a></li>
                    </ul>
                </div>

                <div class="btn-group">
                    <a class="btn btn-default btn-sm{if 'ASC' == $sorting[1]} active{/if}" href="{$smarty.const.IA_SELF}?order=up" rel="nofollow" title="{lang key='asc'}"><span class="fa fa-long-arrow-down"></span></a>
                    <a class="btn btn-default btn-sm{if 'DESC' == $sorting[1]} active{/if}" href="{$smarty.const.IA_SELF}?order=down" rel="nofollow" title="{lang key='desc'}"><span class="fa fa-long-arrow-up"></span></a>
                </div>
            </div>
        </div>
    {/if}
    <div class="ia-items">
        {foreach $coupons as $listing}
            {include file='extra:coupons/list-coupons'}
        {/foreach}

        {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=1}
    </div>
{elseif isset($category) && $category.parent_id > 0}
    <div class="alert alert-info">{lang key='no_coupons_for_category'}</div>
{elseif !isset($category)}
    <div class="alert alert-info">{lang key='no_my_coupons'}</div>
{/if}
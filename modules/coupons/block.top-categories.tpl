{if $coupon_blocks.top_categories}
    <ul class="b-cats">
        {foreach $coupon_blocks.top_categories as $cat}
            <li class="{if isset($current_category) && $current_category.id == $cat.id} active{/if}">
                <a href="{ia_url type='url' item='ccats' data=$cat}">
                    <span class="fa {if $cat.icon}{$cat.icon}{else}fa-folder-o{/if}"></span>
                    {$cat.title}
                </a>
            </li>
        {/foreach}
    </ul>
{/if}
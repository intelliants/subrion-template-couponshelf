{if !empty($coupons_categories)}
    <ul class="b-cats">
        {foreach $coupons_categories as $cat}
            <li>
                <a href="{ia_url type='url' item='ccats' data=$cat}">
                    <span class="fa {if $cat.icon}{$cat.icon}{else}fa-folder-o{/if}"></span>
                    {$cat.title}
                </a>
            </li>
        {/foreach}
    </ul>
{/if}
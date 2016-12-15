{if $coupon_blocks.top_categories}
	<ul class="b-cats">
		{foreach $coupon_blocks.top_categories as $cat}
			<li>
				<a href="{ia_url type='url' item='ccats' data=$cat}">
					{if $cat.icon}
						{printImage imgfile=$cat.icon.path title=$cat.title|escape:'html'}
					{else}
						<span class="fa fa-{if $cat.category_icon_class}{$cat.category_icon_class}{else}folder-o{/if}"></span>
					{/if}
					{$cat.title}
				</a>
			</li>
		{/foreach}
	</ul>
{/if}
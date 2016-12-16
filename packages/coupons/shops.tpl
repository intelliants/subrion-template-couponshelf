{if !empty($shops)}
	{$letter=''}
	<div class="shops-list">
		{foreach $shops as $listing}
			{if $letter|upper != $listing.title[0]|upper}
				<h2 class="shops-list__separator"><span>{$listing.title[0]|upper}</span></h2>
			{/if}
			{include 'extra:coupons/list-shops'}
			{assign var=letter value=$listing.title[0]}
		{/foreach}
	</div>
{else}
	<div class="alert alert-info">{lang key='no_shops'}</div>
{/if}
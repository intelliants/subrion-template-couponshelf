{if isset($coupon_blocks.top_categories)} 
	<div class="teaser">
		<div class="container">
			<div class="teaser__header">
				<h2>{lang key='teaser_title'}</h2>
				<p>{lang key='teaser_subtitle'}</p>
			</div>

			<form action="{$smarty.const.IA_URL}search/coupons/" class="q-search">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group q-search__cats">
							<select name="category" class="form-control">
								<option value="">{lang key='select_category'}</option>
								{foreach $coupon_blocks.top_categories as $cat}
									<option value="{$cat.id}">{$cat.title}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group q-search__keywords">
							<input name="keywords" class="form-control" type="text" placeholder="{lang key='search_keywords_placeholder'}">
							<button type="submit"><span class="fe fe-search"></span></button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
{/if}
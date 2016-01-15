{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Order summary' mod='Paytm'}</h2>

{assign var='current_step' value='payment'}

{if isset($nbProducts) && $nbProducts <= 0}
    <p class="warning">{l s='Your shopping cart is empty.'}</p>
{else}

<h3>{l s='You have chosen to pay with Paytm' mod='Paytm'}</h3>
<form name="checkout_confirmation" action="{$paytmurl}" method="post" />
	<input type="hidden" name="MID" value="{$merchant_id}" />
	<input type="hidden" name="ORDER_ID" value="{$order_id}" />
	
	<input name="WEBSITE" type="hidden" value="{$website}" />
	<input name="INDUSTRY_TYPE_ID" type="hidden" value="{$industry_type}" />
	<input name="CHANNEL_ID" type="hidden" value="{$channel_id}" />
	<input name="TXN_AMOUNT" type="hidden" value="{$amount}" />
	<input name="EMAIL" type="hidden" value="{$email}" />
	<input name="CUST_ID" type="hidden" value="{$cust_id}" />
	<input name="MOBILE_NO" type="hidden" value="{$mobile_no}" />
	<input name="txnDate" type="hidden" value="{$date}" />
	<input name="CHECKSUMHASH" type="hidden" value="{$checksum}" />
	{$callback_html}
    <p>
		{l s='Here is a short summary of your order:' mod='paytm'}
	</p>
	<p style="margin-top:20px;">
		- {l s='The total amount of your order is' mod='paytm'}
			<span id="amount_{$currency->id}" class="price">{convertPriceWithCurrency price=$total currency=$currency}</span>
			{if $use_taxes == 1}
			{l s='(tax incl.)' mod='paytm'}
			{/if}
	</p>
	<p>
        {l s='You will be redirected to Paytm to complete your payment.' mod='paytm'}
        <br /><br />
        <b>{l s='Please confirm your order by clicking \'I confirm my order\'' mod='paytm'}.</b>
    </p>
	<p class="cart_navigation">
        <input type="submit" name="submit" value="{l s='I confirm my order' mod='checkout'}" class="exclusive_large" />
        <a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Other payment methods' mod='paytm'}</a>
 	</p>
 </form>
{/if}
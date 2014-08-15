[{if $sPaymentID == "pi_ratepay_elv"}]
[{assign var="dynvalue" value=$oView->getDynValue()}]
<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}] style="position:relative; top:-18px;">
        <label for="payment_[{$sPaymentID}]"><b><img src="[{$oViewConf->getImageUrl()}]/pi_ratepay_elv_checkout_logo.png" title="RatePAY Lastschrift" alt="RatePAY Lastschrift" /></b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        <div id="policy[{$sPaymentID}]" style="display: none;">
            <p>
                <font color="red">[{$oxcmp_shop->oxshops__oxname->value}]</font>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_1"}]
                [{$pi_ratepay_elv_duedays}]
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_1_PART_2"}]
            </p>
            <p>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_2"}]
                [{$pi_ratepay_elv_minimumAmount}]
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_3"}]
                [{$pi_ratepay_elv_maximumAmount}]
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_4"}]
            </p>
            <p>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_5"}]</p>
        </div>
        <button id="policyButton[{$sPaymentID}]" class="submitButton largeButton" type="button">
            <span class="policyButtonText[{$sPaymentID}]">[{oxmultilang ident="PI_RATEPAY_SHOW_MORE_INFORMATION"}]</span>
            <span class="policyButtonText[{$sPaymentID}]" style="display: none;">[{oxmultilang ident="PI_RATEPAY_HIDE_MORE_INFORMATION"}]</span>
        </button>
        <ul class="form">
			[{if isset($pi_ratepay_elv_fon_check)}]
				<li>
					<label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_FON"}]</label>
					<input name='pi_ratepay_elv_fon' type='text' value='' size='37'/>
				</li>
				<li>
					<label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_MOBILFON"}]</label>
					<input name='pi_ratepay_elv_mobilfon' type='text' value='' size='37'/>
					<div class='note'>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_FON_NOTE"}]</div>
				</li>
			[{/if}]
			[{if isset($pi_ratepay_elv_birthdate_check)}]
				<li>
					<label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_BIRTHDATE"}]</label>
					<input name='pi_ratepay_elv_birthdate_day' maxlength='2' type='text' value='' field='small'/>
					<input name='pi_ratepay_elv_birthdate_month' maxlength='2' type='text' value='' field='small'/>
					<input name='pi_ratepay_elv_birthdate_year' maxlength='4' type='text' value='' field='small'/>
					<div class='note'>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_BIRTHDATE_FORMAT"}]</div>
				</li>
			[{/if}]
			[{if isset($pi_ratepay_elv_company_check)}]
				<li>
					<label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_COMPANY"}]</label>
					<input name='pi_ratepay_elv_company' maxlength='255' size='37' type='text' value=''/>
				</li>
			[{/if}]
			[{if isset($pi_ratepay_elv_ust_check)}]
				<li>
					<label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PAYMENT_UST"}]</label>
					<input name='pi_ratepay_elv_ust' maxlength='255' size='37' type='text' value=''/>
				</li>
			[{/if}]
        </ul>
        <table style="border: 1px solid #929292">
            <tr>
                <td colspan="2">
                    [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_RATEPAY_ADDRESS"}]
                </td>
            </tr><tr>
                <td>
                    [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_CREDITOR_ID_TEXT"}]:
                </td><td>
                    [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_CREDITOR_ID_VALUE"}]
                </td>
            </tr><tr>
                <td>
                    [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_MANDATE_REFERENCE_TEXT"}]:
                </td><td>
                    [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_MANDATE_REFERENCE_VALUE"}]
                </td>
            </tr>
        </table>
        <ul class="form">
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_BANK_OWNER"}]:</label>
                <input name='pi_ratepay_elv_bank_owner' maxlength='255' size='37' type='text' value='[{$piDbBankowner}]'/>
            </li>
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_BANK_ACCOUNT_NUMBER"}]:</label>
                <input name='pi_ratepay_elv_bank_account_number' maxlength='255' size='37' type='text' value='[{$piDbBankaccountnumber}]'/>
            </li>
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_BANK_CODE"}]:</label>
                <input name='pi_ratepay_elv_bank_code' maxlength='255' size='37' type='text' value='[{$piDbBankcode}]'/>
            </li>
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_BANK_NAME"}]:</label>
                <input name='pi_ratepay_elv_bank_name' maxlength='255' size='37' type='text' value='[{$piDbBankname}]'/>
            </li>
        </ul>
        <div style="margin: 15px 0;">
            <input type="checkbox" name="pi_ratepay_elv_privacy" value="1" style="float: left;" />
            <p>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_1"}]
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_RATEPAY_ADDRESS"}]
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_2"}]
                <a href='[{$pi_ratepay_elv_ratepayurl}]' target='_blank' style="text-decoration:underline;">[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY"}]</a>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_3"}]
            </p><p>
                <b>[{oxmultilang ident="PI_RATEPAY_ELV_VIEW_NOTICE"}]</b><br>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_NOTICE_1"}]<br>
                [{oxmultilang ident="PI_RATEPAY_ELV_VIEW_NOTICE_2"}]
            </p>
        </div>
    </dd>
</dl>

[{oxscript add="piTogglePolicy('$sPaymentID');"}]

[{else}]
[{$smarty.block.parent}]
[{/if}]

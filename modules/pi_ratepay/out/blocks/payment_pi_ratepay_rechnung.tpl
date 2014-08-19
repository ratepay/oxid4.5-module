[{if $sPaymentID == "pi_ratepay_rechnung"}]
[{assign var="dynvalue" value=$oView->getDynValue()}]
<dl>
    <dt>
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}] style="position:relative; top:-17px;">
           <label for="payment_[{$sPaymentID}]"><b><img src="[{$oViewConf->getImageUrl()}]/pi_ratepay_rechnung_checkout_logo.png" title="RatePAY Rechnung" alt="RatePAY Rechnung" /></b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        <div id="policy[{$sPaymentID}]" style="display: none;">
            <p>
                <font color="red">[{$oxcmp_shop->oxshops__oxname->value}]</font>
                [{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_1"}]
                [{$pi_ratepay_rechnung_duedays}]
                [{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_1_PART_2"}]
            </p>
            <p>
                [{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_2"}]
                [{$pi_ratepay_rechnung_minimumAmount}]
                [{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_3"}]
                [{$pi_ratepay_rechnung_maximumAmount}]
                [{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_4"}]
            </p>
            <p>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_INFORMATION_TEXT_5"}]</p>
        </div>
        <button id="policyButton[{$sPaymentID}]" class="submitButton largeButton" type="button">
            <span class="policyButtonText[{$sPaymentID}]">[{oxmultilang ident="PI_RATEPAY_SHOW_MORE_INFORMATION"}]</span>
            <span class="policyButtonText[{$sPaymentID}]" style="display: none;">[{oxmultilang ident="PI_RATEPAY_HIDE_MORE_INFORMATION"}]</span>
        </button>
        <ul class="form">
            [{if isset($pi_ratepay_rechnung_fon_check)}]
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_FON"}]</label>
                <input name='pi_ratepay_rechnung_fon' type='text' value='' size='37'/>
            </li>
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_MOBILFON"}]</label>
                <input name='pi_ratepay_rechnung_mobilfon' type='text' value='' size='37'/>
                <div class='note'>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_FON_NOTE"}]</div>
            </li>
            [{/if}]
            [{if isset($pi_ratepay_rechnung_birthdate_check)}]
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_BIRTHDATE"}]</label>
                <input name='pi_ratepay_rechnung_birthdate_day' maxlength='2' type='text' value='' field='small'/>
                <input name='pi_ratepay_rechnung_birthdate_month' maxlength='2' type='text' value='' field='small'/>
                <input name='pi_ratepay_rechnung_birthdate_year' maxlength='4' type='text' value='' field='small'/>
                <div class='note'>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_BIRTHDATE_FORMAT"}]</div>
            </li>
            [{/if}]
            [{if isset($pi_ratepay_rechnung_company_check)}]
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_COMPANY"}]</label>
                <input name='pi_ratepay_rechnung_company' maxlength='255' size='37' type='text' value=''/>
            </li>
            [{/if}]
            [{if isset($pi_ratepay_rechnung_ust_check)}]
            <li>
                <label>[{oxmultilang ident="PI_RATEPAY_RECHNUNG_VIEW_PAYMENT_UST"}]</label>
                <input name='pi_ratepay_rechnung_ust' maxlength='255' size='37' type='text' value=''/>
            </li>
            [{/if}]
        </ul>
    </dd>
</dl>

[{oxscript add="piTogglePolicy('$sPaymentID');"}]

[{else}]
[{$smarty.block.parent}]
[{/if}]

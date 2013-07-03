<?php

/**
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * @category  PayIntelligent
 * @package   PayIntelligent_RatePAY
 * @copyright (C) 2011 PayIntelligent GmbH  <http://www.payintelligent.de/>
 * @license	http://www.gnu.org/licenses/  GNU General Public License 3
 */

/**
 * {@inheritdoc}
 *
 * Additionally adds RatePAY specific informations.
 *
 * @package   PayIntelligent_RatePAY
 * @extends PdfArticleSummary
 */
class pi_ratepay_rate_pdf_article_summary extends pi_ratepay_rate_pdf_article_summary_parent
{

    /**
     * {@inheritdoc}
     *
     * Additionally adds RatePAY informations.
     *
     * @param int &$iStartPos text start position
     */
    protected function _setPaymentMethodInfo(&$iStartPos)
    {
        $oPayment = oxNew('oxpayment');
        $oPayment->loadInLang($this->_oData->getSelectedLang(), $this->_oData->oxorder__oxpaymenttype->value);

        if ($oPayment->oxpayments__oxid->value == "pi_ratepay_rate") {
            $oPayment = oxNew('oxpayment');
            $oPayment->loadInLang($this->_oData->getSelectedLang(), $this->_oData->oxorder__oxpaymenttype->value);

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PDF_PAYMETHOD') . " " . $oPayment->oxpayments__oxdesc->value;
            $this->font('Arial', '', 10);
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 8;

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PLAN_HINT');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 8;
        } else {
            parent::_setPaymentMethodInfo($iStartPos);
        }
    }

    /**
     * {@inheritdoc}
     *
     * Additionally adds RatePAY informations.
     *
     * @param int &$iStartPos text start position
     */
    protected function _setPayUntilInfo(&$iStartPos)
    {
        $oPayment = oxNew('oxpayment');
        $oPayment->loadInLang($this->_oData->getSelectedLang(), $this->_oData->oxorder__oxpaymenttype->value);

        if ($oPayment->oxpayments__oxid->value == "pi_ratepay_rate") {
            $settings = oxNew('pi_ratepay_settings');
            $settings->loadByType('installment');

            $value = $settings->pi_ratepay_settings__debt_holder->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RATE_PDF_ADDITIONALINFO_1') . $value . ', ';
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PDF_ADDITIONALINFO_2') . $value;
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PDF_ADDITIONALINFO_3') . $value;
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PDF_ADDITIONALINFO_4');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 8;

            $text = $this->_oData->translate('PI_RATEPAY_RATE_PAYMENT_HINT');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            // Payment Information
            $accountHolder = $settings->pi_ratepay_settings__account_holder->rawValue;
            $bankName = $settings->pi_ratepay_settings__bank_name->rawValue;
            $bankCode = $this->_oData->translate('PI_RATEPAY_RATE_PDF_BANKCODENUMBER_SHORT') . ': ' . $settings->pi_ratepay_settings__bank_code_number->rawValue;
            $accountNumber = $this->_oData->translate('PI_RATEPAY_RATE_PDF_ACCOUNTNUMBER_SHORT') . ': ' . $settings->pi_ratepay_settings__account_number->rawValue;

            $text = $accountHolder . ', ' . $bankName . ', ' . $bankCode . ', ' . $accountNumber . '.';
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $value = $settings->pi_ratepay_settings__invoice_field->rawValue;

            if ($value != "") {
                $iStartPos += 4;
                $textArray = explode("\r\n", $value);

                foreach ($textArray as $text) {
                    $this->text(15, $iStartPos + 4, $text);
                    $iStartPos += 4;
                }
            }
        } else {
            parent::_setPayUntilInfo($iStartPos);
        }
    }

}

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
class pi_ratepay_rechnung_pdf_article_summary extends pi_ratepay_rechnung_pdf_article_summary_parent
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
        if ($oPayment->oxpayments__oxid->value == "pi_ratepay_rechnung") {
            $oPayment = oxNew('oxpayment');
            $oPayment->loadInLang($this->_oData->getSelectedLang(), $this->_oData->oxorder__oxpaymenttype->value);

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_PAYMETHOD') . " " . $oPayment->oxpayments__oxdesc->value;
            $this->font('Arial', '', 10);
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;
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
        if ($oPayment->oxpayments__oxid->value == "pi_ratepay_rechnung") {
            $settings = oxNew('pi_ratepay_settings');
            $settings->loadByType('invoice');

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_PAYUNTIL_1');
            $this->text(15, $iStartPos + 4, $text);

            $width = 15 + $this->_oPdf->getStringWidth($text);
            $due = $settings->pi_ratepay_settings__duedate->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_PAYUNTIL_2');
            $this->text($width, $iStartPos + 4, $due . $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_PAYTRANSFER');
            $this->text(15, $iStartPos + 8, $text);
            $iStartPos += 8;

            $value = $settings->pi_ratepay_settings__account_holder->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ACCOUNTHOLDER') . " $value";
            $this->text(15, $iStartPos + 8, $text);
            $iStartPos += 8;

            $value = $settings->pi_ratepay_settings__bank_name->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_BANKNAME') . " $value";
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $value = $settings->pi_ratepay_settings__bank_code_number->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_BANKCODENUMBER') . " $value";
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $value = $settings->pi_ratepay_settings__account_number->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ACCOUNTNUMBER') . " $value";
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;


            $oid = $this->_oData->getId();

            $ratepayOrder = oxNew('pi_ratepay_orders');
            $ratepayOrder->loadByOrderNumber($oid);

            $value = $ratepayOrder->pi_ratepay_orders__descriptor->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_REFERENCE') . " " . $value;
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;


            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_INTERNATIONALDESC');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $value = $settings->pi_ratepay_settings__swift_bic->rawValue;
            $values = $settings->pi_ratepay_settings__iban->rawValue;
            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_SWIFTBIC') . " $value " . $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_IBAN') . " $values";
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ADDITIONALINFO_1');
            $this->text(15, $iStartPos + 8, $text);
            $iStartPos += 8;

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ADDITIONALINFO_2');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ADDITIONALINFO_3');
            $this->text(15, $iStartPos + 4, $text);
            $iStartPos += 4;

            $text = $this->_oData->translate('PI_RATEPAY_RECHNUNG_PDF_ADDITIONALINFO_4');
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

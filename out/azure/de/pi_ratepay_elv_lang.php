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
 * @package   PayIntelligent_RatePAY_Elv
 * @copyright (C) 2011 PayIntelligent GmbH  <http://www.payintelligent.de/>
 * @license	http://www.gnu.org/licenses/  GNU General Public License 3
 */
// -------------------------------
// RESOURCE IDENTITFIER = STRING
// -------------------------------
$sLangName = "Deutsch";

$piErrorAge = 'Um eine Zahlung per RatePAY SEPA-Lastschrift durchzuf&uuml;hren, m&uuml;ssen Sie mindestens 18 Jahre alt sein.';
$piErrorBirth = 'Um eine Zahlung per RatePAY SEPA-Lastschrift durchzuf&uuml;hren, geben Sie bitte Ihr Geburtsdatum ein.';
$piErrorPhone = 'Um eine Zahlung per RatePAY SEPA-Lastschrift durchzuf&uuml;hren, geben Sie bitte Ihre Telefonnummer ein.';
$piErrorCompany = 'Geben Sie bitte Ihren Firmennamen und Ihre Umsatzsteuer-ID ein.';
$piErrorBirthdayDigits = 'Geben Sie bitte Ihr Geburtsjahr vierstellig ein. (z.B. 1982)';

$aLang = array(
    'charset'                                       => 'UTF-8',
    'PI_RATEPAY_ELV_VIEW_RATEPAY_ADDRESS'          => 'RatePAY GmbH, Schl&uuml;terstr. 39, 10629 Berlin',
    'PI_RATEPAY_ELV_VIEW_CREDITOR_ID_TEXT'         => 'Gl&auml;ubiger-ID',
    'PI_RATEPAY_ELV_VIEW_CREDITOR_ID_VALUE'        => 'DE39RPY00000568463',
    'PI_RATEPAY_ELV_VIEW_MANDATE_REFERENCE_TEXT'   => 'Mandatsreferenz',
    'PI_RATEPAY_ELV_VIEW_MANDATE_REFERENCE_VALUE'  => '(wird nach Kaufabschluss &uuml;bermittelt)',
    'PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY'           => 'RatePAY-Datenschutzerkl&auml;rung',
    'PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_1'         => 'Ich willige hiermit in die Weiterleitung meiner Daten an',
    'PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_2'         => 'gem&auml;&szlig;',
    'PI_RATEPAY_ELV_VIEW_PRIVACY_POLICY_3'         => 'ein und erm&auml;chtige diese, mit diesem Kaufvertrag in Zusammenhang stehende Zahlungen von meinem o.a. Konto mittels Lastschrift einzuziehen. Zugleich weise ich mein Kreditinstitut an, die von RatePAY GmbH auf mein Konto gezogenen Lastschriften einzul&ouml;sen.',
    'PI_RATEPAY_ELV_VIEW_NOTICE'                   => 'Hinweis',
    'PI_RATEPAY_ELV_VIEW_NOTICE_1'                 => 'Nach Zustandekommen des Vertrags wird mir die Mandatsreferenz von RatePAY mitgeteilt.',
    'PI_RATEPAY_ELV_VIEW_NOTICE_2'                 => 'Ich kann innerhalb von acht Wochen, beginnend mit dem Belastungsdatum, die Erstattung des belasteten Betrages verlangen. Es gelten dabei die mit meinem Kreditinstitut vereinbarten Bedingungen.',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_1'        => ' stellt mit der Unterst&uuml;tzung von RatePAY die M&ouml;glichkeit der RatePAY SEPA-Lastschrift bereit. Sie nehmen damit einen Kauf auf Lastschrift vor. Die Lastschrift ist innerhalb von ',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_1_PART_2' => ' Tagen nach Rechnungsdatum zur Zahlung f&auml;llig.',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_2'        => 'RatePAY SEPA-Lastschrift ist <b>ab einem Einkaufswert von ',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_3'        => ' &#8364;</b> und <b>bis zu einem Einkaufswert von ',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_4'        => ' &#8364;</b> m&ouml;glich (jeweils inklusive Mehrwertsteuer und Versandkosten).',
    'PI_RATEPAY_ELV_VIEW_INFORMATION_TEXT_5'        => 'Bitte beachten Sie, dass RatePAY SEPA-Lastschrift nur genutzt werden kann, wenn Lastschrifts- und Lieferaddresse identisch sind und Ihrem privaten Wohnort entsprechen. (keine Firmen- und keine Postfachadresse). Ihre Adresse muss im Gebiet der Bundesrepublik Deutschland liegen. Bitte gehen Sie gegebenenfalls zur&uuml;ck und korrigieren Sie Ihre Daten.',
    'PI_RATEPAY_ELV_ERROR'                          => 'Leider ist eine Bezahlung mit RatePAY nicht m&ouml;glich. Diese Entscheidung ist von RatePAY auf der Grundlage einer automatisierten Datenverarbeitung getroffen worden. Einzelheiten erfahren Sie in der ',
    'PI_RATEPAY_ELV_AGBERROR'                       => 'Bitte akzeptieren Sie die Bedingungen.',
    'PI_RATEPAY_ELV_SUCCESS'                        => 'Bestellung erfolgreich abgeschlossen',
    'PI_RATEPAY_ELV_ERROR_ADDRESS'                  => 'Bitte beachten Sie, dass RatePAY Rate nur genutzt werden kann, wenn Lastschrifts- und Lieferaddresse identisch sind.',
    'PI_RATEPAY_ELV_ERROR_BIRTH'                    => $piErrorBirth,
    'PI_RATEPAY_ELV_ERROR_PHONE'                    => $piErrorPhone,
    'PI_RATEPAY_ELV_ERROR_AGE'                      => $piErrorAge,
    'PI_RATEPAY_ELV_VIEW_PAYMENT_FON'               => 'Telefon:',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_MOBILFON'          => 'Mobiltelefon:',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_BIRTHDATE'         => 'Geburtsdatum:',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_BIRTHDATE_FORMAT'  => '(tt.mm.jjjj)',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_FON_NOTE'          => 'Tragen Sie bitte entweder Ihr Telefon oder Mobiltelefon ein.',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_COMPANY'           => 'Firma:',
    'PI_RATEPAY_ELV_VIEW_PAYMENT_UST'               => 'USt-IdNr.',
    'PI_RATEPAY_ERROR_BIRTHDAY_YEAR_DIGITS'         => $piErrorBirthdayDigits,
    'PI_RATEPAY_ERROR_COMPANY'                      => $piErrorCompany,
    'PI_RATEPAY_ELV_ERROR_OWNER'                    => 'Um eine Zahlung per SEPA-RatePAY Lastschrift durchzuf&uuml;hren, geben Sie bitte den Namen des Kontoinhabers ein.',
    'PI_RATEPAY_ELV_ERROR_ACCOUNT_NUMBER'           => 'Um eine Zahlung per SEPA-RatePAY Lastschrift durchzuf&uuml;hren, geben Sie bitte eine g&uuml;ltige IBAN bzw. Kontonummer eines inl&auml;ndischen Bankkontos ein.',
    'PI_RATEPAY_ELV_ERROR_CODE'                     => 'Um eine Zahlung per SEPA-RatePAY Lastschrift durchzuf&uuml;hren, geben Sie bitte die BLZ ein.',
    'PI_RATEPAY_ELV_ERROR_NAME'                     => 'Um eine Zahlung per SEPA-RatePAY Lastschrift durchzuf&uuml;hren, geben Sie bitte den Banknamen ein.',
    'PI_RATEPAY_ELV_VIEW_BANK_OWNER'                => 'Vor- und Nachname Kontoinhaber',
    'PI_RATEPAY_ELV_VIEW_BANK_ACCOUNT_NUMBER'       => 'IBAN/Kontonummer',
    'PI_RATEPAY_ELV_VIEW_BANK_CODE'                 => 'BIC/Bankleitzahl',
    'PI_RATEPAY_ELV_VIEW_BANK_NAME'                 => 'Kreditinstitut',
    'PI_RATEPAY_ELV_ERROR_BANKCODE_TO_SHORT'        => 'Die Bankleitzahl muss acht Zeichen lang sein.'
);

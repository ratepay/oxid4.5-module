<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of pi_ratepay_util
 *
 * @author enes
 */
class pi_ratepay_util_utilities
{

    /**
     * Static array of RatePAY payment methods.
     * @var array
     */
    public static $_RATEPAY_PAYMENT_METHOD = array(
        'pi_ratepay_rechnung',
        'pi_ratepay_rate',
        'pi_ratepay_elv'
    ); // 'pi_ratepay_vorkasse'
    public static $_RATEPAY_PAYMENT_METHOD_NAMES = array(
        'invoice'     => "rechnung",
        'installment' => "rate",
        'elv'         => "elv"
    ); // 'prepayment' => "vorkasse"

    /**
     * Static array of supported countries.
     * @var array
     */
    public static $_RATEPAY_ALLOWED_COUNTRIES = array('de', 'at'); // 'ch'

    const PI_MODULE_VERSION = '2.6.0';

    public static function getPaymentMethod($paymentType)
    {
        $paymentMethod = null;
        switch ($paymentType) {
            case 'pi_ratepay_rechnung':
                $paymentMethod = 'INVOICE';
                break;
            case 'pi_ratepay_rate':
                $paymentMethod = 'INSTALLMENT';
                break;
            case 'pi_ratepay_elv':
                $paymentMethod = 'ELV';
                break;
            default:
                break;
        }

        return $paymentMethod;
    }

    public function getCountry()
    {
        return strtolower(oxDb::getDb()->getOne("SELECT OXISOALPHA2 FROM oxcountry WHERE OXID = '" . $this->getUser()->oxuser__oxcountryid->value . "'"));
    }

}

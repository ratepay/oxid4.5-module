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
 * Model class for pi_ratepay_settings table
 * @extends oxBase
 */
class pi_ratepay_Settings extends oxBase
{

    /**
     * Current class name
     *
     * @var string
     */
    protected $_sClassName = 'pi_ratepay_Settings';

    /**
     * Current country
     *
     * @var string
     */
    protected $_country = null;

    /**
     * Class constructor
     *
     * @return null
     */
    public function __construct()
    {
        parent::__construct();
        $this->init('pi_ratepay_settings');
    }

    /**
     * Load either invoice or installment settings
     *
     * @param string $type 'invoice' | 'installment'
     * @return boolean
     */
    public function loadByType($type, $country = null)
    {
        if ($country !== null) {
            $this->_setCountry($country);
        }

        //getting at least one field before lazy loading the object
        $this->_addField('oxid', 0);
        $whereClause = array(
            $this->getViewName() . ".type" => strtolower($type),
            $this->getViewName() . ".country" => $this->_getCountry()
        );
        $selectQuery = $this->buildSelectString($whereClause);

        $return = $this->_isLoaded = $this->assignRecord($selectQuery);
        return $return;
    }

    private function _getCountry()
    {
        if ($this->_country === null) {
            $this->_country = pi_ratepay_util_utilities::getCountry();
        }
        return $this->_country;
    }

    private function _setCountry($country)
    {
        $this->_country = $country;
    }
}

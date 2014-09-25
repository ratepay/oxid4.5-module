<!--
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
* @package   PayIntelligent_RatePAY_Rechnung
* @copyright (C) 2011 PayIntelligent GmbH  <http://www.payintelligent.de/>
* @license	http://www.gnu.org/licenses/  GNU General Public License 3
*-->
[{include file="headitem.tpl" titre="[ratepay]"}]

<script type="text/javascript" src="../../out/admin/src/js/libs/jquery.js"></script>
<script type="text/javascript" src="../../out/admin/src/js/libs/ratepay_profile.js"></script>
<script type="text/javascript">
    countries = [[{foreach item=country from=$allCountries}] '[{$country}]',[{/foreach}]];
    activeCountries = [[{foreach item=country from=$activeCountries}] '[{$country}]',[{/foreach}]];
    methods = [[{foreach item=method from=$allMethods}] '[{$method}]',[{/foreach}]];
</script>

<form name="myedit" id="myedit" action="[{$shop->selflink}]" method="post">

<table cellspacing="0" cellpadding="0" border="0" width="100%">
    <tr>
        <td width="100%" align="center" valign="top">
            [{$shop->hiddensid}]
            <input type="hidden" name="cl" value="pi_ratepay_Profile">
            <input type="hidden" name="fnc" value="saveRatepayProfile">
            <input type="hidden" name="stoken" value="[{$stoken}]">

            <table cellspacing="0" cellpadding="0" border="0" height="100%" width="100%">
                <tr style="display: block;">
                    <td valign="top" align="left" class="edittext">
                        [{if $sError}]
                            <span class="loginerror">[{$sError}]</span><br>
                            <br>
                        [{/if}]
                        RatePAY Modul v[{$moduleVersion}]<br/><br/>

                        [{if $saved === true}]
                            <span style="font-weight: bold; color: #FFFFFF; background-color: #0B610B">[{oxmultilang ident="PI_RATEPAY_PROFILE_SAVED"}]</span><br/><br/>
                        [{/if}]

                        [{foreach key=country item=countryValue from=$config}]
                            [{if $country != 'de'}]
                                [{if isset($activeCountries.$country)}]
                                    <input type="checkbox" name="rp_country_active_[{$country}]" id="rp_country_active_[{$country}]" checked='checked' value='on'>
                                [{else}]
                                    <input type="checkbox" name="rp_country_active_[{$country}]" id="rp_country_active_[{$country}]">
                                [{/if}]
                                [{oxmultilang ident="PI_RATEPAY_PROFILE_COUNTRY_"|cat:$country|upper}]&nbsp;[{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_ACTIVE"}]
                                <br/><br/>
                            [{/if}]

                            <fieldset id="rp_country_fieldset_[{$country}]" style="padding-left: 5px; padding-right: 5px;">
                            <legend id="rp_credentials_title_[{$country}]" style="display: block;">[{oxmultilang ident="PI_RATEPAY_PROFILE_COUNTRY_"|cat:$country|upper}]</legend><br>
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td>
                                        [{foreach key=method item=methodValue from=$countryValue}]
                                            [{if $methodValue.active === true}]
                                                <input type="checkbox" name="rp_active_[{$method}]_[{$country}]" id="rp_active_[{$method}]_[{$country}]" checked='checked' value='on'>
                                            [{else}]
                                                <input type="checkbox" name="rp_active_[{$method}]_[{$country}]" id="rp_active_[{$method}]_[{$country}]">
                                            [{/if}]
                                            [{oxmultilang ident="PI_RATEPAY_"|cat:$method|upper}]&nbsp;[{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_ACTIVE"}]
                                            <br/>
                                            [{if isset($errMsg.$country.$method)}]<span style="color: red;">[{oxmultilang ident=$errMsg.$country.$method}]</span>[{/if}]
                                            <br/>

                                            <fieldset id="rp_fieldset_[{$method}]_[{$country}]" style="padding-left: 5px; padding-right: 5px;">
                                                <legend style="font-weight: bold;">[{oxmultilang ident="PI_RATEPAY_"|cat:$method|upper}]</legend><br>
                                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                    <tr>
                                                        <td class="edittext" width="15%">
                                                            [{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_PROFILEID"}]:
                                                        </td><td class="edittext">
                                                            <input type="text" class="editinput" size="50" maxlength="255" name="rp_profile_id_[{$method}]_[{$country}]" value="[{$methodValue.profile_id}]" [{if isset($errMsg.$country.$method)}] style="color: red; font-weight: bold" [{/if}] />
                                                        </td>
                                                    </tr><tr>
                                                        <td class="edittext">
                                                            [{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_SECURITYCODE"}]:
                                                        </td><td class="edittext">
                                                            <input type="text" class="editinput" size="50" maxlength="255" name="rp_security_code_[{$method}]_[{$country}]" value="[{$methodValue.security_code}]"
                                                            [{if isset($errMsg.$country.$method)}]
                                                                style="color: red; font-weight: bold"
                                                            [{/if}]
                                                            />
                                                        </td>
                                                    </tr><tr>
                                                        <td class="edittext">
                                                            [{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_SANDBOX"}]:
                                                        </td><td class="edittext">
                                                            [{if $methodValue.sandbox === true}]
                                                            <input type="checkbox" name="rp_sandbox_[{$method}]_[{$country}]" checked='checked' value='on'>
                                                            [{else}]
                                                            <input type="checkbox" name="rp_sandbox_[{$method}]_[{$country}]">
                                                            [{/if}]
                                                        </td>
                                                    </tr><tr>
                                                        <td class="edittext">
                                                            [{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_LOGGING"}]:
                                                        </td><td class="edittext">
                                                            [{if $methodValue.logging === true}]
                                                            <input type="checkbox" name="rp_logging_[{$method}]_[{$country}]" checked='checked' value='on'>
                                                            [{else}]
                                                            <input type="checkbox" name="rp_logging_[{$method}]_[{$country}]">
                                                            [{/if}]
                                                        </td>
                                                    </tr><tr>
                                                        <td class="edittext">
                                                            [{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_DUEDATE"}]:
                                                        </td><td class="edittext">
                                                            <input type="text" class="editinput" size="3" maxlength="2" name="rp_duedate_[{$method}]_[{$country}]" value="[{$methodValue.duedate}]">
                                                            &nbsp;[{oxmultilang ident="PI_RATEPAY_PROFILE_SETTINGS_DUEDATE_DAY"}]
                                                        </td>
                                                    </tr>
                                                    [{if isset($methodValue.installment_configuration)}]
                                                        <tr>
                                                            <td class="edittext" colspan="2">
                                                                <fieldset id="" style="padding-left: 5px; padding-right: 5px; display: block;">
                                                                    <legend>[{oxmultilang ident="PI_RATEPAY_ADMIN_MENU_CONFIGURATION"}]</legend><br>
                                                                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                                        [{foreach key=key item=value from=$methodValue.installment_configuration}]
                                                                        <tr>
                                                                            <td>
                                                                                [{$key}]
                                                                            </td><td>
                                                                                [{$value}]
                                                                            </td>
                                                                        </tr>
                                                                        [{/foreach}]
                                                                    </table>
                                                                </fieldset>
                                                            </td>
                                                        </tr>
                                                    [{/if}]
                                                    [{if isset($methodValue.details)}]
                                                    <tr>
                                                        <td class="edittext" colspan="2" align="right">
                                                            <a id="rp_details_link_[{$method}]_[{$country}]" style="text-decoration: underline;">[{oxmultilang ident="PI_RATEPAY_DETAILS"}]</a>
                                                            <fieldset id="rp_details_fieldset_[{$method}]_[{$country}]" style="padding-left: 5px; padding-right: 5px; display: none;">
                                                                <legend>[{oxmultilang ident="PI_RATEPAY_DETAILS"}]</legend><br>
                                                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                                                    [{foreach key=schluessel item=wert from=$methodValue.details}]
                                                                    <tr>
                                                                        <td>
                                                                            [{$schluessel}]
                                                                        </td><td>
                                                                            [{$wert}]
                                                                        </td>
                                                                    </tr>
                                                                    [{/foreach}]
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                    </tr>
                                                    [{/if}]
                                                </table>
                                            </fieldset>
                                            <br/>
                                        [{/foreach}]
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                            <br/>
                        [{/foreach}]

                    </td>
                </tr><tr>
                    <td valign="top" align="left" class="edittext" colspan="2">
                        [{$shop->hiddensid}]
                        <input type="submit" class="edittext" name="[{oxmultilang ident="PI_RATEPAY_PROFILE_SAVE"}]" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[{oxmultilang ident="PI_RATEPAY_PROFILE_SAVE"}]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</form>

[{include file="bottomitem.tpl"}]

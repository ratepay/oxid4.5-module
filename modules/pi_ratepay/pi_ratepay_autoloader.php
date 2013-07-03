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
function piRatepayAutoloader($className)
{
    $className = strtolower(basename($className));
    $basePath = getShopBasePath() . 'modules/pi_ratepay/';

    $classDirectories = array(
        $basePath . 'core/',
        $basePath . 'interfaces/'
    );
    foreach ($classDirectories as $directory) {
        $filename = $directory . $className . '.php';

        if (file_exists($filename)) {
            include $filename;
            return;
        }
    }
}

function piRatepayNewAutoloader($className)
{
    $basePath = getShopBasePath() . 'modules/pi_ratepay/';
    $pathToClass = str_replace('_', '/', $className);

    $filename = $basePath . $pathToClass . '.php';

    if (file_exists($filename)) {
        include $filename;
        return;
    }
}

spl_autoload_register("piRatepayAutoloader");
spl_autoload_register("piRatepayNewAutoloader");

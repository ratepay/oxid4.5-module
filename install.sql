CREATE TABLE IF NOT EXISTS `pi_ratepay_settings` (
  `OXID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT '0',
  `COUNTRY` varchar(2) NOT NULL,
  `PROFILE_ID` varchar(255) DEFAULT NULL,
  `SECURITY_CODE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SANDBOX` tinyint(1) NOT NULL DEFAULT '1',
  `LOGGING` tinyint(1) NOT NULL DEFAULT '1',
  `TYPE` varchar(11) NOT NULL,
  `LIMIT_MIN` int(4) NOT NULL DEFAULT '0',
  `LIMIT_MAX` int(6) NOT NULL DEFAULT '0',
  `PAYMENT_FIRSTDAY` tinyint(1) NOT NULL DEFAULT '0',
  `DUEDATE` int(11) NOT NULL DEFAULT '14',
  `SAVEBANKDATA` tinyint(1) NOT NULL DEFAULT '0',
  `ACTIVATE_ELV` tinyint(1) NOT NULL DEFAULT '0',
  `WHITELABEL` tinyint(4) NOT NULL DEFAULT '0',
  `B2B` tinyint(4) NOT NULL DEFAULT '0',
  `ALA` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pi_ratepay_orders` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(32) character set latin1 collate latin1_general_ci NOT NULL,
  `TRANSACTION_ID` varchar(64) NOT NULL,
  `TRANSACTION_SHORT_ID` varchar(20) NOT NULL,
  `DESCRIPTOR` varchar(20) NOT NULL,
  `USERBIRTHDATE` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_order_details` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ORDERED` INT NOT NULL DEFAULT '1',
  `SHIPPED` INT NOT NULL DEFAULT '0',
  `CANCELLED` INT NOT NULL DEFAULT '0',
  `RETURNED` INT NOT NULL DEFAULT '0',
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_logs` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(255) CHARACTER SET utf8 NOT NULL,
  `TRANSACTION_ID` varchar(255) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_METHOD` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_TYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_SUBTYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `RESULT` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REQUEST` mediumtext CHARACTER SET utf8 NOT NULL,
  `RESPONSE` mediumtext CHARACTER SET utf8 NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESULT_CODE` varchar(5) CHARACTER SET utf8 NOT NULL,
  `FIRST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `LAST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REASON` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_history` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR (255) NOT NULL,
  `QUANTITY` INT NOT NULL,
  `METHOD` VARCHAR( 40 ) NOT NULL,
  `SUBMETHOD` VARCHAR( 40 ) DEFAULT '',
  `DATE` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_rate_details` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDERID` VARCHAR(255) NOT NULL ,
  `TOTALAMOUNT` DOUBLE NOT NULL ,
  `AMOUNT` DOUBLE NOT NULL ,
  `INTERESTAMOUNT` DOUBLE NOT NULL ,
  `SERVICECHARGE` DOUBLE NOT NULL ,
  `ANNUALPERCENTAGERATE` DOUBLE NOT NULL ,
  `MONTHLYDEBITINTEREST` DOUBLE NOT NULL ,
  `NUMBEROFRATES` DOUBLE NOT NULL ,
  `RATE` DOUBLE NOT NULL ,
  `LASTRATE` DOUBLE NOT NULL,
  `CHECKOUTTYPE` VARCHAR(255) DEFAULT '',
  `OWNER` VARCHAR(255) DEFAULT '',
  `BANKACCOUNTNUMBER` VARCHAR(255) DEFAULT '',
  `BANKCODE` VARCHAR(255) DEFAULT '',
  `BANKNAME` VARCHAR(255) DEFAULT '',
  `IBAN` VARCHAR(255) DEFAULT '',
  `BICSWIFT` VARCHAR(255) DEFAULT '',
  PRIMARY KEY  (`OXID`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_debit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(256) NOT NULL,
  `owner` blob NOT NULL,
  `accountnumber` blob NOT NULL,
  `bankcode` blob NOT NULL,
  `bankname` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'installment', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'installment', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'installment', 14);

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rechnung', 1, 'RatePAY Rechnung', 0, 'abs', 0, 0, 999999999, '', 1, 'RatePAY Rechnung', '', '', '', '', '', '', '', '', '', 0, '');
INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rate', 1, 'RatePAY Rate', 0, 'abs', 0, 0, 999999999, '', 1, 'RatePAY Rate', '', '', '', '', '', '', '', '', '', 0, '');
INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_elv', 1, 'RatePAY SEPA-Lastschrift', 0, 'abs', 0, 0, 999999999, '', 1, 'RatePAY SEPA-Lastschrift', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO `oxvoucherseries` (`OXID`, `OXSHOPID`, `OXSERIENR`, `OXSERIEDESCRIPTION`, `OXDISCOUNT`, `OXDISCOUNTTYPE`, `OXSTARTDATE`, `OXRELEASEDATE`, `OXBEGINDATE`, `OXENDDATE`, `OXALLOWSAMESERIES`, `OXALLOWOTHERSERIES`, `OXALLOWUSEANOTHER`, `OXMINIMUMVALUE`, `OXCALCULATEONCE`) VALUES ('Anbieter Gutschrift', 'oxbaseshop', 'Anbieter Gutschrift', 'Anbieter Gutschrift', '0.00', 'absolute', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '1', '0.00', '0');

INSERT INTO `oxtplblocks` (`OXID`, `OXACTIVE`, `OXSHOPID`, `OXTEMPLATE`, `OXBLOCKNAME`, `OXPOS`, `OXFILE`, `OXMODULE`) VALUES
('d0602efe9156e48d77ef598b4ff77185', 1, 'oxbaseshop', 'page/checkout/payment.tpl', 'checkout_payment_errors', 0, 'payment_pi_ratepay_error', 'pi_ratepay'),
('3fc0c577e67b640db4f81207731b632e', 1, 'oxbaseshop', 'page/checkout/payment.tpl', 'select_payment', 0, 'payment_pi_ratepay_rechnung', 'pi_ratepay'),
('fd3b94d4c20488a72d72fcc2b801437d', 1, 'oxbaseshop', 'page/checkout/payment.tpl', 'select_payment', 1, 'payment_pi_ratepay_rate', 'pi_ratepay'),
('702fad7c05f86941ab211c65f6b5ba26', 1, 'oxbaseshop', 'page/checkout/order.tpl', 'checkout_order_main', 0, 'order_pi_ratepay_waitingwheel', 'pi_ratepay'),
('4f991f0eeb4bb9e189e300adeb2e28f5', 1, 'oxbaseshop', 'page/checkout/order.tpl', 'shippingAndPayment', 0, 'order_pi_ratepay_rate', 'pi_ratepay'),
('e2c14c1e252744629aa818187e7bc8ae', 1, 'oxbaseshop', 'page/checkout/order.tpl', 'checkout_order_btn_confirm_bottom', 0, 'order_pi_ratepay_checkout_order', 'pi_ratepay'),
('c3658e0e1002c1921edd359257260d6f', 1, 'oxbaseshop', 'page/checkout/payment.tpl', 'select_payment', 0, 'payment_pi_ratepay_elv', 'pi_ratepay');
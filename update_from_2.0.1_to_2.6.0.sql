-- Update Script, updates 2.0.1.x DB RatePAY OXID Module to 2.6.0 DB
DROP TABLE `pi_ratepay_settings`;

CREATE TABLE `pi_ratepay_settings` (
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

INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('DE', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis', 1, 1, 'installment', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('AT', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-at', 1, 1, 'installment', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'invoice', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'elv', 14);
INSERT INTO `pi_ratepay_settings` (`country`, `url`, `sandbox`, `logging`, `type`, `duedate`) VALUES ('CH', 'http://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-ch', 1, 1, 'installment', 14);

UPDATE `oxpayments` SET `OXACTIVE` = 1, `OXFROMAMOUNT` = 0, `OXTOAMOUNT` = 999999999, OXCHECKED = 1 WHERE `oxpayments`.`OXID` IN ('pi_ratepay_rechnung', 'pi_ratepay_rate', 'pi_ratepay_elv');

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_elv', 1, 'RatePAY Lastschrift', 0, 'abs', 0, 20, 1500, '', 1, 'RatePAY Lastschrift', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO `oxtplblocks` (`OXID`, `OXACTIVE`, `OXSHOPID`, `OXTEMPLATE`, `OXBLOCKNAME`, `OXPOS`, `OXFILE`, `OXMODULE`) VALUES ('c3658e0e1002c1921edd359257260d6f', '1', 'oxbaseshop', 'page/checkout/payment.tpl', 'select_payment', '0', 'payment_pi_ratepay_elv', 'pi_ratepay');

CREATE TABLE `pi_ratepay_debit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(256) NOT NULL,
  `owner` blob NOT NULL,
  `accountnumber` blob NOT NULL,
  `bankcode` blob NOT NULL,
  `bankname` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;
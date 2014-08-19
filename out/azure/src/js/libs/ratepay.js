function rpElvSwitch(element) {
    if(isNaN(element.value)) {
        element.name = 'pi_ratepay_elv_bank_iban';
        document.getElementById('PI_RATEPAY_ELV_VIEW_BANK_CODE').style.display = 'none';
    } else {
        element.name = 'pi_ratepay_elv_bank_account_number';
        document.getElementById('PI_RATEPAY_ELV_VIEW_BANK_CODE').style.display = 'inline-block';
    }
}
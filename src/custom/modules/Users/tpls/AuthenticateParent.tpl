{*
/*
 * Your installation or use of this SugarCRM file is subject to the applicable
 * terms available at
 * http://support.sugarcrm.com/06_Customer_Center/10_Master_Subscription_Agreements/.
 * If you do not agree to all of the applicable terms or do not have the
 * authority to bind the entity as an authorized representative, then do not
 * install or use this SugarCRM file.
 *
 * Copyright (C) SugarCRM Inc. All rights reserved.
 */
*}
<!DOCTYPE HTML>
<HTML>
<body>
<script>
window.opener.postMessage('{$authorization|@json|escape:javascript}', '{$siteUrl|escape:javascript}')
// Customization to allow Collabspot to access authentication token in Gmail
window.opener.postMessage('{$authorization|@json|escape:javascript}', 'https://mail.google.com');
// Collabspot Portal (Classic)
window.opener.postMessage('{$authorization|@json|escape:javascript}', 'https://go.collabspot.com');
// Collabspot Connect and Connect Pro - Production
window.opener.postMessage('{$authorization|@json|escape:javascript}', 'https://cdn.clbspot.com');
window.opener.postMessage('{$authorization|@json|escape:javascript}', 'https://www.clbspot.com');
// Extras

window.close()
</script>
</body>
</HTML>
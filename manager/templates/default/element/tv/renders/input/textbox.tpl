<input id="tv{$tv->id}" name="tv{$tv->id}"
    type="text" class="textfield"
    value="{$tv->get('value')|escape}"
    {$style|default}
    tvtype="{$tv->type}"
/>

<script type="text/javascript">
// <![CDATA[
{literal}
Ext.onReady(function() {
    var fld = MODx.load({
    {/literal}
        xtype: 'textfield'
        ,applyTo: 'tv{$tv->id}'
        ,width: '99%'
        ,enableKeyEvents: true
        ,msgTarget: 'under'
        ,allowBlank: {if $params.allowBlank == 1 || $params.allowBlank == 'true'}true{else}false{/if}
        {if $params.minLength|default},minLength: {$params.minLength|default}{/if}
        {if $params.maxLength|default},maxLength: {$params.maxLength|default}{/if}
        {if $params.regex|default},regex: new RegExp(/{$params.regex|default}/){/if}
        {if $params.regexText|default},regexText: '{$params.regexText|default}'{/if}
    {literal}
        ,listeners: { 'keydown': { fn:MODx.fireResourceFormChange, scope:this}}
    });
    Ext.getCmp('modx-panel-resource').getForm().add(fld);
    MODx.makeDroppable(fld);
});
{/literal}
// ]]>
</script>

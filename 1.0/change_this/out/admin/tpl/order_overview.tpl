[{include file="headitem.tpl" title="[OXID Benutzerverwaltung]"}]

[{ if $readonly }]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
    [{ $shop->hiddensid }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="order_overview">
</form>

    <table cellspacing="0" cellpadding="0" border="0" width="98%">
    <tr>
        <td valign="top" class="edittext" width="50%">
        [{ if $edit }]
            <table width="200" border="0" cellspacing="0" cellpadding="0" nowrap>
            <tr><td class="edittext" valign="top">
            <b>[{ oxmultilang ident="GENERAL_BILLADDRESS" }]</b><br>
            <br>
            [{ if $edit->oxorder__oxbillcompany->value }][{ oxmultilang ident="GENERAL_COMPANY" }] [{$edit->oxorder__oxbillcompany->value }]<br>[{/if}]
            [{ if $edit->oxorder__oxbilladdinfo->value }][{$edit->oxorder__oxbilladdinfo->value }]<br>[{/if}]
            [{$edit->oxorder__oxbillsal->value|oxmultilangsal}] [{$edit->oxorder__oxbillfname->value }] [{$edit->oxorder__oxbilllname->value }]<br>
            [{$edit->oxorder__oxbillstreet->value }] [{$edit->oxorder__oxbillstreetnr->value }]<br>
            [{$edit->oxorder__oxbillstateid->value}]
            [{$edit->oxorder__oxbillzip->value }] [{$edit->oxorder__oxbillcity->value }]<br>
            [{$edit->oxorder__oxbillcountry->value }]<br>
            [{if $edit->oxorder__oxbillcompany->value && $edit->oxorder__oxbillustid->value }]
                <br>
                [{ oxmultilang ident="ORDER_OVERVIEW_VATID" }]
                [{ $edit->oxorder__oxbillustid->value }]<br>
            [{/if}]
            <br>
            [{ oxmultilang ident="GENERAL_EMAIL" }]: <a href="mailto:[{$edit->oxorder__oxbillemail->value }]?subject=[{ $actshop}] - [{ oxmultilang ident="GENERAL_ORDERNUM" }] [{$edit->oxorder__oxordernr->value }]" class="edittext"><em>[{$edit->oxorder__oxbillemail->value }]</em></a><br>
            <br>
            </td>
            [{ if $edit->oxorder__oxdelstreet->value }]
            <td class="edittext" valign="top">
                <b>[{ oxmultilang ident="GENERAL_DELIVERYADDRESS" }]:</b><br>
                <br>
                [{ if $edit->oxorder__oxdelcompany->value }]Firma [{$edit->oxorder__oxdelcompany->value }]<br>[{/if}]
                [{ if $edit->oxorder__oxdeladdinfo->value }][{$edit->oxorder__oxdeladdinfo->value }]<br>[{/if}]
                [{$edit->oxorder__oxdelsal->value|oxmultilangsal }] [{$edit->oxorder__oxdelfname->value }] [{$edit->oxorder__oxdellname->value }]<br>
                [{$edit->oxorder__oxdelstreet->value }] [{$edit->oxorder__oxdelstreetnr->value }]<br>
                [{$edit->oxorder__oxdelstateid->value }]
                [{$edit->oxorder__oxdelzip->value }] [{$edit->oxorder__oxdelcity->value }]<br>
                [{$edit->oxorder__oxdelcountry->value }]<br>
                <br>
            </td>
            [{/if}]
            </tr></table>
            <b>[{ oxmultilang ident="GENERAL_ITEM" }]:</b><br>
            <br>
            <table cellspacing="0" cellpadding="0" border="0">
            [{foreach from=$orderArticles item=listitem}]
            <tr>
                <td valign="top" class="edittext">[{ $listitem->oxorderarticles__oxamount->value }] * </td>
                <td valign="top" class="edittext">&nbsp;[{ $listitem->oxorderarticles__oxartnum->value }]</td>
                <td valign="top" class="edittext">&nbsp;[{ $listitem->oxorderarticles__oxtitle->getRawValue()|oxtruncate:20:""|strip_tags }][{if $listitem->oxwrapping__oxname->value}]&nbsp;([{$listitem->oxwrapping__oxname->value}])&nbsp;[{/if}]</td>
                <td valign="top" class="edittext">&nbsp;[{ $listitem->oxorderarticles__oxselvariant->value }]</td>
                <td valign="top" class="edittext">&nbsp;&nbsp;[{ $listitem->ftotbrutprice }] [{ $edit->oxorder__oxcurrency->value }]</td>
                [{ if $listitem->aPersParam }]
                <td valign="top" class="edittext">
                    [{foreach key=sVar from=$listitem->aPersParam item=aParam}]
                             &nbsp;&nbsp;,&nbsp;<em>[{$sVar}] : [{$aParam}]</em>
                    [{/foreach}]
                </td>
                [{/if}]
            </tr>
            [{/foreach}]
            </table>

            <br>
            [{if $edit->oxorder__oxstorno->value}]
            <span class="orderstorno">[{ oxmultilang ident="ORDER_OVERVIEW_STORNO" }]</span><br><br>
            [{/if}]
            <b>[{ oxmultilang ident="GENERAL_ATALL" }]: </b><br><br>
            <table border="0" cellspacing="0" cellpadding="0" id="order.info">
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_IBRUTTO" }]</td>
            <td class="edittext" align="right"><b>[{ $edit->ftotalbrutsum }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_DISCOUNT" }]&nbsp;&nbsp;</td>
            <td class="edittext" align="right"><b>- [{ $edit->fdiscount }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_INETTO" }]</td>
            <td class="edittext" align="right"><b>[{ $edit->ftotalnetsum }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            [{foreach key=iVat from=$aProductVats item=dVatPrice}]
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_IVAT" }] ([{ $iVat }]%)</td>
            <td class="edittext" align="right"><b>[{ $dVatPrice }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            [{/foreach}]
            [{if $edit->totalvouchers}]
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_VOUCHERS" }]</td>
            <td class="edittext" align="right"><b>- [{ $edit->totalvouchers }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            [{/if}]
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_DELIVERYCOST" }]&nbsp;&nbsp;</td>
            <td class="edittext" align="right"><b>[{ $edit->fdelcost }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_PAYCOST" }]&nbsp;&nbsp;</td>
            <td class="edittext" align="right"><b>[{ $edit->fpaycost }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            [{if $edit->oxorder__oxwrapcost->value }]
            <tr>
            <td class="edittext" height="15">[{ oxmultilang ident="GENERAL_CARD" }]&nbsp;[{if $giftCard}]([{$giftCard->oxwrapping__oxname->value}])[{/if}]&nbsp;</td>
            <td class="edittext" align="right"><b>[{ $edit->fwrapcost }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            [{/if}]
            <tr>
            <td class="edittext" height="25">[{ oxmultilang ident="GENERAL_SUMTOTAL" }]&nbsp;&nbsp;</td>
            <td class="edittext" align="right"><b>[{ $edit->ftotalorder }]</b></td>
            <td class="edittext">&nbsp;<b>[{if $edit->oxorder__oxcurrency->value}] [{$edit->oxorder__oxcurrency->value}] [{else}] [{ $currency->name}] [{/if}]</b></td>
            </tr>
            </table>

            <br>
            <table>
            <tr>
                <td class="edittext">[{ oxmultilang ident="ORDER_OVERVIEW_PAYMENTTYPE" }]: </td>
                <td class="edittext"><b>[{$paymentType->oxpayments__oxdesc->value}]</b></td>
            </tr>
            <tr>
                <td class="edittext">[{ oxmultilang ident="ORDER_OVERVIEW_DELTYPE" }]: </td>
                <td class="edittext"><b>[{$deliveryType->oxdeliveryset__oxtitle->value}]</b><br></td>
            </tr>
            </table>

            <br>
            [{ if $paymentType->aDynValues }]
                <table cellspacing="0" cellpadding="0" border="0">
                [{foreach from=$paymentType->aDynValues item=value}]
                <tr>
                    <td class="edittext">
                    [{ $value->name}] :&nbsp;
                    </td>
                    <td class="edittext">
                    [{ $value->value}]
                    </td>
                </tr>
                [{/foreach}]
                </table><br>
            [{/if}]
            [{if $edit->oxorder__oxremark->value}]
            <b>[{ oxmultilang ident="GENERAL_REMARK" }]</b><br>
            [{$edit->oxorder__oxremark->value}]<br><br>
            [{/if}]
        [{/if}]
        
        [{if !$edit}]
        [{include file="inc/snippet.mgorderstatistik.tpl"}]
        [{/if}]
        </td>
        <td>&nbsp;&nbsp;
        </td>
        <td valign="top" class="edittext">
            [{ if $edit }]
            <b>[{ oxmultilang ident="GENERAL_ORDERNUM" }]: </b>[{ $edit->oxorder__oxordernr->value }]<br>
            <br>
                <form name="myedit" id="myedit" action="[{ $shop->selflink }]" method="post">
                [{ $shop->hiddensid }]
                <input type="hidden" name="cl" value="order_overview">
                <input type="hidden" name="fnc" value="changefolder">
                <input type="hidden" name="oxid" value="[{ $oxid }]">
                <input type="hidden" name="folderclass" value="oxorder">
                [{ oxmultilang ident="ORDER_OVERVIEW_INFOLDER" }]:&nbsp;
                <select name="setfolder" class="folderselect" onChange="document.myedit.submit();" [{ $readonly }]>
                [{foreach from=$afolder key=field item=color}]
                <option value="[{ $field }]" [{ if $edit->oxorder__oxfolder->value == $field || ($field|oxmultilangassign == $edit->oxorder__oxfolder->value)}]SELECTED[{/if}] style="color: [{ $color }];">[{ oxmultilang ident=$field noerror=true }]</option>
                [{/foreach}]
                </select>
                [{ oxinputhelp ident="HELP_ORDER_OVERVIEW_INFOLDER" }]
                &nbsp;&nbsp;
                </form>
            [{/if}]
            [{ if $edit && $edit->oxorder__oxtransstatus->value }]
                [{ oxmultilang ident="ORDER_OVERVIEW_INTSTATUS" }]:&nbsp;<b>[{ $edit->oxorder__oxtransstatus->value }]</b><br>
            [{/if}]
            <br>

        <br>
        [{ if $edit }]
        <table cellspacing="0" cellpadding="0" border="0">
        <form name="sendorder" id="sendorder" action="[{ $shop->selflink }]" method="post">
        [{ $shop->hiddensid }]
        <input type="hidden" name="cl" value="order_overview">
        <input type="hidden" name="fnc" value="sendorder">
        <input type="hidden" name="oxid" value="[{ $oxid }]">
        <input type="hidden" name="editval[oxorder__oxid]" value="[{ $oxid }]">
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext" style="border : 1px #A9A9A9; border-style : solid solid solid solid; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                <input type="submit" class="edittext" name="save" value="&nbsp;&nbsp;[{ oxmultilang ident="GENERAL_NOWSEND" }]&nbsp;&nbsp;" [{ $readonly }]><br>
                [{ oxmultilang ident="GENERAL_SENDEMAIL" }] <input class="edittext" type="checkbox" name="sendmail" value='1' [{ $readonly }]>
            </td>
        </tr>
        </form>
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext" valign="bottom"><br>
            <b>[{ oxmultilang ident="GENERAL_SENDON" }]</b> <b>[{$edit->oxorder__oxsenddate|oxformdate:'datetime':true }]</b>
            </td>
        </tr>
        <form name="resetorder" id="resetorder" action="[{ $shop->selflink }]" method="post">
        [{ $shop->hiddensid }]
        <input type="hidden" name="cl" value="order_overview">
        <input type="hidden" name="fnc" value="resetorder">
        <input type="hidden" name="oxid" value="[{ $oxid }]">
        <input type="hidden" name="editval[oxorder__oxid]" value="[{ $oxid }]">
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext"><br>
                <input type="submit" class="edittext" name="save" value="[{ oxmultilang ident="GENERAL_SETBACKSENDTIME" }]" [{ $readonly }]>
            </td>
        </tr>
        </form>

        </table>
        [{/if}]
        </td>

        <td valign="top" class="edittext" align="right">

              <table cellspacing="0" cellpadding="0" style="padding-top: 5px; padding-left: 5px; padding-right: 5px; border : 1px #A9A9A9; border-style : solid solid solid solid;" width="220">
              <form name="myedit2" id="myedit2" action="[{ $shop->selflink }]" method="post" >
              [{ $shop->hiddensid }]
              <input type="hidden" name="cl" value="order_overview">
              <input type="hidden" name="fnc" value="exportlex">
              <input type="hidden" name="oxid" value="[{ $oxid }]">
              <tr>
                <td class="edittext">
                  <b>[{ oxmultilang ident="ORDER_OVERVIEW_XMLEXPORT" }]</b>
                </td>
                <td valign="top" class="edittext">
                  [{ oxmultilang ident="ORDER_OVERVIEW_FROMORDERNUM" }]<br>
                  <input type="text" class="editinput" size="15" maxlength="15" name="ordernr" value=""><br>
                  [{ oxmultilang ident="ORDER_OVERVIEW_TILLORDERNUM" }]<br>
                  <input type="text" class="editinput" size="15" maxlength="15" name="toordernr" value=""><br><br>
                  <input type="submit" class="edittext" name="save" value="[{ oxmultilang ident="ORDER_OVERVIEW_EXPORT" }]">
                </td>
              </tr>
              </table>
              </form>

              [{ if $edit && $oView->canExport() }]
              <br>
              <table cellspacing="0" cellpadding="0" style="padding-top: 5px; padding-left: 5px; padding-right: 5px; padding-bottom: 5px; border : 1px #A9A9A9; border-style : solid solid solid solid;" width="220">
              <form name="myedit2" id="myedit2" action="[{ $shop->selflink }]" method="post" target="expPDF">
              [{ $shop->hiddensid }]
              <input type="hidden" name="cl" value="order_overview">
              <input type="hidden" name="fnc" value="createPDF">
              <input type="hidden" name="oxid" value="[{ $oxid }]">
              <tr>
                <td rowspan="3">
                  <img src="[{$shop->imagedir}]/pdf_icon.gif" width="41" height="38" alt="" border="0" hspace="0" vspace="0" align="absmiddle">
                </td>
                <td valign="top" class="edittext" align="right">
                  [{ oxmultilang ident="ORDER_OVERVIEW_PDF_TYPE" }]:&nbsp;<select name="pdftype" class="editinput" style="width:80px;">
                  <option value="standart" SELECTED>[{ oxmultilang ident="ORDER_OVERVIEW_PDF_STANDART" }]</option>
                  <option value="dnote">[{ oxmultilang ident="ORDER_OVERVIEW_PDF_DNOTE" }]</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td align="right" class="edittext">
                  [{ oxmultilang ident="GENERAL_LANGUAGE" }]<select name="pdflanguage" class="saveinnewlanginput" style="width:80px;">
                  [{foreach from=$alangs key=lang item=slang}]
                  <option value="[{ $lang }]"[{ if $lang == "0" }]SELECTED[{/if}]>[{ $slang }]</option>
                  [{/foreach}]
                  </select>
                </td>
              </tr>
              <tr>
                <td align="right" class="edittext"><br />
                  <input type="submit" class="edittext" name="save" value="[{ oxmultilang ident="ORDER_OVERVIEW_PDF" }]">
                  <iframe name="expPDF" width="0" height="0" border="0" style="display:none;"></iframe>
                </td>
              </tr>
              </table>
              </form>
              [{ /if}]

              [{ if $isdtaus }]
              <br>
              <table cellspacing="0" cellpadding="0" style="padding-top: 5px; padding-left: 5px; padding-right: 5px; padding-bottom: 5px; border : 1px #A9A9A9; border-style : solid solid solid solid;" width="220">
              <form name="myedit2" id="myedit2" action="[{ $shop->selflink }]" method="post" >
              [{ $shop->hiddensid }]
              <input type="hidden" name="cl" value="order_overview">
              <input type="hidden" name="fnc" value="exportDTAUS">
              <input type="hidden" name="oxid" value="[{ $oxid }]">
              <tr>
                <td valign="top">
                  <img src="[{$shop->imagedir}]/dtaus_logo.jpg" width="71" height="40" alt="" border="0" hspace="0" vspace="0" align="absmiddle">
                </td>
                <td valign="top" class="edittext">
                  [{ oxmultilang ident="ORDER_OVERVIEW_FROMORDERNUM" }]<br>
                  <input type="text" class="editinput" size="15" maxlength="15" name="ordernr" value=""><br><br>
                  <input type="submit" class="edittext" name="save" value="[{ oxmultilang ident="ORDER_OVERVIEW_MAKE" }]">
                </td>
              </tr>
              </table>
              </form>
            [{/if}]
        </td>
    </tr>
    </table>

[{include file="bottomnaviitem.tpl"}]
</table>
[{include file="bottomitem.tpl"}]
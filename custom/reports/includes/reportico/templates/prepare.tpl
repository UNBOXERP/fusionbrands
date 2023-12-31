{if !$REPORTICO_AJAX_CALLED}
{if !$EMBEDDED_REPORT}
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>{$TITLE}</TITLE>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEET}">
{if $BOOTSTRAP_STYLES}
{if $BOOTSTRAP_STYLES == "2"}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap2/bootstrap.min.css">
{else}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap3/bootstrap.min.css">
{/if}
{/if}
{$OUTPUT_ENCODING}
</HEAD>
<BODY class="swPrpBody">
{else}
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEET}">
{if $BOOTSTRAP_STYLES}
{if !$REPORTICO_BOOTSTRAP_PRELOADED}
{if $BOOTSTRAP_STYLES == "2"}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap2/bootstrap.min.css">
{else}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap3/bootstrap.min.css">
{/if}
{/if}
{/if}
{/if}

{literal}
<!--[if IE]>
<style type="text/css">
    .swPrpTextField
    {
        width: 350px;
    }
</style>
<![endif]-->
{/literal}

{if $AJAX_ENABLED}
{if !$REPORTICO_AJAX_PRELOADED}
{if !$REPORTICO_JQUERY_PRELOADED}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/jquery.js"></script>
{/literal}
{/if}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/ui/jquery-ui.js"></script>
{/literal}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/reportico.js"></script>
{/literal}
{/if}
{if $BOOTSTRAP_STYLES}
{if !$REPORTICO_BOOTSTRAP_PRELOADED}
{if $BOOTSTRAP_STYLES == "2"}
<script type="text/javascript" src="{$JSPATH}/bootstrap2/bootstrap.min.js"></script>
{else}
<script type="text/javascript" src="{$JSPATH}/bootstrap3/bootstrap.min.js"></script>
{/if}
{/if}
{/if}
{/if}
{if !$REPORTICO_AJAX_PRELOADED}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/ui/i18n/jquery.ui.datepicker-{/literal}{$AJAX_DATEPICKER_LANGUAGE}{literal}.js"></script>
{/literal}
{/if}
{if !$BOOTSTRAP_STYLES}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/jquery.jdMenu.js"></script>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/jquery.jdMenu.css">
{/literal}
{/if}
{literal}
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/ui/jquery-ui.css">
<script type="text/javascript">var reportico_this_script = "{/literal}{$SCRIPT_SELF}{literal}";</script>
<script type="text/javascript">var reportico_ajax_script = "{/literal}{$REPORTICO_AJAX_RUNNER}{literal}";</script>
{/literal}
{if $REPORTICO_BOOTSTRAP_MODAL}
<script type="text/javascript">var reportico_bootstrap_modal = true;</script>
{else}
<script type="text/javascript">var reportico_bootstrap_modal = false;</script>
{/if}
{if $REPORTICO_DYNAMIC_GRIDS}
<script type="text/javascript">var reportico_dynamic_grids = true;</script>
{if $REPORTICO_DYNAMIC_GRIDS_SORTABLE}
<script type="text/javascript">var reportico_dynamic_grids_sortable = true;</script>
{else}
<script type="text/javascript">var reportico_dynamic_grids_sortable = false;</script>
{/if}
{if $REPORTICO_DYNAMIC_GRIDS_SEARCHABLE}
<script type="text/javascript">var reportico_dynamic_grids_searchable = true;</script>
{else}
<script type="text/javascript">var reportico_dynamic_grids_searchable = false;</script>
{/if}
{if $REPORTICO_DYNAMIC_GRIDS_PAGING}
<script type="text/javascript">var reportico_dynamic_grids_paging = true;</script>
{else}
<script type="text/javascript">var reportico_dynamic_grids_paging = false;</script>
{/if}
<script type="text/javascript">var reportico_dynamic_grids_page_size = {$REPORTICO_DYNAMIC_GRIDS_PAGE_SIZE};</script>
{else}
<script type="text/javascript">var reportico_dynamic_grids = false;</script>
{/if}
{/if}
{if !$REPORTICO_AJAX_PRELOADED}
{literal}
	<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/jquery.dataTables.js"></script>
	<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/moment.js"></script>
	<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/datetime-moment.js"></script>
{/literal}
<LINK id="PRP_StyleSheet" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/jquery.dataTables.css">
{/if}
{if $REPORTICO_CHARTING_ENGINE == "NVD3" }
{if !$REPORTICO_AJAX_PRELOADED}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/nvd3/d3.min.js"></script>
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/nvd3/nv.d3.js"></script>
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/nvd3/nv.d3.css">
{/literal}
{/if}
{/if}
<div id="reportico_container">

<script type="text/javascript">var reportico_datepicker_language = "{$AJAX_DATEPICKER_FORMAT}";</script>
<script type="text/javascript">var reportico_ajax_mode = "{$REPORTICO_AJAX_MODE}";</script>
<FORM class="swPrpForm" id="criteriaform" name="topmenu" method="POST" action="{$SCRIPT_SELF}">
<input type="hidden" name="reportico_session_name" value="{$SESSION_ID}" />
<input type="hidden" name="token" value="{$TOKEN}" />

{if $BOOTSTRAP_STYLES}
{if $BOOTSTRAP_STYLES == "2" || $BOOTSTRAP_STYLES == "3" }
<!-- BOOTSTRAP VERSION -->
{if $SHOW_HIDE_NAVIGATION_MENU == "show" || $SHOW_HIDE_DROPDOWN_MENU == "show"}
    <div class="navbar navbar-default" role="navigation">
{else}
    <div style="display:none" class="navbar navbar-default" role="navigation">
{/if}
    <!--div class="navbar navbar-default navbar-static-top" role="navigation"-->
{if $BOOTSTRAP_STYLES == "2" }
        <div class="navbar-inner">
{/if}
        <div class="container" style="width: 100%">
{if $BOOTSTRAP_STYLES == "2" }
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target="#reportico-bootstrap-collapse"-->
{else}
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#reportico-bootstrap-collapse">
{/if}
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
{if $SHOW_HIDE_DROPDOWN_MENU == "show" && $DROPDOWN_MENU_ITEMS}
{if $BOOTSTRAP_STYLES == "2" }
            <a href="#" class="brand" style="float: left">{$MENU_TITLE} :</a>
{else}
            <a href="#" class="navbar-brand">{$MENU_TITLE} :</a>
{/if}
{/if}
{if $BOOTSTRAP_STYLES == "2" }
            <div class= "nav-collapse collapse" id="reportico-bootstrap-collapse">
{else}
            <div class= "nav-collapse collapse in" id="reportico-bootstrap-collapse">
{/if}
                <ul class="nav navbar-nav">
{if $SHOW_HIDE_DROPDOWN_MENU == "show" && $DROPDOWN_MENU_ITEMS}
{section name=menu loop=$DROPDOWN_MENU_ITEMS}
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$DROPDOWN_MENU_ITEMS[menu].title}<span class="caret"></span></a>
              <ul class="dropdown-menu reportico-dropdown">
{section name=menuitem loop=$DROPDOWN_MENU_ITEMS[menu].items}
{if isset($DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportname)}
<li ><a class="reportico-dropdown-item" href="{$RUN_REPORT_URL}&project={$DROPDOWN_MENU_ITEMS[menu].project}&xmlin={$DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportfile}">{$DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportname}</a></li>
{/if}
{/section}

              </ul>
            </li>
{/section}
{/if}
            </ul>
{if $SHOW_HIDE_NAVIGATION_MENU == "show" }
            <ul class= "nav navbar-nav pull-right navbar-right">
{else}
            <ul style="display:none" class= "nav navbar-nav pull-right navbar-right">
{/if}
                <li> <input type="submit" style="width: 0px; color: transparent; background-color: transparent; border-color: transparent; cursor: default;" class="prepareAjaxExecute" id="prepareAjaxExecute" name="submitPrepare" value=""> </li>
{if $SHOW_TOPMENU}
{if ($SHOW_DESIGN_BUTTON)}
                <li><input class="span {$BOOTSTRAP_STYLE_ADMIN_BUTTON}swAdminButton2" type="submit" name="submit_design_mode" value="{$T_DESIGN_REPORT}"></li>
{/if}
{if $OUTPUT_SHOW_DEBUG}
{if $SHOW_DESIGN_BUTTON}
                <li>
                <div style="margin: 6px 8px 0px 8px">
                {$T_DEBUG_LEVEL}
                <SELECT class="span2 {$BOOTSTRAP_STYLE_DROPDOWN}" style="margin-bottom: 1px; display:inline; width: auto" name="debug_mode">';
                    <OPTION {$DEBUG_NONE} label="None" value="0">{$T_DEBUG_NONE}</OPTION>
                    <OPTION {$DEBUG_LOW} label="Low" value="1">{$T_DEBUG_LOW}</OPTION>
                    <OPTION {$DEBUG_MEDIUM} label="Medium" value="2">{$T_DEBUG_MEDIUM}</OPTION>
                    <OPTION {$DEBUG_HIGH} label="High" value="3">{$T_DEBUG_HIGH}</OPTION>
                </SELECT>
                </div>
                </li>
{/if}
{/if}
{if $SHOW_LOGIN}
{if strlen($PROJ_PASSWORD_ERROR) > 0}
                                <div style="color: #ff0000;">{$T_PASSWORD_ERROR}</div>
{/if}
            <li>
				<div style="inline-block; margin-top: 6px">{$T_ENTER_PROJECT_PASSWORD}<input type="password" name="project_password" value="">
				<input class="span2 swAdminButton" type="submit" name="login" value="{$T_LOGIN}">
                </div>
			</li>
{/if}
{/if}
</div>
</ul>
        </div>
{if $BOOTSTRAP_STYLES == "2" }
        </div>
{/if}
</div>

<!-- BOOTSTRAP VERSION -->
{/if} 

{else}
{if $SHOW_HIDE_DROPDOWN_MENU == "show" && $DROPDOWN_MENU_ITEMS}
<ul id="dropmenu" class="jd_menu" style="clear: none;float: left;width: 100%; ">
{section name=menu loop=$DROPDOWN_MENU_ITEMS}
<li style="margin-left: 20px; margin-top: 0px">
<a href="{$MAIN_MENU_URL}&project={$DROPDOWN_MENU_ITEMS[menu].project}">{$DROPDOWN_MENU_ITEMS[menu].title}</a>
<ul style="padding: 0px; margin: 0px">
{section name=menuitem loop=$DROPDOWN_MENU_ITEMS[menu].items}
{if isset($DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportname)}
<li ><a href="{$RUN_REPORT_URL}&project={$DROPDOWN_MENU_ITEMS[menu].project}&xmlin={$DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportfile}">{$DROPDOWN_MENU_ITEMS[menu].items[menuitem].reportname}</a></li>
{/if}
{/section}
</ul>
</li>
{/section}
</ul>
{/if}
{/if}

{if !$BOOTSTRAP_STYLES}
{if $SHOW_TOPMENU}
{if $SHOW_HIDE_NAVIGATION_MENU == "show"}
	<TABLE class="swPrpTopMenu">
{else}
	<TABLE style="dispaly:none" class="swPrpTopMenu">
{/if}
		<TR>
			<TD style="width: 50%; text-align:left">
    				<input type="submit" style="width: 0px; color: transparent; background-color: transparent; border-color: transparent; cursor: default;" class="prepareAjaxExecute swHTMLGoBox" id="prepareAjaxExecute" name="submitPrepare" value="{$T_GO}">
{if ($SHOW_ADMIN_BUTTON)}
{if strlen($ADMIN_MENU_URL)>0} 
                <a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" href="{$ADMIN_MENU_URL}">{$T_ADMIN_MENU}</a>
{/if}
{/if}
{if strlen($MAIN_MENU_URL)>0} 
{if $SHOW_PROJECT_MENU_BUTTON}
				<a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" href="{$MAIN_MENU_URL}">{$T_PROJECT_MENU}</a>
{/if}
{if $SHOW_DESIGN_BUTTON}
                                &nbsp;<input class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" type="submit" name="submit_design_mode" value="{$T_DESIGN_REPORT}">
{/if}
{if $OUTPUT_SHOW_DEBUG}
{if $SHOW_DESIGN_BUTTON}
			<TD style="width:15%; text-align: right; padding-right: 10px;" class="swPrpTopMenuCell">
				{$T_DEBUG_LEVEL}
				<SELECT class="{$BOOTSTRAP_STYLE_DROPDOWN}" style="display:inline; width: auto" name="debug_mode">';
					<OPTION {$DEBUG_NONE} label="None" value="0">{$T_DEBUG_NONE}</OPTION>
					<OPTION {$DEBUG_LOW} label="Low" value="1">{$T_DEBUG_LOW}</OPTION>
					<OPTION {$DEBUG_MEDIUM} label="Medium" value="2">{$T_DEBUG_MEDIUM}</OPTION>
					<OPTION {$DEBUG_HIGH} label="High" value="3">{$T_DEBUG_HIGH}</OPTION>
				</SELECT>
			</TD>
{/if}
{/if}

{/if}
			</TD>
{if $SHOW_LOGOUT}
			<TD style="width:15%; text-align: right; padding-right: 10px;" class="swPrpTopMenuCell">
				<input class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" type="submit" name="logout" value="{$T_LOGOFF}">
			</TD>
{/if}
{if $SHOW_LOGIN}
			<TD width="10%"></TD>
			<TD width="55%" align="left" class="swPrpTopMenuCell">
{if strlen($PROJ_PASSWORD_ERROR) > 0}
                                <div style="color: #ff0000;">{$T_PASSWORD_ERROR}</div>
{/if}
				{$T_ENTER_PROJECT_PASSWORD}<br><input type="password" name="project_password" value=""></div>
				<input class="swLinkMenu" type="submit" name="login" value="{$T_LOGIN}">
			</TD>
{/if}
		</TR>
	</TABLE>
{/if}
{/if}
{if $SHOW_MINIMAINTAIN} 
{if !$REPORTICO_BOOTSTRAP_MODAL}
<div style="width: 100%; padding-top: 3px; text-align: right">
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITSQL}" id="submit_mainquerqury_SHOW" value="{$T_EDITSQL}" name="mainquerqurysqlt_QuerySql">
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITCOLUMNS}" id="submit_mainquerquryqcol_SHOW" value="{$T_EDITCOLUMNS}" name="mainquerquryqcol_ANY">
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITASSIGNMENT}" id="submit_mainquerassg" value="{$T_EDITASSIGNMENT}" name="mainquerassg_ANY">
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITGROUPS}" id="submit_mainqueroutpgrps" value="{$T_EDITGROUPS}" name="mainqueroutpgrps_ANY">
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITGRAPHS}" id="submit_mainqueroutpgrph" value="{$T_EDITGRAPHS}" name="mainqueroutpgrph_ANY">
</div>
{else}


<div class="navbar navbar-default" role="navigation">
    <!--div class="navbar navbar-default navbar-static-top" role="navigation"-->
        <div class="container" style="width: 100%">
            <div class="nav-collapse collapse in" id="reportico-bootstrap-collapse">
                <ul class="nav navbar-nav pull-right navbar-right">
    				    <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-top: 10px; margin-right: 30px" title="{$T_EDIT} {$T_EDITSQL}" id="submit_mainquerqury_SHOW" value="{$T_EDITSQL}" name="mainquerqurysqlt_QuerySql"></li>
    				    <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-top: 10px; margin-right: 30px" title="{$T_EDIT} {$T_EDITCOLUMNS}" id="submit_mainquerquryqcol_SHOW" value="{$T_EDITCOLUMNS}" name="mainquerquryqcol_ANY"></li>
    				    <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-top: 10px; margin-right: 30px" title="{$T_EDIT} {$T_EDITASSIGNMENT}" id="submit_mainquerassg" value="{$T_EDITASSIGNMENT}" name="mainquerassg_ANY"></li>
    				    <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-top: 10px; margin-right: 30px" title="{$T_EDIT} {$T_EDITGROUPS}" id="submit_mainqueroutpgrps" value="{$T_EDITGROUPS}" name="mainqueroutpgrps_ANY"></li>
    				    <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-top: 10px; margin-right: 30px" title="{$T_EDIT} {$T_EDITGRAPHS}" id="submit_mainqueroutpgrph" value="{$T_EDITGRAPHS}" name="mainqueroutpgrph_ANY"></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">+<span class="caret"></span></a>
                            <ul class="dropdown-menu reportico-dropdown">
    				            <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITPAGEHEADERS}" id="submit_mainqueroutppghd0000form" value="{$T_EDITPAGEHEADERS}" name="mainqueroutppghd0000form_ANY"></li>
    				            <li><input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITPAGEFOOTERS}" id="submit_mainqueroutppgft0000form" value="{$T_EDITPAGEFOOTERS}" name="mainqueroutppgft0000form_ANY"></li>
                            </ul>
                        </li>
                </ul>
            </div>
        </div>
</div>

{/if}
{/if}
<h1 class="swTitle" >{$TITLE}
{if $SHOW_MINIMAINTAIN} 
{if !$REPORTICO_BOOTSTRAP_MODAL}
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITTITLE}" id="submit_mainquerform_SHOW" value="" name="mainquerform_ReportTitle">
{else}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITTITLE}" id="submit_mainquerform_SHOW" value="" name="mainquerform_ReportTitle">
{/if}
{/if}
</h1>
{if $SHOW_CRITERIA}
    <div style="display: none">
										&nbsp;
										{$T_OUTPUT}
											<INPUT type="radio" id="rpt_format_html" name="target_format" value="HTML" {$OUTPUT_TYPES[0]}>HTML
											<INPUT type="radio" id="rpt_format_pdf" name="target_format" value="PDF" {$OUTPUT_TYPES[1]}>PDF
											<INPUT type="radio" id="rpt_format_csv" name="target_format" value="CSV" {$OUTPUT_TYPES[2]}>CSV
											<INPUT type="radio" id="rpt_format_xls" name="target_format" value="XLS" {$OUTPUT_TYPES[3]}>XLS
   
    </div>
	<TABLE class="swPrpCritBox" id="critbody">
{if $SHOW_OUTPUT}
        <TR>
            <td>  
{if $SHOW_HIDE_PREPARE_PAGE_STYLE == "show"}
			<div style="width: 20%; padding-top: 15px;float: left;vertical-align: bottom;text-align: center">
{else}
			<div style="display:none; width: 20%; padding-top: 15px;float: left;vertical-align: bottom;text-align: center">
{/if}
                <b>{$T_REPORT_STYLE}</b>
                <INPUT type="radio" id="rpt_style_detail" name="target_style" value="TABLE" {$OUTPUT_STYLES[0]}>{$T_TABLE}
                <INPUT type="radio" id="rpt_style_form" name="target_style" value="FORM" {$OUTPUT_STYLES[1]}>{$T_FORM}
			</div>
			<div class="swPrpToolbarPane" style="width: 30%; float: left; vertical-align: bottom;text-align: right">

{if $SHOW_HIDE_PREPARE_XLS_BUTTON == "show"}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swXLSBox" title="{$T_PRINT_XLS}" id="prepareAjaxExecute" name="submitPrepare" value="">
{else}
    				<input style="display:none" type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swXLSBox" title="{$T_PRINT_XLS}" id="prepareAjaxExecute" name="submitPrepare" value="">
{/if}

{if $SHOW_HIDE_PREPARE_CSV_BUTTON == "show"}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swCSVBox" title="{$T_PRINT_CSV}" id="prepareAjaxExecute" name="submitPrepare" value="">
{else}
    				<input style="display:none" type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swCSVBox" title="{$T_PRINT_CSV}" id="prepareAjaxExecute" name="submitPrepare" value="">
{/if}
{if $SHOW_HIDE_PREPARE_PDF_BUTTON == "show"}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swPDFBox" title="{$T_PRINT_PDF}" id="prepareAjaxExecute" name="submitPrepare" value="">
{else}
    				<input style="display:none" type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swPDFBox" title="{$T_PRINT_PDF}" id="prepareAjaxExecute" name="submitPrepare" value="">
{/if}
{if $SHOW_HIDE_PREPARE_HTML_BUTTON == "show"}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swHTMLBox" title="{$T_PRINT_HTML}" id="prepareAjaxExecute" name="submitPrepare" value="">
{else}
    				<input style="display:none" type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swHTMLBox" title="{$T_PRINT_HTML}" id="prepareAjaxExecute" name="submitPrepare" value="">
{/if}
{if $SHOW_HIDE_PREPARE_PRINT_HTML_BUTTON == "show"}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swPrintBox" style="margin-right: 30px" title="{$T_PRINTABLE}" id="prepareAjaxExecute" name="submitPrepare" value="">
{else}
    				<input style="display:none" type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareAjaxExecute swPrintBox" style="margin-right: 30px" title="{$T_PRINTABLE}" id="prepareAjaxExecute" name="submitPrepare" value="">
{/if}
			</div>
{if $SHOW_HIDE_PREPARE_SECTION_BOXES == "show"}
			<div style="width: 50%; padding-top: 15px;float: left;vertical-align: bottom;text-align: center">
{else}
			<div style="display:none; width: 50%; padding-top: 15px;float: left;vertical-align: bottom;text-align: center">
{/if}
                                  <b>{$T_SHOW}</b>
				<INPUT type="checkbox" style="display:none" name="user_criteria_entered" value="1" checked="1">
{if $BOOTSTRAP_STYLES}
{if $BOOTSTRAP_STYLES == "2" }
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_criteria" value="1" {$OUTPUT_SHOWCRITERIA}>{$T_SHOW_CRITERIA}</label>
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_group_headers" value="1" {$OUTPUT_SHOWGROUPHEADERS}>{$T_SHOW_GRPHEADERS}</label>
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_detail" value="1" {$OUTPUT_SHOWDETAIL}>{$T_SHOW_DETAIL}</label>
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_group_trailers" value="1" {$OUTPUT_SHOWGROUPTRAILERS}>{$T_SHOW_GRPTRAILERS}</label>
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_column_headers" value="1" {$OUTPUT_SHOWCOLHEADERS}>{$T_SHOW_COLHEADERS}</label>
{if $OUTPUT_SHOW_SHOWGRAPH}
				<label style="display:inline-block" class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_graph" value="1" {$OUTPUT_SHOWGRAPH}>{$T_SHOW_GRAPH}</label>
{/if}
{else}
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_criteria" value="1" {$OUTPUT_SHOWCRITERIA}>{$T_SHOW_CRITERIA}</label>
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_group_headers" value="1" {$OUTPUT_SHOWGROUPHEADERS}>{$T_SHOW_GRPHEADERS}</label>
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_detail" value="1" {$OUTPUT_SHOWDETAIL}>{$T_SHOW_DETAIL}</label>
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_group_trailers" value="1" {$OUTPUT_SHOWGROUPTRAILERS}>{$T_SHOW_GRPTRAILERS}</label>
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_column_headers" value="1" {$OUTPUT_SHOWCOLHEADERS}>{$T_SHOW_COLHEADERS}</label>
{if $OUTPUT_SHOW_SHOWGRAPH}
				<label class="{$BOOTSTRAP_STYLE_CHECKBOX_BUTTON}"><INPUT type="checkbox" name="target_show_graph" value="1" {$OUTPUT_SHOWGRAPH}>{$T_SHOW_GRAPH}</label>
{/if}
{/if}
{else}
				<INPUT type="checkbox" name="target_show_criteria" value="1" {$OUTPUT_SHOWCRITERIA}>{$T_SHOW_CRITERIA}
				<INPUT type="checkbox" name="target_show_group_headers" value="1" {$OUTPUT_SHOWGROUPHEADERS}>{$T_SHOW_GRPHEADERS}
				<INPUT type="checkbox" name="target_show_detail" value="1" {$OUTPUT_SHOWDETAIL}>{$T_SHOW_DETAIL}
				<INPUT type="checkbox" name="target_show_group_trailers" value="1" {$OUTPUT_SHOWGROUPTRAILERS}>{$T_SHOW_GRPTRAILERS}
				<INPUT type="checkbox" name="target_show_column_headers" value="1" {$OUTPUT_SHOWCOLHEADERS}>{$T_SHOW_COLHEADERS}
{if $OUTPUT_SHOW_SHOWGRAPH}
				<INPUT type="checkbox" name="target_show_graph" value="1" {$OUTPUT_SHOWGRAPH}>{$T_SHOW_GRAPH}<BR>
{/if}
{/if}
			</div>
            </td>
		</TR>
{else}
{/if}
	</TABLE>
<div id="criteriabody">
	<TABLE class="swPrpCritBox" cellpadding="0">
<!---->
		<TR id="swPrpCriteriaBody">
			<TD class="swPrpCritEntry">
			<div id="swPrpSubmitPane">
    				<input type="submit" class="{$BOOTSTRAP_STYLE_GO_BUTTON}prepareAjaxExecute swHTMLGoBox" id="prepareAjaxExecute" name="submitPrepare" value="{$T_GO}">
    				<input type="submit" class="{$BOOTSTRAP_STYLE_RESET_BUTTON}reporticoSubmit" name="clearform" value="{$T_RESET}">
{if $SHOW_MINIMAINTAIN} 
<div style="float: left">
{if !$REPORTICO_BOOTSTRAP_MODAL}
    				<input type="submit" class="prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITCRITERIA}" id="submit_mainquercrit" value="{$T_EDITCRITERIA}" name="mainquercrit_ANY">
{else}
    				<input type="submit" class="{$BOOTSTRAP_STYLE_TOOLBAR_BUTTON}prepareMiniMaintain swMiniMaintain" style="margin-right: 30px" title="{$T_EDIT} {$T_EDITCRITERIA}" id="submit_mainquercrit" value="{$T_EDITCRITERIA}" name="mainquercrit_ANY">
{/if}
</div>
{/if}
                    &nbsp;
			</div>

                <TABLE class="swPrpCritEntryBox">
{php}
$loopct = 0;
{/php}
{if isset($CRITERIA_ITEMS)}
{section name=critno loop=$CRITERIA_ITEMS}
                    <tr class="swPrpCritLine" id="criteria_{$CRITERIA_ITEMS[critno].name}">
                        <td class='swPrpCritTitle'>
{php}
$itemval = str_pad($loopct, 4, '0', STR_PAD_LEFT);
$this->assign('criterianumber', $itemval);
$loopct++;
{/php}
                            {$CRITERIA_ITEMS[critno].title}
                        </td>
                        <td class="swPrpCritSel">
                            {$CRITERIA_ITEMS[critno].entry}
                        </td>
                        <td class="swPrpCritExpandSel">
{if $CRITERIA_ITEMS[critno].expand}
{if $AJAX_ENABLED} 
                            <input class="swPrpCritExpandButton" id="reporticoPerformExpand" type="button" name="EXPAND_{$CRITERIA_ITEMS[critno].name}" value="{$T_EXPAND}">
{else}
                            <input class="swPrpCritExpandButton" type="submit" name="EXPAND_{$CRITERIA_ITEMS[critno].name}" value="{$T_EXPAND}">
{/if}
{/if}
                        </td>
                    </TR>
{/section}
{/if}
                </TABLE>
{if isset($CRITERIA_ITEMS)}
{if count($CRITERIA_ITEMS) > 1}
<div id="{$BOOTSTRAP_STYLE_SMALL_BUTTON}swPrpSubmitPane">
	<input type="submit" class="{$BOOTSTRAP_STYLE_GO_BUTTON}prepareAjaxExecute swHTMLGoBox" id="prepareAjaxExecute" name="submitPrepare" value="{$T_GO}">
    <!--input type="submit" class="reporticoSubmit" name="clearform" value="{$T_RESET}"-->
</div>
{/if}
{/if}
			</td>
			<TD class="swPrpExpand">
				<TABLE class="swPrpExpandBox">
					<TR class="swPrpExpandRow">
						<TD id="swPrpExpandCell" rowspan="0" valign="top">
{if strlen($ERRORMSG)>0}
            <TABLE class="swError">
                <TR>
                    <TD>{$ERRORMSG}</TD>
                </TR>
            </TABLE>
{/if}
{if strlen($STATUSMSG)>0} 
			<TABLE class="swStatus">
				<TR>
					<TD>{$STATUSMSG}</TD>
				</TR>
			</TABLE>
{/if}
{if strlen($STATUSMSG)==0 && strlen($ERRORMSG)==0}
<div style="float:right; ">
{if strlen($MAIN_MENU_URL)>0}
<!--a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" style="float:left;" href="{$MAIN_MENU_URL}">&lt;&lt; Menu</a-->
{/if}
</div>
<p>
{if $SHOW_EXPANDED}
							{$T_SEARCH} {$EXPANDED_TITLE} :<br><input  type="text" class="{$BOOTSTRAP_STYLE_TEXTFIELD}" name="expand_value" style="width: 50%;display: inline" size="30" value="{$EXPANDED_SEARCH_VALUE}"</input>
									<input id="reporticoPerformExpand" class="{$BOOTSTRAP_STYLE_SMALL_BUTTON}swPrpSubmit" style="margin-bottom: 2px" type="submit" name="EXPANDSEARCH_{$EXPANDED_ITEM}" value="Search"><br>

{$CONTENT}
							<br>
							<input class="{$BOOTSTRAP_STYLE_SMALL_BUTTON}swPrpSubmit" type="submit" name="EXPANDCLEAR_{$EXPANDED_ITEM}" value="Clear">
							<input class="{$BOOTSTRAP_STYLE_SMALL_BUTTON}swPrpSubmit" type="submit" name="EXPANDSELECTALL_{$EXPANDED_ITEM}" value="Select All">
							<input class="{$BOOTSTRAP_STYLE_SMALL_BUTTON}swPrpSubmit" type="submit" name="EXPANDOK_{$EXPANDED_ITEM}" value="OK">
{/if}
{if !$SHOW_EXPANDED}
{if !$REPORT_DESCRIPTION}
{$T_DEFAULT_REPORT_DESCRIPTION}
{else}
						&nbsp;<br>
						{$REPORT_DESCRIPTION}
{/if}
{/if}
{/if}
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
			</TABLE>

{/if}
</div>
			<!---->

</FORM>
{if $SHOW_MINIMAINTAIN}
{if $REPORTICO_BOOTSTRAP_MODAL}
{if $BOOTSTRAP_STYLES == "3" }
<div class="modal fade" id="reporticoModal" tabindex="-1" role="dialog" aria-labelledby="reporticoModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
{else}
<div class="modal fade" style="width: 900px; margin-left: -450px" id="reporticoModal" tabindex="-1" role="dialog" aria-labelledby="reporticoModal" aria-hidden="true">
    <div class="modal-dialog">
{/if}
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close reportico-bootstrap-modal-close" aria-hidden="true">&times;</button>
            <h4 class="modal-title reportico-modal-title" id="reporticoModalLabel">Set Parameter</h4>
            </div>
            <div class="modal-body" style="padding: 0px" id="swMiniMaintain">
                <h3>Modal Body</h3>
            </div>
            <div class="modal-footer">
                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                <button type="button" class="btn btn-primary swMiniMaintainSubmit" >Close</button>
        </div>
    </div>
  </div>
</div>
{else}
<div id="reporticoModal" tabindex="-1" class="reportico-modal">
    <div class="reportico-modal-dialog">
        <div class="reportico-modal-content">
            <div class="reportico-modal-header">
            <button type="button" class="reportico-modal-close">&times;</button>
            <h4 class="reportico-modal-title" id="reporticoModalLabel">Set Parameter</h4>
            </div>
            <div class="reportico-modal-body" style="padding: 0px" id="swMiniMaintain">
                <h3>Modal Body</h3>
            </div>
            <div class="reportico-modal-footer">
                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                <button type="button" class="swMiniMaintainSubmit" >Close</button>
        </div>
    </div>
  </div>
</div>
{/if}
{/if}
<!--div class="smallbanner">Powered by <a href="http://www.reportico.org/" target="_blank">reportico {$REPORTICO_VERSION}</a></div-->
</div>
{if !$EMBEDDED_REPORT} 
</BODY>
</HTML>
{/if}

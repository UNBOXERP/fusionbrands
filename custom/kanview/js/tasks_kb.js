document.write('<div id="messages"></div>'),document.write('<div id="waitingPopUp"></div>'),document.write('<div id="kanbanTasks" class="tabs"></div>');var o=null,l=null,s=null,r=null,c=null,d=null,e=compareVersions(DOL_VERSION,"5.0.7"),t=compareVersions(DOL_VERSION,"6.0.0"),n=compareVersions(DOL_VERSION,"6.0.6"),a=compareVersions(DOL_VERSION,"7.0.0"),u=compareVersions(DOL_VERSION,"8.0.0"),p=compareVersions(DOL_VERSION,"9.0.0");function g(e,n,a){var i={action:e,data:{rowid:n,progress:a}};$("#waitingPopUp").ejWaitingPopup().data("ejWaitingPopup").show();var t=$("#listactionsfilter").serialize();return $.ajax({url:document.URL.split("?")[0],type:"POST",data:t+"&token="+token+"&postData="+JSON.stringify(i),dataType:"html",async:!1,success:function(i,e){try{var t=JSON.parse(i);return token=t.token,$("#input_token").val(token),"OK"===t.status?(l.dataSource.json.forEach(function(e){e.rowid==n&&(e.progress=a+"%",e.task_status=t.data.task_status,e.progress_level=t.data.progress_level)}),o.refresh(),$(".badge").each(function(e){void 0!==t.data.kanbanHeaderCounts[this.id]&&(this.textContent=t.data.kanbanHeaderCounts[this.id])}),window.setTimeout(function(){$("#"+n).css("border-color","magenta")},100),null!=s&&s.close(),!0):(null!=(s=$("#dlgTaskEdit").data("ejDialog"))&&s.close(),$.jnotify(t.message,"warning",5e3),$("#kanbanTasks").find(".e-targetclone").remove(),$("body").css("cursor","default"),!1)}catch(e){return null!=d&&(d.cancel=!0),errText=$("<div>"+i+"</div>").text().trim(),$.jnotify(e,"error",5e3),console.log(errText),!1}},error:function(e,i,t){return null!=d&&(d.cancel=!0),$.jnotify(t,"error",5e3),!1},complete:function(e,i){$("#waitingPopUp").ejWaitingPopup().data("ejWaitingPopup").hide()}}),!0}$(function(){l=ej.DataManager(kanbanData),o=$("#kanbanTasks").ejKanban({enableTotalCount:enableNativeTotalCount,dataSource:l,locale:sfLocale,enableRTL:!1,columns:columns,keyField:"progress_level",fields:{content:"ref_libelle",primaryKey:"rowid",priority:"priority",tag:tasks_tag,title:"",color:"task_status",imageUrl:"undefined"!=typeof fieldImageUrl&&""!=fieldImageUrl?fieldImageUrl:null,collapsibleCards:{field:"",key:""}},cardSettings:{template:"",colorMapping:colorMapping,externalDropTarget:""},contextMenuSettings:{enable:!0,menuItems:[],customMenuItems:[{text:msgPrintKanbanView,target:ej.Kanban.Target.Header,template:""}]},cardDrag:function(e){if(void 0!==$(".e-targetclone").css("top")){var i=$(window).scrollTop();isElementVisibleOnView($(".e-targetclone"))?$(".e-targetclone").css({position:"relative",top:0}):$(".e-targetclone").css({position:"absolute",top:i})}},cardDragStop:function(e){tooltipsActive=!1,r=(c=d=e).data[0][0];var i=$(e.draggedElement).prop("id"),t=$(e.draggedElement).parent().data("ej-mappingkey"),n=$(e.dropTarget).parent().data("ej-mappingkey");return void 0===t||void 0===n?(e.cancel=!0,$("#kanbanTasks").find(".e-targetclone").remove(),void $("body").css("cursor","default")):n===t?(e.cancel=!0,$("#kanbanTasks").find(".e-targetclone").remove(),void $("body").css("cursor","default")):"TASK_DONE"!=n&&"TASK_NOT_STARTED"!=n?(e.cancel=!0,a.setValue(parseInt(r.progress)),void(null!=s&&s.open())):"TASK_DONE"==n?(e.cancel=!0,void g("kanbanTasks_cardDragStop",i,100)):"TASK_NOT_STARTED"==n?(e.cancel=!0,void g("kanbanTasks_cardDragStop",i,0)):void(tooltipsActive=!1)},cardDrop:function(e){},cardClick:function(e){if(r=e.data[0],c=e,!tooltipsActive){var t=l.dataSource.json.length,n=-1,a="";for(i=0;i<t;i++)n=l.dataSource.json[i].rowid,a=l.dataSource.json[i].tooltip_content,$("#task-"+n).ejTooltip({content:a}),n==r.rowid&&($(".tooltip-progress-"+n).each(function(e){$(this).text(l.dataSource.json[i].progress)}),$(".tooltip-ref-"+n).each(function(e){$(this).text(l.dataSource.json[i].ref)}));tooltipsActive=!0}},contextClick:function(e){"ejMenuClick"!=e.type&&"contextClick"!=e.type||e.text!=msgPrintKanbanView||this.print()},create:function(e){},queryCellInfo:function(e){$(e.card).find("td.e-imagecell").html("");var i=e.data.rowid;if(void 0!==tasksResources[i]&&null!=tasksResources[i]){var n="",a=$(e.card).find("td.e-imagecell");tasksResources[i].forEach(function(e){n="","TASKEXECUTIVE"==e.taskResourceType&&(n="taskexecutive");var i="",t='<div class="e-image e-no-user"></div>';-1==p&&(i="/0"),0<e.taskResourceIdWithSource.indexOf("-I")?("unknown"!=$("#kanbanTasks").ejKanban("model.fields.imageUrl")&&(t='<img class="e-image '+n+'" src="'+DOL_URL_ROOT+"/viewimage.php?modulepart=user&file="+e.taskResourceId+i+"/"+encodeURI(e.taskResourcePhoto)+'">'),a.append('<div class="e-card_link">\n                                  <a href="'+DOL_URL_ROOT+"/user/card.php?id="+e.taskResourceId+'" title="'+e.taskResourceName+'" target="_blank">\n                                    <div class="e-card_image">\n                                       '+t+"\n                                    </div>\n                                  </a>\n                                </div>")):("unknown"!=$("#kanbanTasks").ejKanban("model.fields.imageUrl")&&(t='<img class="e-image '+n+'" src="'+DOL_URL_ROOT+"/viewimage.php?modulepart=societe&file=contact/"+e.taskResourceId+"/photos/"+encodeURI(e.taskResourcePhoto)+'">'),a.append('<div class="e-card_link">\n                                  <a href="'+DOL_URL_ROOT+"/contact/card.php?id="+e.taskResourceId+'" title="'+e.taskResourceName+'" target="_blank">\n                                    <div class="e-card_image">\n                                       '+t+"\n                                    </div>\n                                  </a>\n                                </div>"))})}void 0!==e.data.progress&&null!=e.data.progress||(e.data.progress="0%"),$(e.card).find("td.e-imagecell").prepend('<div class="progress-container" title="'+parseInt(e.data.progress)+'%"><div class="progress-value" style="width: '+parseInt(e.data.progress)+'%"></div></div>')}}).data("ejKanban"),s=$("#dlgTaskEdit").ejDialog({title:msgDlgTaskEditTitle,enableModal:!0,enableResize:!1,locale:locale,enableRTL:!1,showOnInit:!1,width:400}).data("ejDialog");var a=$("#dlgTaskEdit_sliderProgressChoice").ejSlider({sliderType:ej.SliderType.MinRange,showScale:!0,showSmallTicks:!1,height:20,width:350,value:0,minValue:0,maxValue:100,incrementStep:1,change:function(e){$("#dlgTaskEdit_sliderValue").text(e.model.value)},slide:function(e){$("#dlgTaskEdit_sliderValue").text(e.model.value)}}).data("ejSlider");$("#dlgTaskEdit_btnOK").ejButton({type:"button",size:"mini",showRoundedCorner:!0,click:function(e){if(null!=r){var i=parseInt(r.progress),t=parseInt(a.getValue());t!==i&&g("dlgTaskEdit_btnOK_click",r.rowid,t)}}}),$("#dlgTaskEdit_btnCancel").ejButton({type:ej.ButtonType.Button,size:"mini",showRoundedCorner:!0,click:function(e){null!=d&&(d.cancel=!0),s.close(),$("#kanbanTasks").find(".e-targetclone").remove(),$("body").css("cursor","default")}}),$("#fk_projet_input_filtre").on("change",function(e){""!=$(this).val()&&$("#fk_soc_input_filtre").val(""),e.stopPropagation()}),$("#fk_soc_input_filtre").on("change",function(e){""!=$(this).val()&&$("#fk_projet_input_filtre").val(""),e.stopPropagation()})}),window.onerror=function(e,i,t,n,a){return $("#waitingPopUp").ejWaitingPopup().data("ejWaitingPopup").hide(),console.log(e),!1};
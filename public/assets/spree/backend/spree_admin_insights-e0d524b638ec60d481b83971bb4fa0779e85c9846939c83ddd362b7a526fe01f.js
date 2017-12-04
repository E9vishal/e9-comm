function Paginator(t,e){this.$insightsTableList=t.insightsDiv,this.paginatorDiv=t.paginatorDiv,this.tableSorter=t.tableSorterObject,this.removePaginationButton=t.removePaginationButton,this.reportLoader=e,this.applyPaginationButton=t.applyPaginationButton}function Searcher(t,e){this.$insightsTableList=t.insightsDiv,this.$filters=t.filterDiv,this.$quickSearchForm=this.$filters.find("#quick-search"),this.tableSorter=t.tableSorterObject,this.reportLoader=e,this.$filterForm=null,this.$searchLabelsContainer=this.$filters.find(".table-active-filters")}function TableSorter(t){this.$insightsTableList=t.$insightsTable,this.reportLoader=t.reportLoader,this.paginatorDiv=t.paginatorDiv}function ReportLoader(t){this.$selectList=t.reportsSelectBox,this.$insightsTableList=t.insightsDiv,this.tableHelpers=t.tableHelpers,this.pageSelector=t.tableHelpers.find("#page-selector"),this.perPageSelector=this.tableHelpers.find("#per_page"),this.pageHelpers=this.tableHelpers.find("#page-helpers"),this.resetButton=t.resetButton,this.refreshButton=t.refreshButton,this.filterDiv=t.filterDiv,this.paginatorDiv=t.paginatorDiv,this.removePaginationButton=t.removePaginationButton,this.applyPaginationButton=t.applyPaginationButton,this.chartContainer=t.chartContainer,this.downloadLinks=t.downloadLinks,this.requestUrl="",this.isStatePushable=!0,this.tableSorterObject=null,this.searcherObject=null,this.paginatorObject=null}Paginator.prototype.bindEvents=function(){var t=this;this.paginatorDiv.on("click",".pagination-link",function(e){e.preventDefault(),t.loadPaginationData(e)}),this.reportLoader.perPageSelector.on("change",function(e){t.togglePaginatorButtons(t.removePaginationButton,t.applyPaginationButton),t.loadReportData(e)}),this.removePaginationButton.on("click",function(e){t.togglePaginatorButtons(t.applyPaginationButton,t.removePaginationButton),e.preventDefault(),t.removePagination(this)}),this.applyPaginationButton.on("click",function(e){t.togglePaginatorButtons(t.removePaginationButton,t.applyPaginationButton),e.preventDefault(),t.applyPagination(e)})},Paginator.prototype.togglePaginatorButtons=function(t,e){t.closest("span").removeClass("hide"),e.closest("span").addClass("hide")},Paginator.prototype.refreshPaginator=function(t){this.reportLoader.perPageSelector.val(t.per_page),this.populatePaginationData(t)},Paginator.prototype.loadPaginationData=function(t){var e=$(t.target),r=this.tableSorter.fetchSortedAttribute(),a=r[0],i=r[1],o=e.attr("href")+"&sort%5Battribute%5D="+a+"&sort%5Btype%5D="+i,n=this;n.reportLoader.requestUrl=o,e.parents("li").hasClass("active")||$.ajax({type:"GET",url:o,dataType:"json",success:function(t){n.populateInsightsData(t),n.paginatorDiv.find(".active").removeClass("active"),e.parents("li").addClass("active")}})},Paginator.prototype.populateInsightsData=function(t){this.reportLoader.populateInsightsData(t)},Paginator.prototype.populatePaginationData=function(t){var e=$(tmpl("paginator-tmpl",t));this.paginatorDiv.empty().append(e),this.pageLinks=this.paginatorDiv.find(".pagination-link")},Paginator.prototype.loadReportData=function(t){var e=$(t.target),r=this.tableSorter.fetchSortedAttribute(),a=r[0],i=r[1],o=e.data("url")+"&sort%5Battribute%5D="+a+"&sort%5Btype%5D="+i+"&"+$("#filter-search").serialize()+"&per_page="+e.val();e.data("url",o),this.reportLoader.loadChart(e)},Paginator.prototype.removePagination=function(t){var e=this.reportLoader.perPageSelector,r=this,a=this.tableSorter.fetchSortedAttribute(),i=a[0],o=a[1],n=e.data("url")+"&sort%5Battribute%5D="+i+"&sort%5Btype%5D="+o+"&"+$("#filter-search").serialize()+"&paginate=false";$(t).attr("href",n),r.reportLoader.requestUrl=n,e.val(""),$.ajax({type:"GET",url:n,dataType:"json",success:function(t){r.populateInsightsData(t),r.paginatorDiv.empty()}})},Paginator.prototype.applyPagination=function(t){var e=this.reportLoader.perPageSelector,r=this,a=this.tableSorter.fetchSortedAttribute(),i=a[0],o=a[1],n=e.data("url")+"&sort%5Battribute%5D="+i+"&sort%5Btype%5D="+o+"&"+$("#filter-search").serialize();$(t).attr("href",n),r.reportLoader.requestUrl=n,e.val("5"),$.ajax({type:"GET",url:n,dataType:"json",success:function(t){r.populateInsightsData(t),r.populatePaginationData(t)}})},Searcher.prototype.bindEvents=function(){var t=this;this.$searchLabelsContainer.on("click",".js-delete-filter",function(){t.$quickSearchForm[0].reset(),$(this).parent().hide()})},Searcher.prototype.refreshSearcher=function(t,e){var r=t.data("url"),a=this;a.$filters.removeClass("hide"),a.addSearchForm(e),a.setFormActions(a.$quickSearchForm,r),a.setFormActions(a.$filterForm,r),a.$filterForm.on("submit",function(){var t=!a.reportLoader.removePaginationButton.closest("span").hasClass("hide");return a.addSearchStatus(),$.ajax({type:"GET",url:a.$filterForm.attr("action"),data:a.$filterForm.serialize()+"&per_page="+a.reportLoader.pageSelector.find(":selected").attr("value")+"&paginate="+t,dataType:"json",success:function(t){a.clearFormFields(),a.reportLoader.requestUrl=this.url,a.populateInsightsData(t),a.reportLoader.paginatorObject.refreshPaginator(t)}}),!1})},Searcher.prototype.addSearchStatus=function(){var t=$(".js-filters");t.empty(),$(".js-filterable").each(function(){var e=$(this);if(e.val()){var r,a,i=e.attr("id"),o=$('label[for="'+i+'"]');r=e.is("select")?e.find("option:selected").text():e.val(),o=o.text()+": "+r,a='<span class="js-filter label label-default" data-ransack-field="'+i+'">'+o+'<span class="icon icon-delete js-delete-filter"></span></span>',t.append(a).show()}})},Searcher.prototype.addSearchForm=function(t){this.$filters.find("#table-filter").empty().append($(tmpl("search-tmpl",t))),this.$filterForm=this.$filters.find("#filter-search"),this.$filters.find(".datepicker").datepicker({dateFormat:"yy-mm-dd"})},Searcher.prototype.setFormActions=function(t,e){t.attr("method","get"),t.attr("action",e)},Searcher.prototype.populateInsightsData=function(t){this.reportLoader.populateInsightsData(t)},Searcher.prototype.clearFormFields=function(){this.$filters.find(".filter-well").slideUp()},Searcher.prototype.fillFormFields=function(t){$.each(Object.keys(t),function(){$("#search_"+this).val(t[this])}),this.addSearchStatus()},Searcher.prototype.clearSearchFields=function(){this.$quickSearchForm[0].reset(),$(".js-filters").empty()},function($){$.extend({tablesorter:new function(){function benchmark(t,e){log(t+","+((new Date).getTime()-e.getTime())+"ms")}function log(t){"undefined"!=typeof console&&"undefined"!=typeof console.debug?console.log(t):alert(t)}function buildParserCache(t,e){if(t.config.debug)var r="";if(0!=t.tBodies.length){var a=t.tBodies[0].rows;if(a[0])for(var i=[],o=a[0].cells,n=o.length,s=0;s<n;s++){var l=!1;$.metadata&&$(e[s]).metadata()&&$(e[s]).metadata().sorter?l=getParserById($(e[s]).metadata().sorter):t.config.headers[s]&&t.config.headers[s].sorter&&(l=getParserById(t.config.headers[s].sorter)),l||(l=detectParserForColumn(t,a,-1,s)),t.config.debug&&(r+="column:"+s+" parser:"+l.id+"\n"),i.push(l)}return t.config.debug&&log(r),i}}function detectParserForColumn(t,e,r,a){for(var i=parsers.length,o=!1,n=!1,s=!0;""==n&&s;)r++,e[r]?(o=getNodeFromRowAndCellIndex(e,r,a),n=trimAndGetNodeText(t.config,o),t.config.debug&&log("Checking if value was empty on row:"+r)):s=!1;for(var l=1;l<i;l++)if(parsers[l].is(n,t,o))return parsers[l];return parsers[0]}function getNodeFromRowAndCellIndex(t,e,r){return t[e].cells[r]}function trimAndGetNodeText(t,e){return $.trim(getElementText(t,e))}function getParserById(t){for(var e=parsers.length,r=0;r<e;r++)if(parsers[r].id.toLowerCase()==t.toLowerCase())return parsers[r];return!1}function buildCache(t){if(t.config.debug)var e=new Date;for(var r=t.tBodies[0]&&t.tBodies[0].rows.length||0,a=t.tBodies[0].rows[0]&&t.tBodies[0].rows[0].cells.length||0,i=t.config.parsers,o={row:[],normalized:[]},n=0;n<r;++n){var s=$(t.tBodies[0].rows[n]),l=[];if(s.hasClass(t.config.cssChildRow))o.row[o.row.length-1]=o.row[o.row.length-1].add(s);else{o.row.push(s);for(var c=0;c<a;++c)l.push(i[c].format(getElementText(t.config,s[0].cells[c]),t,s[0].cells[c]));l.push(o.normalized.length),o.normalized.push(l),l=null}}return t.config.debug&&benchmark("Building cache for "+r+" rows:",e),o}function getElementText(t,e){return e?(t.supportsTextContent||(t.supportsTextContent=e.textContent||!1),"simple"==t.textExtraction?t.supportsTextContent?e.textContent:e.childNodes[0]&&e.childNodes[0].hasChildNodes()?e.childNodes[0].innerHTML:e.innerHTML:"function"==typeof t.textExtraction?t.textExtraction(e):$(e).text()):""}function appendToTable(t,e){if(t.config.debug)var r=new Date;for(var a=e,i=a.row,o=a.normalized,n=o.length,s=o[0].length-1,l=$(t.tBodies[0]),c=[],d=0;d<n;d++){var u=o[d][s];if(c.push(i[u]),!t.config.appender)for(var h=i[u].length,p=0;p<h;p++)l[0].appendChild(i[u][p])}t.config.appender&&t.config.appender(t,c),c=null,t.config.debug&&benchmark("Rebuilt table:",r),applyWidget(t),setTimeout(function(){$(t).trigger("sortEnd")},0)}function buildHeaders(t){if(t.config.debug)var e=new Date;var r=($.metadata,computeTableHeaderCellIndexes(t));return $tableHeaders=$(t.config.selectorHeaders,t).each(function(e){if(this.column=r[this.parentNode.rowIndex+"-"+this.cellIndex],this.order=formatSortingOrder(t.config.sortInitialOrder),this.count=this.order,(checkHeaderMetadata(this)||checkHeaderOptions(t,e))&&(this.sortDisabled=!0),checkHeaderOptionsSortingLocked(t,e)&&(this.order=this.lockedOrder=checkHeaderOptionsSortingLocked(t,e)),!this.sortDisabled){var a=$(this).addClass(t.config.cssHeader);t.config.onRenderHeader&&t.config.onRenderHeader.apply(a)}t.config.headerList[e]=this}),t.config.debug&&(benchmark("Built headers:",e),log($tableHeaders)),$tableHeaders}function computeTableHeaderCellIndexes(t){for(var e=[],r={},a=t.getElementsByTagName("THEAD")[0],i=a.getElementsByTagName("TR"),o=0;o<i.length;o++)for(var n=i[o].cells,s=0;s<n.length;s++){var l,c=n[s],d=c.parentNode.rowIndex,u=d+"-"+c.cellIndex,h=c.rowSpan||1,p=c.colSpan||1;"undefined"==typeof e[d]&&(e[d]=[]);for(var f=0;f<e[d].length+1;f++)if("undefined"==typeof e[d][f]){l=f;break}r[u]=l;for(var f=d;f<d+h;f++){"undefined"==typeof e[f]&&(e[f]=[]);for(var g=e[f],m=l;m<l+p;m++)g[m]="x"}}return r}function checkCellColSpan(t,e,r){for(var a=[],i=t.tHead.rows,o=i[r].cells,n=0;n<o.length;n++){var s=o[n];s.colSpan>1?a=a.concat(checkCellColSpan(t,headerArr,r++)):(1==t.tHead.length||s.rowSpan>1||!i[r+1])&&a.push(s)}return a}function checkHeaderMetadata(t){return!(!$.metadata||!1!==$(t).metadata().sorter)}function checkHeaderOptions(t,e){return!(!t.config.headers[e]||!1!==t.config.headers[e].sorter)}function checkHeaderOptionsSortingLocked(t,e){return!(!t.config.headers[e]||!t.config.headers[e].lockedOrder)&&t.config.headers[e].lockedOrder}function applyWidget(t){for(var e=t.config.widgets,r=e.length,a=0;a<r;a++)getWidgetById(e[a]).format(t)}function getWidgetById(t){for(var e=widgets.length,r=0;r<e;r++)if(widgets[r].id.toLowerCase()==t.toLowerCase())return widgets[r]}function formatSortingOrder(t){return"Number"!=typeof t?"desc"==t.toLowerCase()?1:0:1==t?1:0}function isValueInArray(t,e){for(var r=e.length,a=0;a<r;a++)if(e[a][0]==t)return!0;return!1}function setHeadersCss(t,e,r,a){e.removeClass(a[0]).removeClass(a[1]);var i=[];e.each(function(){this.sortDisabled||(i[this.column]=$(this))});for(var o=r.length,n=0;n<o;n++)i[r[n][0]].addClass(a[r[n][1]])}function fixColumnWidth(t){if(t.config.widthFixed){var e=$("<colgroup>");$("tr:first td",t.tBodies[0]).each(function(){e.append($("<col>").css("width",$(this).width()))}),$(t).prepend(e)}}function updateHeaderSortCount(t,e){for(var r=t.config,a=e.length,i=0;i<a;i++){var o=e[i],n=r.headerList[o[0]];n.count=o[1],n.count++}}function multisort(table,sortList,cache){if(table.config.debug)var sortTime=new Date;for(var dynamicExp="var sortWrapper = function(a,b) {",l=sortList.length,i=0;i<l;i++){var c=sortList[i][0],order=sortList[i][1],s="text"==table.config.parsers[c].type?0==order?makeSortFunction("text","asc",c):makeSortFunction("text","desc",c):0==order?makeSortFunction("numeric","asc",c):makeSortFunction("numeric","desc",c),e="e"+i;dynamicExp+="var "+e+" = "+s,dynamicExp+="if("+e+") { return "+e+"; } ",dynamicExp+="else { "}var orgOrderCol=cache.normalized[0].length-1;dynamicExp+="return a["+orgOrderCol+"]-b["+orgOrderCol+"];";for(var i=0;i<l;i++)dynamicExp+="}; ";return dynamicExp+="return 0; ",dynamicExp+="}; ",table.config.debug&&benchmark("Evaling expression:"+dynamicExp,new Date),eval(dynamicExp),cache.normalized.sort(sortWrapper),table.config.debug&&benchmark("Sorting on "+sortList.toString()+" and dir "+order+" time:",sortTime),cache}function makeSortFunction(t,e,r){var a="a["+r+"]",i="b["+r+"]";return"text"==t&&"asc"==e?"("+a+" == "+i+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+i+" === null ? Number.NEGATIVE_INFINITY : ("+a+" < "+i+") ? -1 : 1 )));":"text"==t&&"desc"==e?"("+a+" == "+i+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+i+" === null ? Number.NEGATIVE_INFINITY : ("+i+" < "+a+") ? -1 : 1 )));":"numeric"==t&&"asc"==e?"("+a+" === null && "+i+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+i+" === null ? Number.NEGATIVE_INFINITY : "+a+" - "+i+"));":"numeric"==t&&"desc"==e?"("+a+" === null && "+i+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+i+" === null ? Number.NEGATIVE_INFINITY : "+i+" - "+a+"));":void 0}function makeSortText(t){return"((a["+t+"] < b["+t+"]) ? -1 : ((a["+t+"] > b["+t+"]) ? 1 : 0));"}function makeSortTextDesc(t){return"((b["+t+"] < a["+t+"]) ? -1 : ((b["+t+"] > a["+t+"]) ? 1 : 0));"}function makeSortNumeric(t){return"a["+t+"]-b["+t+"];"}function makeSortNumericDesc(t){return"b["+t+"]-a["+t+"];"}function sortText(t,e){return table.config.sortLocaleCompare?t.localeCompare(e):t<e?-1:t>e?1:0}function sortTextDesc(t,e){return table.config.sortLocaleCompare?e.localeCompare(t):e<t?-1:e>t?1:0}function sortNumeric(t,e){return t-e}function sortNumericDesc(t,e){return e-t}function getCachedSortType(t,e){return t[e].type}var parsers=[],widgets=[];this.defaults={cssHeader:"header",cssAsc:"headerSortUp",cssDesc:"headerSortDown",cssChildRow:"expand-child",sortInitialOrder:"asc",sortMultiSortKey:"shiftKey",sortForce:null,sortAppend:null,sortLocaleCompare:!0,textExtraction:"simple",parsers:{},widgets:[],widgetZebra:{css:["even","odd"]},headers:{},widthFixed:!1,cancelSelection:!0,sortList:[],headerList:[],dateFormat:"us",decimal:"/.|,/g",onRenderHeader:null,selectorHeaders:"thead th",debug:!1},this.benchmark=benchmark,this.construct=function(t){return this.each(function(){if(this.tHead&&this.tBodies){var e,r,a,i;this.config={},i=$.extend(this.config,$.tablesorter.defaults,t),e=$(this),$.data(this,"tablesorter",i),r=buildHeaders(this),this.config.parsers=buildParserCache(this,r),a=buildCache(this);var o=[i.cssDesc,i.cssAsc];fixColumnWidth(this),r.click(function(t){var n=e[0].tBodies[0]&&e[0].tBodies[0].rows.length||0;if(!this.sortDisabled&&n>0){e.trigger("sortStart");var s=($(this),this.column);if(this.order=this.count++%2,this.lockedOrder&&(this.order=this.lockedOrder),t[i.sortMultiSortKey])if(isValueInArray(s,i.sortList))for(var l=0;l<i.sortList.length;l++){var c=i.sortList[l],d=i.headerList[c[0]];c[0]==s&&(d.count=c[1],d.count++,c[1]=d.count%2)}else i.sortList.push([s,this.order]);else{if(i.sortList=[],null!=i.sortForce)for(var u=i.sortForce,l=0;l<u.length;l++)u[l][0]!=s&&i.sortList.push(u[l]);i.sortList.push([s,this.order])}return setTimeout(function(){setHeadersCss(e[0],r,i.sortList,o),appendToTable(e[0],multisort(e[0],i.sortList,a))},1),!1}}).mousedown(function(){if(i.cancelSelection)return this.onselectstart=function(){return!1},!1}),e.bind("update",function(){var t=this;setTimeout(function(){t.config.parsers=buildParserCache(t,r),a=buildCache(t)},1)}).bind("updateCell",function(t,e){var r=this.config,i=[e.parentNode.rowIndex-1,e.cellIndex];a.normalized[i[0]][i[1]]=r.parsers[i[1]].format(getElementText(r,e),e)}).bind("sorton",function(t,e){$(this).trigger("sortStart"),i.sortList=e;var n=i.sortList;updateHeaderSortCount(this,n),setHeadersCss(this,r,n,o),appendToTable(this,multisort(this,n,a))}).bind("appendCache",function(){appendToTable(this,a)}).bind("applyWidgetId",function(t,e){getWidgetById(e).format(this)}).bind("applyWidgets",function(){applyWidget(this)}),$.metadata&&$(this).metadata()&&$(this).metadata().sortlist&&(i.sortList=$(this).metadata().sortlist),i.sortList.length>0&&e.trigger("sorton",[i.sortList]),applyWidget(this)}})},this.addParser=function(t){for(var e=parsers.length,r=!0,a=0;a<e;a++)parsers[a].id.toLowerCase()==t.id.toLowerCase()&&(r=!1);r&&parsers.push(t)},this.addWidget=function(t){widgets.push(t)},this.formatFloat=function(t){var e=parseFloat(t);return isNaN(e)?0:e},this.formatInt=function(t){var e=parseInt(t);return isNaN(e)?0:e},this.isDigit=function(t){return/^[-+]?\d*$/.test($.trim(t.replace(/[,.']/g,"")))},this.clearTableBody=function(t){function e(){for(;this.firstChild;)this.removeChild(this.firstChild)}$.browser.msie?e.apply(t.tBodies[0]):t.tBodies[0].innerHTML=""}}}),$.fn.extend({tablesorter:$.tablesorter.construct});var ts=$.tablesorter;ts.addParser({id:"text",is:function(){return!0},format:function(t){return $.trim(t.toLocaleLowerCase())},type:"text"}),ts.addParser({id:"digit",is:function(t,e){var r=e.config;return $.tablesorter.isDigit(t,r)},format:function(t){return $.tablesorter.formatFloat(t)},type:"numeric"}),ts.addParser({id:"currency",is:function(t){return/^[\xa3$\u20ac?.]/.test(t)},format:function(t){return $.tablesorter.formatFloat(t.replace(new RegExp(/[\xa3$\u20ac]/g),""))},type:"numeric"}),ts.addParser({id:"ipAddress",is:function(t){return/^\d{2,3}[\.]\d{2,3}[\.]\d{2,3}[\.]\d{2,3}$/.test(t)},format:function(t){for(var e=t.split("."),r="",a=e.length,i=0;i<a;i++){var o=e[i];2==o.length?r+="0"+o:r+=o}return $.tablesorter.formatFloat(r)},type:"numeric"}),ts.addParser({id:"url",is:function(t){return/^(https?|ftp|file):\/\/$/.test(t)},format:function(t){return jQuery.trim(t.replace(new RegExp(/(https?|ftp|file):\/\//),""))},type:"text"}),ts.addParser({id:"isoDate",is:function(t){return/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(t)},format:function(t){return $.tablesorter.formatFloat(""!=t?new Date(t.replace(new RegExp(/-/g),"/")).getTime():"0")},type:"numeric"}),ts.addParser({id:"percent",is:function(t){return/\%$/.test($.trim(t))},format:function(t){return $.tablesorter.formatFloat(t.replace(new RegExp(/%/g),""))},type:"numeric"}),ts.addParser({id:"usLongDate",is:function(t){return t.match(new RegExp(/^[A-Za-z]{3,10}\.? [0-9]{1,2}, ([0-9]{4}|'?[0-9]{2}) (([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(AM|PM)))$/))},format:function(t){return $.tablesorter.formatFloat(new Date(t).getTime())},type:"numeric"}),ts.addParser({id:"shortDate",is:function(t){return/\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/.test(t)},format:function(t,e){var r=e.config;return t=t.replace(/\-/g,"/"),"us"==r.dateFormat?t=t.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/,"$3/$1/$2"):"uk"==r.dateFormat?t=t.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/,"$3/$2/$1"):"dd/mm/yy"!=r.dateFormat&&"dd-mm-yy"!=r.dateFormat||(t=t.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})/,"$1/$2/$3")),$.tablesorter.formatFloat(new Date(t).getTime())},type:"numeric"}),ts.addParser({id:"time",is:function(t){return/^(([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(am|pm)))$/.test(t)},format:function(t){return $.tablesorter.formatFloat(new Date("2000/01/01 "+t).getTime())},type:"numeric"}),ts.addParser({id:"metadata",is:function(){return!1},format:function(t,e,r){var a=e.config,i=a.parserMetadataName?a.parserMetadataName:"sortValue";return $(r).metadata()[i]},type:"numeric"}),ts.addWidget({id:"zebra",format:function(t){if(t.config.debug)var e=new Date;var r,a,i=-1;$("tr:visible",t.tBodies[0]).each(function(){r=$(this),r.hasClass(t.config.cssChildRow)||i++,a=i%2==0,r.removeClass(t.config.widgetZebra.css[a?0:1]).addClass(t.config.widgetZebra.css[a?1:0])}),t.config.debug&&$.tablesorter.benchmark("Applying Zebra widget",e)}})}(jQuery),TableSorter.prototype.bindEvents=function(){var t=this;this.$insightsTableList.on("click","#admin-insight .sortable-link",function(){event.preventDefault();var e=t.paginatorDiv.find("li.active a").html()-1,r=!t.reportLoader.removePaginationButton.closest("span").hasClass("hide"),a=$(event.target).attr("href")+"&"+$("#filter-search").serialize()+"&page="+e+"&per_page="+t.reportLoader.pageSelector.find(":selected").attr("value")+"&paginate="+r;t.reportLoader.requestUrl=a,$.ajax({type:"GET",url:a,dataType:"json",success:function(e){t.populateInsightsData(e)}})})},TableSorter.prototype.populateInsightsData=function(t){this.reportLoader.populateInsightsData(t)},TableSorter.prototype.fetchSortedAttribute=function(){var t,e;return this.$insightsTableList.find(".asc").length?(t=this.getSortedAttribute("asc"),e="asc"):this.$insightsTableList.find(".desc").length&&(t=this.getSortedAttribute("desc"),e="desc"),[t,e]},TableSorter.prototype.getSortedAttribute=function(t){return this.$insightsTableList.find("."+t).data("attribute")},ReportLoader.prototype.init=function(){var t={$insightsTable:this.$insightsTableList,reportLoader:this,paginatorDiv:this.paginatorDiv};this.tableSorterObject=new TableSorter(t),this.tableSorterObject.bindEvents();var e={filterDiv:this.filterDiv,insightsDiv:this.$insightsTableList,tableSorterObject:this.tableSorterObject};this.searcherObject=new Searcher(e,this),this.searcherObject.bindEvents();var r={paginatorDiv:this.paginatorDiv,insightsDiv:this.$insightsTableList,tableSorterObject:this.tableSorterObject,removePaginationButton:this.removePaginationButton,applyPaginationButton:this.applyPaginationButton};this.paginatorObject=new Paginator(r,this),this.paginatorObject.bindEvents(),this.setDefaultReport()},ReportLoader.prototype.setDefaultReport=function(){"/admin/insights"==location.pathname&&this.$selectList.val($(this.$selectList.find("option")[1]).val()).change(),window.history.pushState({},"",this.$selectList.find(":selected").data("url"))},ReportLoader.prototype.bindEvents=function(){var t=this;t.$selectList.on("change",function(){$(this).find("option").first().attr("disabled",!0),t.paginatorObject.togglePaginatorButtons(t.paginatorObject.removePaginationButton,t.paginatorObject.applyPaginationButton),t.searcherObject.clearSearchFields(),t.loadChart($(this).find(":selected"))}),this.resetButton.on("click",function(){t.resetFilters(event)}),this.refreshButton.on("click",function(){t.refreshPage(event)}),t.bindPopStateEventCallback()},ReportLoader.prototype.resetFilters=function(t){t.preventDefault();var e=$(t.target),r=!this.removePaginationButton.closest("span").hasClass("hide");e.attr("href",this.perPageSelector.data("url")+"&paginate="+r),e.data("url",this.perPageSelector.data("url")+"&paginate="+r),this.loadChart(e),this.searcherObject.clearSearchFields()},ReportLoader.prototype.refreshPage=function(t){t.preventDefault();var e=$(t.target);e.attr("href",location.href),e.data("url",location.href),this.loadChart(e)},ReportLoader.prototype.bindPopStateEventCallback=function(){var t=this;window.onpopstate=function(e){e.state?report_name=e.state.report_name||"":report_name="",t.$selectList.val(report_name),t.$selectList.select2("val",report_name);var r=t.$selectList.find(":selected");t.fetchChartDataWithoutState(location.href,r)}},ReportLoader.prototype.loadChart=function(t){var e=t.data("url");this.fetchChartData(e,t)},ReportLoader.prototype.fetchChartData=function(t,e){var r=this;r.requestUrl=t,$.ajax({type:"GET",url:t,dataType:"json",success:function(t){r.isStatePushable?r.populateInsightsData(t):r.populateInsightsDataWithoutState(t),t.headers!=undefined&&(r.tableHelpers.removeClass("hide"),0==t.pagination_required?(r.pageSelector.addClass("hide"),$.each(r.pageHelpers.find(".col-md-2"),function(t,e){$(e).removeClass("col-md-2").addClass("col-md-3")})):(r.pageSelector.removeClass("hide"),$.each(r.pageHelpers.find(".col-md-3"),function(t,e){$(e).removeClass("col-md-3").addClass("col-md-2")})),r.perPageSelector.data("url",t.request_path+"?report_category="+t.report_category),r.setDownloadLinksPath(),r.searcherObject.refreshSearcher(e,t),r.paginatorObject.refreshPaginator(t),t.searched_fields!=undefined&&r.searcherObject.fillFormFields(t.searched_fields))}})},ReportLoader.prototype.buildChart=function(t){var e=$("#chart-container");t.chart_json!=undefined&&t.chart_json.chart?(e.empty().removeClass("hidden"),$.each(t.chart_json.charts,function(t,r){var a=$("<div>",{id:r.id});e.append(a),a.highcharts(r.json)})):e.addClass("hidden")},ReportLoader.prototype.fetchChartDataWithoutState=function(t,e){this.isStatePushable=!1,this.fetchChartData(t,e)},ReportLoader.prototype.populateInsightsData=function(t){if(t.headers!=undefined){var e=$(tmpl("tmpl",t));this.$insightsTableList.empty().append(e),this.buildChart(t)}else this.$insightsTableList.empty(),this.paginatorDiv.empty(),this.filterDiv.addClass("hide"),this.chartContainer.addClass("hidden");this.isStatePushable?this.pushUrlToHistory():this.isStatePushable=!0},ReportLoader.prototype.setDownloadLinksPath=function(){var t=this;$.each(this.downloadLinks,function(){$(this).attr("href",$(this).data("url")+"?id="+t.$selectList.val()+"&paginate=false")})},ReportLoader.prototype.populateInsightsDataWithoutState=function(t){this.isStatePushable=!1,this.populateInsightsData(t)},ReportLoader.prototype.pushUrlToHistory=function(){var t=this.$selectList.find(":selected").val();window.history.pushState({report_name:t},"",this.requestUrl),this.requestUrl=""},ReportLoader.prototype.populateInitialData=function(){var t=this.$selectList.find(":selected");this.fetchChartDataWithoutState(location.href,t)},$(function(){var t={insightsDiv:$("#report-div"),reportsSelectBox:$("#reports"),resetButton:$("#reset"),refreshButton:$("#refresh"),removePaginationButton:$("#remove-pagination"),applyPaginationButton:$("#apply-pagination"),tableHelpers:$("#table-helpers"),filterDiv:$("#search-div"),paginatorDiv:$("#paginator-div"),chartContainer:$("#chart-container"),downloadLinks:$(".download-link")},e=new ReportLoader(t);e.init(),e.bindEvents(),e.populateInitialData()}),function(t){"use strict";var e=function(t,r){var a=/[^\w\-\.:]/.test(t)?new Function(e.arg+",tmpl","var _e=tmpl.encode"+e.helper+",_s='"+t.replace(e.regexp,e.func)+"';return _s;"):e.cache[t]=e.cache[t]||e(e.load(t));return r?a(r,e):function(t){return a(t,e)}};e.cache={},e.load=function(t){return document.getElementById(t).innerHTML},e.regexp=/([\s'\\])(?!(?:[^{]|\{(?!%))*%\})|(?:\{%(=|#)([\s\S]+?)%\})|(\{%)|(%\})/g,e.func=function(t,e,r,a,i,o){return e?{"\n":"\\n","\r":"\\r","\t":"\\t"," ":" "}[e]||"\\"+e:r?"="===r?"'+_e("+a+")+'":"'+("+a+"==null?'':"+a+")+'":i?"';":o?"_s+='":void 0},e.encReg=/[<>&"'\x00]/g,e.encMap={"<":"&lt;",">":"&gt;","&":"&amp;",'"':"&quot;","'":"&#39;"},e.encode=function(t){return(null==t?"":""+t).replace(e.encReg,function(t){return e.encMap[t]||""})},e.arg="o",e.helper=",print=function(s,e){_s+=e?(s==null?'':s):_e(s);},include=function(s,d){_s+=tmpl(s,d);}","function"==typeof define&&define.amd?define(function(){return e}):t.tmpl=e}(this);
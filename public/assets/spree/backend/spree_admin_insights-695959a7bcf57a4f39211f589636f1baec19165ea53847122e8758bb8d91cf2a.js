function Paginator(inputs, reportLoader) {
  this.$insightsTableList = inputs.insightsDiv;
  this.paginatorDiv = inputs.paginatorDiv;
  this.tableSorter = inputs.tableSorterObject;
  this.removePaginationButton = inputs.removePaginationButton;
  this.reportLoader = reportLoader;
  this.applyPaginationButton = inputs.applyPaginationButton;
}

Paginator.prototype.bindEvents = function () {
  var _this = this;
  this.paginatorDiv.on('click', '.pagination-link', function (event) {
    event.preventDefault();
    _this.loadPaginationData(event);
  });

  this.reportLoader.perPageSelector.on('change', function(event) {
    _this.togglePaginatorButtons(_this.removePaginationButton, _this.applyPaginationButton);
    _this.loadReportData(event);
  });

  this.removePaginationButton.on('click', function(event) {
    _this.togglePaginatorButtons(_this.applyPaginationButton, _this.removePaginationButton);
    event.preventDefault();
    _this.removePagination(this);
  });

  this.applyPaginationButton.on('click', function(event) {
    _this.togglePaginatorButtons(_this.removePaginationButton, _this.applyPaginationButton);
    event.preventDefault();
    _this.applyPagination(event);
  });
};

Paginator.prototype.togglePaginatorButtons = function(firstButton, secondButton) {
  firstButton.closest('span').removeClass('hide');
  secondButton.closest('span').addClass('hide');
};

Paginator.prototype.refreshPaginator = function(data) {
  this.reportLoader.perPageSelector.val(data['per_page']);
  this.populatePaginationData(data);
};

Paginator.prototype.loadPaginationData = function (event) {
  var $element = $(event.target),
    sorted_attributes = this.tableSorter.fetchSortedAttribute(),
    attribute = sorted_attributes[0],
    sortOrder = sorted_attributes[1],
    requestPath = $element.attr('href') + '&sort%5Battribute%5D=' + attribute + '&sort%5Btype%5D=' + sortOrder,
    _this = this;
  _this.reportLoader.requestUrl = requestPath;

  if (!($element.parents('li').hasClass('active'))) {
    $.ajax({
      type: 'GET',
      url: requestPath,
      dataType: 'json',
      success: function(data) {
        _this.populateInsightsData(data);
        _this.paginatorDiv.find('.active').removeClass('active');
        $element.parents('li').addClass('active');
      }
    });
  }
};

Paginator.prototype.populateInsightsData = function(data) {
  this.reportLoader.populateInsightsData(data);
};

Paginator.prototype.populatePaginationData = function(data) {
  var $templateData = $(tmpl('paginator-tmpl', data));
  this.paginatorDiv.empty().append($templateData);
  this.pageLinks = this.paginatorDiv.find('.pagination-link');
};

Paginator.prototype.loadReportData = function(event) {
  var $element = $(event.target),
      sorted_attributes = this.tableSorter.fetchSortedAttribute(),
      attribute = sorted_attributes[0],
      sortOrder = sorted_attributes[1],
      requestUrl = $element.data('url') + '&sort%5Battribute%5D=' + attribute + '&sort%5Btype%5D=' + sortOrder + '&' + $('#filter-search').serialize() + '&per_page=' + $element.val();
  $element.data('url', requestUrl);
  this.reportLoader.loadChart($element);
};

Paginator.prototype.removePagination = function(currentElement) {
  var $element = this.reportLoader.perPageSelector,
      _this = this,
      sorted_attributes = this.tableSorter.fetchSortedAttribute(),
      attribute = sorted_attributes[0],
      sortOrder = sorted_attributes[1],
      requestUrl = $element.data('url') + '&sort%5Battribute%5D=' + attribute + '&sort%5Btype%5D=' + sortOrder + '&' + $('#filter-search').serialize() + '&paginate=false';
  $(currentElement).attr('href', requestUrl);
  _this.reportLoader.requestUrl = requestUrl;
  $element.val('');
  $.ajax({
    type: 'GET',
    url: requestUrl,
    dataType: 'json',
    success: function(data) {
      _this.populateInsightsData(data);
      _this.paginatorDiv.empty();
    }
  });
};

Paginator.prototype.applyPagination = function(currentElement) {
  var $element = this.reportLoader.perPageSelector,
      _this = this,
      sorted_attributes = this.tableSorter.fetchSortedAttribute(),
      attribute = sorted_attributes[0],
      sortOrder = sorted_attributes[1],
      requestUrl = $element.data('url') + '&sort%5Battribute%5D=' + attribute + '&sort%5Btype%5D=' + sortOrder + '&' + $('#filter-search').serialize();
  $(currentElement).attr('href', requestUrl);
  _this.reportLoader.requestUrl = requestUrl;
  $element.val('5');
  $.ajax({
    type: 'GET',
    url: requestUrl,
    dataType: 'json',
    success: function(data) {
      _this.populateInsightsData(data);
      _this.populatePaginationData(data);
    }
  });
};

function Searcher(inputs, reportLoader) {
  this.$insightsTableList = inputs.insightsDiv;
  this.$filters = inputs.filterDiv;
  this.$quickSearchForm = this.$filters.find('#quick-search');
  this.tableSorter = inputs.tableSorterObject;
  this.reportLoader = reportLoader;
  this.$filterForm = null;
  this.$searchLabelsContainer = this.$filters.find('.table-active-filters');
}

Searcher.prototype.bindEvents = function(data) {
  var _this = this;
  this.$searchLabelsContainer.on("click", ".js-delete-filter", function() {
    _this.$quickSearchForm[0].reset();
    $(this).parent().hide();
  });
};

Searcher.prototype.refreshSearcher = function($selectedInsight, data) {
  var requestPath = $selectedInsight.data('url'),
    _this = this;

  _this.$filters.removeClass('hide');
  _this.addSearchForm(data);
  _this.setFormActions(_this.$quickSearchForm, requestPath);
  _this.setFormActions(_this.$filterForm, requestPath);

  _this.$filterForm.on('submit', function() {
   var paginated = !_this.reportLoader.removePaginationButton.closest('span').hasClass('hide');
   _this.addSearchStatus();
   $.ajax({
     type: "GET",
     url: _this.$filterForm.attr('action'),
     data: _this.$filterForm.serialize() + "&per_page=" + _this.reportLoader.pageSelector.find(':selected').attr('value') + '&paginate=' + paginated,
     dataType: 'json',
     success: function(data) {
      _this.clearFormFields();
      _this.reportLoader.requestUrl = this.url;
      _this.populateInsightsData(data);
      _this.reportLoader.paginatorObject.refreshPaginator(data);
     }
   });
   return false;
  });
};

Searcher.prototype.addSearchStatus = function () {
  var filtersContainer = $(".js-filters");
  filtersContainer.empty();
  $(".js-filterable").each(function() {
   var $this = $(this);

    if ($this.val()) {
      var ransack_value, filter;
      var ransack_field = $this.attr("id");
      var label = $('label[for="' + ransack_field + '"]');
      if ($this.is("select")) {
        ransack_value = $this.find('option:selected').text();
      } else {
        ransack_value = $this.val();
      }

      label = label.text() + ': ' + ransack_value;
      filter = '<span class="js-filter label label-default" data-ransack-field="' + ransack_field + '">' + label + '<span class="icon icon-delete js-delete-filter"></span></span>';

      filtersContainer.append(filter).show();
    }
  });
};

Searcher.prototype.addSearchForm = function(data) {
  this.$filters.find('#table-filter').empty().append($(tmpl('search-tmpl', data)));
  this.$filterForm = this.$filters.find('#filter-search');
  this.$filters.find('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
};

Searcher.prototype.setFormActions = function($form, path) {
  $form.attr("method", "get");
  $form.attr("action", path);
};

Searcher.prototype.populateInsightsData = function(data) {
  this.reportLoader.populateInsightsData(data);
};

Searcher.prototype.clearFormFields = function() {
  this.$filters.find('.filter-well').slideUp();
};

Searcher.prototype.fillFormFields = function(searchedFields) {
  $.each(Object.keys(searchedFields), function() {
    $('#search_' + this).val(searchedFields[this]);
  });
  this.addSearchStatus();
};

Searcher.prototype.clearSearchFields = function() {
  this.$quickSearchForm[0].reset();
  var filtersContainer = $(".js-filters");
  filtersContainer.empty();
};

(function($){$.extend({tablesorter:new
function(){var parsers=[],widgets=[];this.defaults={cssHeader:"header",cssAsc:"headerSortUp",cssDesc:"headerSortDown",cssChildRow:"expand-child",sortInitialOrder:"asc",sortMultiSortKey:"shiftKey",sortForce:null,sortAppend:null,sortLocaleCompare:true,textExtraction:"simple",parsers:{},widgets:[],widgetZebra:{css:["even","odd"]},headers:{},widthFixed:false,cancelSelection:true,sortList:[],headerList:[],dateFormat:"us",decimal:'/\.|\,/g',onRenderHeader:null,selectorHeaders:'thead th',debug:false};function benchmark(s,d){log(s+","+(new Date().getTime()-d.getTime())+"ms");}this.benchmark=benchmark;function log(s){if(typeof console!="undefined"&&typeof console.debug!="undefined"){console.log(s);}else{alert(s);}}function buildParserCache(table,$headers){if(table.config.debug){var parsersDebug="";}if(table.tBodies.length==0)return;var rows=table.tBodies[0].rows;if(rows[0]){var list=[],cells=rows[0].cells,l=cells.length;for(var i=0;i<l;i++){var p=false;if($.metadata&&($($headers[i]).metadata()&&$($headers[i]).metadata().sorter)){p=getParserById($($headers[i]).metadata().sorter);}else if((table.config.headers[i]&&table.config.headers[i].sorter)){p=getParserById(table.config.headers[i].sorter);}if(!p){p=detectParserForColumn(table,rows,-1,i);}if(table.config.debug){parsersDebug+="column:"+i+" parser:"+p.id+"\n";}list.push(p);}}if(table.config.debug){log(parsersDebug);}return list;};function detectParserForColumn(table,rows,rowIndex,cellIndex){var l=parsers.length,node=false,nodeValue=false,keepLooking=true;while(nodeValue==''&&keepLooking){rowIndex++;if(rows[rowIndex]){node=getNodeFromRowAndCellIndex(rows,rowIndex,cellIndex);nodeValue=trimAndGetNodeText(table.config,node);if(table.config.debug){log('Checking if value was empty on row:'+rowIndex);}}else{keepLooking=false;}}for(var i=1;i<l;i++){if(parsers[i].is(nodeValue,table,node)){return parsers[i];}}return parsers[0];}function getNodeFromRowAndCellIndex(rows,rowIndex,cellIndex){return rows[rowIndex].cells[cellIndex];}function trimAndGetNodeText(config,node){return $.trim(getElementText(config,node));}function getParserById(name){var l=parsers.length;for(var i=0;i<l;i++){if(parsers[i].id.toLowerCase()==name.toLowerCase()){return parsers[i];}}return false;}function buildCache(table){if(table.config.debug){var cacheTime=new Date();}var totalRows=(table.tBodies[0]&&table.tBodies[0].rows.length)||0,totalCells=(table.tBodies[0].rows[0]&&table.tBodies[0].rows[0].cells.length)||0,parsers=table.config.parsers,cache={row:[],normalized:[]};for(var i=0;i<totalRows;++i){var c=$(table.tBodies[0].rows[i]),cols=[];if(c.hasClass(table.config.cssChildRow)){cache.row[cache.row.length-1]=cache.row[cache.row.length-1].add(c);continue;}cache.row.push(c);for(var j=0;j<totalCells;++j){cols.push(parsers[j].format(getElementText(table.config,c[0].cells[j]),table,c[0].cells[j]));}cols.push(cache.normalized.length);cache.normalized.push(cols);cols=null;};if(table.config.debug){benchmark("Building cache for "+totalRows+" rows:",cacheTime);}return cache;};function getElementText(config,node){var text="";if(!node)return"";if(!config.supportsTextContent)config.supportsTextContent=node.textContent||false;if(config.textExtraction=="simple"){if(config.supportsTextContent){text=node.textContent;}else{if(node.childNodes[0]&&node.childNodes[0].hasChildNodes()){text=node.childNodes[0].innerHTML;}else{text=node.innerHTML;}}}else{if(typeof(config.textExtraction)=="function"){text=config.textExtraction(node);}else{text=$(node).text();}}return text;}function appendToTable(table,cache){if(table.config.debug){var appendTime=new Date()}var c=cache,r=c.row,n=c.normalized,totalRows=n.length,checkCell=(n[0].length-1),tableBody=$(table.tBodies[0]),rows=[];for(var i=0;i<totalRows;i++){var pos=n[i][checkCell];rows.push(r[pos]);if(!table.config.appender){var l=r[pos].length;for(var j=0;j<l;j++){tableBody[0].appendChild(r[pos][j]);}}}if(table.config.appender){table.config.appender(table,rows);}rows=null;if(table.config.debug){benchmark("Rebuilt table:",appendTime);}applyWidget(table);setTimeout(function(){$(table).trigger("sortEnd");},0);};function buildHeaders(table){if(table.config.debug){var time=new Date();}var meta=($.metadata)?true:false;var header_index=computeTableHeaderCellIndexes(table);$tableHeaders=$(table.config.selectorHeaders,table).each(function(index){this.column=header_index[this.parentNode.rowIndex+"-"+this.cellIndex];this.order=formatSortingOrder(table.config.sortInitialOrder);this.count=this.order;if(checkHeaderMetadata(this)||checkHeaderOptions(table,index))this.sortDisabled=true;if(checkHeaderOptionsSortingLocked(table,index))this.order=this.lockedOrder=checkHeaderOptionsSortingLocked(table,index);if(!this.sortDisabled){var $th=$(this).addClass(table.config.cssHeader);if(table.config.onRenderHeader)table.config.onRenderHeader.apply($th);}table.config.headerList[index]=this;});if(table.config.debug){benchmark("Built headers:",time);log($tableHeaders);}return $tableHeaders;};function computeTableHeaderCellIndexes(t){var matrix=[];var lookup={};var thead=t.getElementsByTagName('THEAD')[0];var trs=thead.getElementsByTagName('TR');for(var i=0;i<trs.length;i++){var cells=trs[i].cells;for(var j=0;j<cells.length;j++){var c=cells[j];var rowIndex=c.parentNode.rowIndex;var cellId=rowIndex+"-"+c.cellIndex;var rowSpan=c.rowSpan||1;var colSpan=c.colSpan||1
var firstAvailCol;if(typeof(matrix[rowIndex])=="undefined"){matrix[rowIndex]=[];}for(var k=0;k<matrix[rowIndex].length+1;k++){if(typeof(matrix[rowIndex][k])=="undefined"){firstAvailCol=k;break;}}lookup[cellId]=firstAvailCol;for(var k=rowIndex;k<rowIndex+rowSpan;k++){if(typeof(matrix[k])=="undefined"){matrix[k]=[];}var matrixrow=matrix[k];for(var l=firstAvailCol;l<firstAvailCol+colSpan;l++){matrixrow[l]="x";}}}}return lookup;}function checkCellColSpan(table,rows,row){var arr=[],r=table.tHead.rows,c=r[row].cells;for(var i=0;i<c.length;i++){var cell=c[i];if(cell.colSpan>1){arr=arr.concat(checkCellColSpan(table,headerArr,row++));}else{if(table.tHead.length==1||(cell.rowSpan>1||!r[row+1])){arr.push(cell);}}}return arr;};function checkHeaderMetadata(cell){if(($.metadata)&&($(cell).metadata().sorter===false)){return true;};return false;}function checkHeaderOptions(table,i){if((table.config.headers[i])&&(table.config.headers[i].sorter===false)){return true;};return false;}function checkHeaderOptionsSortingLocked(table,i){if((table.config.headers[i])&&(table.config.headers[i].lockedOrder))return table.config.headers[i].lockedOrder;return false;}function applyWidget(table){var c=table.config.widgets;var l=c.length;for(var i=0;i<l;i++){getWidgetById(c[i]).format(table);}}function getWidgetById(name){var l=widgets.length;for(var i=0;i<l;i++){if(widgets[i].id.toLowerCase()==name.toLowerCase()){return widgets[i];}}};function formatSortingOrder(v){if(typeof(v)!="Number"){return(v.toLowerCase()=="desc")?1:0;}else{return(v==1)?1:0;}}function isValueInArray(v,a){var l=a.length;for(var i=0;i<l;i++){if(a[i][0]==v){return true;}}return false;}function setHeadersCss(table,$headers,list,css){$headers.removeClass(css[0]).removeClass(css[1]);var h=[];$headers.each(function(offset){if(!this.sortDisabled){h[this.column]=$(this);}});var l=list.length;for(var i=0;i<l;i++){h[list[i][0]].addClass(css[list[i][1]]);}}function fixColumnWidth(table,$headers){var c=table.config;if(c.widthFixed){var colgroup=$('<colgroup>');$("tr:first td",table.tBodies[0]).each(function(){colgroup.append($('<col>').css('width',$(this).width()));});$(table).prepend(colgroup);};}function updateHeaderSortCount(table,sortList){var c=table.config,l=sortList.length;for(var i=0;i<l;i++){var s=sortList[i],o=c.headerList[s[0]];o.count=s[1];o.count++;}}function multisort(table,sortList,cache){if(table.config.debug){var sortTime=new Date();}var dynamicExp="var sortWrapper = function(a,b) {",l=sortList.length;for(var i=0;i<l;i++){var c=sortList[i][0];var order=sortList[i][1];var s=(table.config.parsers[c].type=="text")?((order==0)?makeSortFunction("text","asc",c):makeSortFunction("text","desc",c)):((order==0)?makeSortFunction("numeric","asc",c):makeSortFunction("numeric","desc",c));var e="e"+i;dynamicExp+="var "+e+" = "+s;dynamicExp+="if("+e+") { return "+e+"; } ";dynamicExp+="else { ";}var orgOrderCol=cache.normalized[0].length-1;dynamicExp+="return a["+orgOrderCol+"]-b["+orgOrderCol+"];";for(var i=0;i<l;i++){dynamicExp+="}; ";}dynamicExp+="return 0; ";dynamicExp+="}; ";if(table.config.debug){benchmark("Evaling expression:"+dynamicExp,new Date());}eval(dynamicExp);cache.normalized.sort(sortWrapper);if(table.config.debug){benchmark("Sorting on "+sortList.toString()+" and dir "+order+" time:",sortTime);}return cache;};function makeSortFunction(type,direction,index){var a="a["+index+"]",b="b["+index+"]";if(type=='text'&&direction=='asc'){return"("+a+" == "+b+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : ("+a+" < "+b+") ? -1 : 1 )));";}else if(type=='text'&&direction=='desc'){return"("+a+" == "+b+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : ("+b+" < "+a+") ? -1 : 1 )));";}else if(type=='numeric'&&direction=='asc'){return"("+a+" === null && "+b+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : "+a+" - "+b+"));";}else if(type=='numeric'&&direction=='desc'){return"("+a+" === null && "+b+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : "+b+" - "+a+"));";}};function makeSortText(i){return"((a["+i+"] < b["+i+"]) ? -1 : ((a["+i+"] > b["+i+"]) ? 1 : 0));";};function makeSortTextDesc(i){return"((b["+i+"] < a["+i+"]) ? -1 : ((b["+i+"] > a["+i+"]) ? 1 : 0));";};function makeSortNumeric(i){return"a["+i+"]-b["+i+"];";};function makeSortNumericDesc(i){return"b["+i+"]-a["+i+"];";};function sortText(a,b){if(table.config.sortLocaleCompare)return a.localeCompare(b);return((a<b)?-1:((a>b)?1:0));};function sortTextDesc(a,b){if(table.config.sortLocaleCompare)return b.localeCompare(a);return((b<a)?-1:((b>a)?1:0));};function sortNumeric(a,b){return a-b;};function sortNumericDesc(a,b){return b-a;};function getCachedSortType(parsers,i){return parsers[i].type;};this.construct=function(settings){return this.each(function(){if(!this.tHead||!this.tBodies)return;var $this,$document,$headers,cache,config,shiftDown=0,sortOrder;this.config={};config=$.extend(this.config,$.tablesorter.defaults,settings);$this=$(this);$.data(this,"tablesorter",config);$headers=buildHeaders(this);this.config.parsers=buildParserCache(this,$headers);cache=buildCache(this);var sortCSS=[config.cssDesc,config.cssAsc];fixColumnWidth(this);$headers.click(function(e){var totalRows=($this[0].tBodies[0]&&$this[0].tBodies[0].rows.length)||0;if(!this.sortDisabled&&totalRows>0){$this.trigger("sortStart");var $cell=$(this);var i=this.column;this.order=this.count++%2;if(this.lockedOrder)this.order=this.lockedOrder;if(!e[config.sortMultiSortKey]){config.sortList=[];if(config.sortForce!=null){var a=config.sortForce;for(var j=0;j<a.length;j++){if(a[j][0]!=i){config.sortList.push(a[j]);}}}config.sortList.push([i,this.order]);}else{if(isValueInArray(i,config.sortList)){for(var j=0;j<config.sortList.length;j++){var s=config.sortList[j],o=config.headerList[s[0]];if(s[0]==i){o.count=s[1];o.count++;s[1]=o.count%2;}}}else{config.sortList.push([i,this.order]);}};setTimeout(function(){setHeadersCss($this[0],$headers,config.sortList,sortCSS);appendToTable($this[0],multisort($this[0],config.sortList,cache));},1);return false;}}).mousedown(function(){if(config.cancelSelection){this.onselectstart=function(){return false};return false;}});$this.bind("update",function(){var me=this;setTimeout(function(){me.config.parsers=buildParserCache(me,$headers);cache=buildCache(me);},1);}).bind("updateCell",function(e,cell){var config=this.config;var pos=[(cell.parentNode.rowIndex-1),cell.cellIndex];cache.normalized[pos[0]][pos[1]]=config.parsers[pos[1]].format(getElementText(config,cell),cell);}).bind("sorton",function(e,list){$(this).trigger("sortStart");config.sortList=list;var sortList=config.sortList;updateHeaderSortCount(this,sortList);setHeadersCss(this,$headers,sortList,sortCSS);appendToTable(this,multisort(this,sortList,cache));}).bind("appendCache",function(){appendToTable(this,cache);}).bind("applyWidgetId",function(e,id){getWidgetById(id).format(this);}).bind("applyWidgets",function(){applyWidget(this);});if($.metadata&&($(this).metadata()&&$(this).metadata().sortlist)){config.sortList=$(this).metadata().sortlist;}if(config.sortList.length>0){$this.trigger("sorton",[config.sortList]);}applyWidget(this);});};this.addParser=function(parser){var l=parsers.length,a=true;for(var i=0;i<l;i++){if(parsers[i].id.toLowerCase()==parser.id.toLowerCase()){a=false;}}if(a){parsers.push(parser);};};this.addWidget=function(widget){widgets.push(widget);};this.formatFloat=function(s){var i=parseFloat(s);return(isNaN(i))?0:i;};this.formatInt=function(s){var i=parseInt(s);return(isNaN(i))?0:i;};this.isDigit=function(s,config){return/^[-+]?\d*$/.test($.trim(s.replace(/[,.']/g,'')));};this.clearTableBody=function(table){if($.browser.msie){function empty(){while(this.firstChild)this.removeChild(this.firstChild);}empty.apply(table.tBodies[0]);}else{table.tBodies[0].innerHTML="";}};}});$.fn.extend({tablesorter:$.tablesorter.construct});var ts=$.tablesorter;ts.addParser({id:"text",is:function(s){return true;},format:function(s){return $.trim(s.toLocaleLowerCase());},type:"text"});ts.addParser({id:"digit",is:function(s,table){var c=table.config;return $.tablesorter.isDigit(s,c);},format:function(s){return $.tablesorter.formatFloat(s);},type:"numeric"});ts.addParser({id:"currency",is:function(s){return/^[£$€?.]/.test(s);},format:function(s){return $.tablesorter.formatFloat(s.replace(new RegExp(/[£$€]/g),""));},type:"numeric"});ts.addParser({id:"ipAddress",is:function(s){return/^\d{2,3}[\.]\d{2,3}[\.]\d{2,3}[\.]\d{2,3}$/.test(s);},format:function(s){var a=s.split("."),r="",l=a.length;for(var i=0;i<l;i++){var item=a[i];if(item.length==2){r+="0"+item;}else{r+=item;}}return $.tablesorter.formatFloat(r);},type:"numeric"});ts.addParser({id:"url",is:function(s){return/^(https?|ftp|file):\/\/$/.test(s);},format:function(s){return jQuery.trim(s.replace(new RegExp(/(https?|ftp|file):\/\//),''));},type:"text"});ts.addParser({id:"isoDate",is:function(s){return/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(s);},format:function(s){return $.tablesorter.formatFloat((s!="")?new Date(s.replace(new RegExp(/-/g),"/")).getTime():"0");},type:"numeric"});ts.addParser({id:"percent",is:function(s){return/\%$/.test($.trim(s));},format:function(s){return $.tablesorter.formatFloat(s.replace(new RegExp(/%/g),""));},type:"numeric"});ts.addParser({id:"usLongDate",is:function(s){return s.match(new RegExp(/^[A-Za-z]{3,10}\.? [0-9]{1,2}, ([0-9]{4}|'?[0-9]{2}) (([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(AM|PM)))$/));},format:function(s){return $.tablesorter.formatFloat(new Date(s).getTime());},type:"numeric"});ts.addParser({id:"shortDate",is:function(s){return/\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/.test(s);},format:function(s,table){var c=table.config;s=s.replace(/\-/g,"/");if(c.dateFormat=="us"){s=s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/,"$3/$1/$2");}else if(c.dateFormat=="uk"){s=s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/,"$3/$2/$1");}else if(c.dateFormat=="dd/mm/yy"||c.dateFormat=="dd-mm-yy"){s=s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})/,"$1/$2/$3");}return $.tablesorter.formatFloat(new Date(s).getTime());},type:"numeric"});ts.addParser({id:"time",is:function(s){return/^(([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(am|pm)))$/.test(s);},format:function(s){return $.tablesorter.formatFloat(new Date("2000/01/01 "+s).getTime());},type:"numeric"});ts.addParser({id:"metadata",is:function(s){return false;},format:function(s,table,cell){var c=table.config,p=(!c.parserMetadataName)?'sortValue':c.parserMetadataName;return $(cell).metadata()[p];},type:"numeric"});ts.addWidget({id:"zebra",format:function(table){if(table.config.debug){var time=new Date();}var $tr,row=-1,odd;$("tr:visible",table.tBodies[0]).each(function(i){$tr=$(this);if(!$tr.hasClass(table.config.cssChildRow))row++;odd=(row%2==0);$tr.removeClass(table.config.widgetZebra.css[odd?0:1]).addClass(table.config.widgetZebra.css[odd?1:0])});if(table.config.debug){$.tablesorter.benchmark("Applying Zebra widget",time);}}});})(jQuery);

function TableSorter(inputs) {
  this.$insightsTableList = inputs.$insightsTable;
  this.reportLoader = inputs.reportLoader;
  this.paginatorDiv = inputs.paginatorDiv;
}

TableSorter.prototype.bindEvents = function() {
  var _this = this;
  this.$insightsTableList.on('click', '#admin-insight .sortable-link', function() {
    event.preventDefault();
    var currentPage = _this.paginatorDiv.find('li.active a').html() - 1,
      paginated = !_this.reportLoader.removePaginationButton.closest('span').hasClass('hide'),
      requestPath = $(event.target).attr('href') + '&' + $('#filter-search').serialize() + '&page=' + currentPage + "&per_page=" + _this.reportLoader.pageSelector.find(':selected').attr('value') + '&paginate=' + paginated;
    _this.reportLoader.requestUrl = requestPath;

    $.ajax({
      type: 'GET',
      url: requestPath,
      dataType: 'json',
      success: function(data) {
        _this.populateInsightsData(data);
      }
    });
  });
};

TableSorter.prototype.populateInsightsData = function(data) {
  this.reportLoader.populateInsightsData(data);
};

TableSorter.prototype.fetchSortedAttribute = function() {
  var attribute, sortOrder;
  if (this.$insightsTableList.find('.asc').length) {
    attribute = this.getSortedAttribute('asc');
    sortOrder = 'asc';
  } else if(this.$insightsTableList.find('.desc').length) {
    attribute = this.getSortedAttribute('desc');
    sortOrder = 'desc';
  }
  return [attribute, sortOrder];
};

TableSorter.prototype.getSortedAttribute = function(order) {
  return this.$insightsTableList.find('.' + order).data('attribute');
};




function ReportLoader(inputs) {
  this.$selectList = inputs.reportsSelectBox;
  this.$insightsTableList = inputs.insightsDiv;
  this.tableHelpers = inputs.tableHelpers;
  this.pageSelector = inputs.tableHelpers.find('#page-selector');
  this.perPageSelector = this.tableHelpers.find('#per_page');
  this.pageHelpers = this.tableHelpers.find('#page-helpers');
  this.resetButton = inputs.resetButton;
  this.refreshButton = inputs.refreshButton;
  this.filterDiv = inputs.filterDiv;
  this.paginatorDiv = inputs.paginatorDiv;
  this.removePaginationButton = inputs.removePaginationButton;
  this.applyPaginationButton = inputs.applyPaginationButton;
  this.chartContainer = inputs.chartContainer;
  this.downloadLinks = inputs.downloadLinks;
  this.requestUrl = '';
  this.isStatePushable = true;
  this.tableSorterObject = null;
  this.searcherObject = null;
  this.paginatorObject = null;
}

ReportLoader.prototype.init = function() {
  var tableSorterInputs = {
    $insightsTable: this.$insightsTableList,
    reportLoader: this,
    paginatorDiv: this.paginatorDiv
  };
  this.tableSorterObject = new TableSorter(tableSorterInputs);
  this.tableSorterObject.bindEvents();

  var searcherInputs = {
    filterDiv:   this.filterDiv,
    insightsDiv: this.$insightsTableList,
    tableSorterObject: this.tableSorterObject
  };
  this.searcherObject = new Searcher(searcherInputs, this);
  this.searcherObject.bindEvents();

  var paginatorInputs = {
    paginatorDiv: this.paginatorDiv,
    insightsDiv: this.$insightsTableList,
    tableSorterObject: this.tableSorterObject,
    removePaginationButton: this.removePaginationButton,
    applyPaginationButton: this.applyPaginationButton
  };
  this.paginatorObject = new Paginator(paginatorInputs, this);
  this.paginatorObject.bindEvents();
  this.setDefaultReport();
};

ReportLoader.prototype.setDefaultReport = function() {
  if(location.pathname == '/admin/insights') {
    this.$selectList.val($(this.$selectList.find('option')[1]).val()).change();
  }
  window.history.pushState({}, '', this.$selectList.find(':selected').data('url'));
};

ReportLoader.prototype.bindEvents = function() {
  var _this = this;
  _this.$selectList.on('change', function() {
    $(this).find('option').first().attr('disabled', true);
    _this.paginatorObject.togglePaginatorButtons(_this.paginatorObject.removePaginationButton, _this.paginatorObject.applyPaginationButton);
    _this.searcherObject.clearSearchFields();
    _this.loadChart($(this).find(':selected'));
  });

  this.resetButton.on('click', function() {
    _this.resetFilters(event);
  });

  this.refreshButton.on('click', function() {
    _this.refreshPage(event);
  });

  _this.bindPopStateEventCallback();
};

ReportLoader.prototype.resetFilters = function(event) {
  event.preventDefault();
  var $element = $(event.target),
      paginated = !this.removePaginationButton.closest('span').hasClass('hide');
  $element.attr('href', this.perPageSelector.data('url') + '&paginate=' + paginated);
  $element.data('url', this.perPageSelector.data('url') + '&paginate=' + paginated);
  this.loadChart($element);
  this.searcherObject.clearSearchFields();
};

ReportLoader.prototype.refreshPage = function(event) {
  event.preventDefault();
  var $element = $(event.target);
  $element.attr('href', location.href);
  $element.data('url', location.href);
  this.loadChart($element);
};

ReportLoader.prototype.bindPopStateEventCallback = function() {
  var _this = this;
  window.onpopstate = function(event) {
    event.state ? (report_name = event.state['report_name'] || '') : (report_name = '');
    _this.$selectList.val(report_name);
    _this.$selectList.select2('val', report_name);
    var $selectedOption = _this.$selectList.find(':selected');
    _this.fetchChartDataWithoutState(location.href, $selectedOption);
  };
};

ReportLoader.prototype.loadChart = function($selectedOption) {
  var requestPath = $selectedOption.data('url');
  this.fetchChartData(requestPath, $selectedOption);
};

ReportLoader.prototype.fetchChartData = function(url, $selectedOption) {
  var _this = this;
  _this.requestUrl = url;
  $.ajax({
    type: 'GET',
    url: url,
    dataType: 'json',
    success: function(data) {
      (_this.isStatePushable ? _this.populateInsightsData(data) : _this.populateInsightsDataWithoutState(data))
      if(data.headers != undefined) {
        _this.tableHelpers.removeClass('hide');
        if(data.pagination_required == false) {
          _this.pageSelector.addClass('hide');
          $.each(_this.pageHelpers.find('.col-md-2'), function(index, object) {
            $(object).removeClass('col-md-2').addClass('col-md-3');
          });
        } else {
          _this.pageSelector.removeClass('hide');
          $.each(_this.pageHelpers.find('.col-md-3'), function(index, object) {
            $(object).removeClass('col-md-3').addClass('col-md-2');
          });
        }
        _this.perPageSelector.data('url', data['request_path'] + '?report_category=' + data['report_category']);
        _this.setDownloadLinksPath();
        _this.searcherObject.refreshSearcher($selectedOption, data);
        _this.paginatorObject.refreshPaginator(data);
        if(data.searched_fields != undefined)
          _this.searcherObject.fillFormFields(data.searched_fields);
      }
    }
  });
};

ReportLoader.prototype.buildChart = function(data) {
  var chart_container = $('#chart-container');
  if ((data['chart_json'] != undefined) && (data['chart_json']['chart'])) {
    chart_container.empty().removeClass('hidden');
    $.each(data['chart_json']['charts'], function(index, chart) {
      var chart_div = $('<div>', { id: chart['id'] });
      chart_container.append(chart_div);
      chart_div.highcharts(chart['json']);
    });
  } else {
    chart_container.addClass('hidden');
  }
};

ReportLoader.prototype.fetchChartDataWithoutState = function(url, $selectedOption) {
  this.isStatePushable = false;
  this.fetchChartData(url, $selectedOption);
};

ReportLoader.prototype.populateInsightsData = function(data) {
  if(data.headers != undefined) {
    var $templateData = $(tmpl('tmpl', data));
    this.$insightsTableList.empty().append($templateData);
    this.buildChart(data);
  } else {
    this.$insightsTableList.empty();
    this.paginatorDiv.empty();
    this.filterDiv.addClass('hide');
    this.chartContainer.addClass('hidden');
  }
  if(this.isStatePushable) {
    this.pushUrlToHistory();
  } else {
    this.isStatePushable = true;
  }
};

ReportLoader.prototype.setDownloadLinksPath = function($selectedOption) {
  var _this = this;
  $.each(this.downloadLinks, function() {
    $(this).attr('href', $(this).data('url') + '?id=' + _this.$selectList.val() + '&paginate=false');
  });
};

ReportLoader.prototype.populateInsightsDataWithoutState = function(data) {
  this.isStatePushable = false;
  this.populateInsightsData(data);
};

ReportLoader.prototype.pushUrlToHistory = function() {
  var report_name = this.$selectList.find(':selected').val();
  window.history.pushState({ report_name: report_name }, '', this.requestUrl);
  this.requestUrl = '';
};

ReportLoader.prototype.populateInitialData = function() {
  var $selectedOption = this.$selectList.find(':selected');
  this.fetchChartDataWithoutState(location.href, $selectedOption);
};

$(function() {
  var inputs = {
    insightsDiv:      $('#report-div'),
    reportsSelectBox: $('#reports'),
    resetButton: $('#reset'),
    refreshButton: $('#refresh'),
    removePaginationButton: $('#remove-pagination'),
    applyPaginationButton: $('#apply-pagination'),
    tableHelpers: $('#table-helpers'),
    filterDiv: $('#search-div'),
    paginatorDiv: $('#paginator-div'),
    chartContainer: $('#chart-container'),
    downloadLinks: $('.download-link')
  },
    reportLoader = new ReportLoader(inputs);
  reportLoader.init();
  reportLoader.bindEvents();
  reportLoader.populateInitialData();
});
/*
 * JavaScript Templates 2.4.1
 * https://github.com/blueimp/JavaScript-Templates
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Inspired by John Resig's JavaScript Micro-Templating:
 * http://ejohn.org/blog/javascript-micro-templating/
 */

/*jslint evil: true, regexp: true, unparam: true */
/*global document, define */


(function ($) {
    "use strict";
    var tmpl = function (str, data) {
        var f = !/[^\w\-\.:]/.test(str) ? tmpl.cache[str] = tmpl.cache[str] ||
                tmpl(tmpl.load(str)) :
                    new Function(
                        tmpl.arg + ',tmpl',
                        "var _e=tmpl.encode" + tmpl.helper + ",_s='" +
                            str.replace(tmpl.regexp, tmpl.func) +
                            "';return _s;"
                    );
        return data ? f(data, tmpl) : function (data) {
            return f(data, tmpl);
        };
    };
    tmpl.cache = {};
    tmpl.load = function (id) {
        return document.getElementById(id).innerHTML;
    };
    tmpl.regexp = /([\s'\\])(?!(?:[^{]|\{(?!%))*%\})|(?:\{%(=|#)([\s\S]+?)%\})|(\{%)|(%\})/g;
    tmpl.func = function (s, p1, p2, p3, p4, p5) {
        if (p1) { // whitespace, quote and backspace in HTML context
            return {
                "\n": "\\n",
                "\r": "\\r",
                "\t": "\\t",
                " " : " "
            }[p1] || "\\" + p1;
        }
        if (p2) { // interpolation: {%=prop%}, or unescaped: {%#prop%}
            if (p2 === "=") {
                return "'+_e(" + p3 + ")+'";
            }
            return "'+(" + p3 + "==null?'':" + p3 + ")+'";
        }
        if (p4) { // evaluation start tag: {%
            return "';";
        }
        if (p5) { // evaluation end tag: %}
            return "_s+='";
        }
    };
    tmpl.encReg = /[<>&"'\x00]/g;
    tmpl.encMap = {
        "<"   : "&lt;",
        ">"   : "&gt;",
        "&"   : "&amp;",
        "\""  : "&quot;",
        "'"   : "&#39;"
    };
    tmpl.encode = function (s) {
        /*jshint eqnull:true */
        return (s == null ? "" : "" + s).replace(
            tmpl.encReg,
            function (c) {
                return tmpl.encMap[c] || "";
            }
        );
    };
    tmpl.arg = "o";
    tmpl.helper = ",print=function(s,e){_s+=e?(s==null?'':s):_e(s);}" +
        ",include=function(s,d){_s+=tmpl(s,d);}";
    if (typeof define === "function" && define.amd) {
        define(function () {
            return tmpl;
        });
    } else {
        $.tmpl = tmpl;
    }
}(this));



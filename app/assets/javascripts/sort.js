var sort = function(param){
	if(param["admin-only"]){
		adminExclude(param["reversed"])
	}else if(param["admin-first"]){
		adminSort(param["reversed"])
	}else if(param["alphabetical"]){
		alphabeticalSort(param["reversed"])
	}
}

var alphabeticalSort = function(reverse){
	console.log("alphabetical bitches")
}

var adminExclude = function(reverse){
	console.log("adminExclude")
}

var adminSort = function(reverse){
	console.log("adminSort")
}
$( document ).ready(function() {
    $(function(){
		$table = $("#myTable").tablesorter()
		.addClass('hasFilters')
	    .tablesorterPager({
	        container: $(".table-pager"),
	        output: '{page} of {filteredPages} ({filteredRows})',
	        size: 20
	    });
		$('#search').quicksearch('table tbody tr', {
		    delay: 5,
		    selector: ".email",
		    'bind': 'keyup keydown',
		    show: function () {
		        $(this).show().removeClass('filtered');
		        $table.trigger('pageSet'); // reset to page 1 & update display
		    },
		    hide: function () {
		        $(this).hide().addClass('filtered');
		        $table.trigger('pageSet'); // reset to page 1 & update display
		    },
		    onAfter: function () {
		        $table.trigger('update.pager');
		        $table.trigger('pageSet')
		    }
		});
	});
});

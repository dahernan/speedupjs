;(function($) {
  var app = $.sammy(function() {
    this.get('#/', function() {
	    this.load('/').then(function(data){
			dust.render("template1", JSON.parse(data), function(err, out) {
		    	$('#main').html(out);
			});
		});
    });

    this.get('#/test', function() {
		$.getJSON('/', function(data) {
			dust.render("template2", data, function(err, out) {
		    	$('#main').html(out);
			});
		});
    });

  });

  $(function() {
    app.run('#/')
  });
})(jQuery);

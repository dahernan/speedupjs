;(function($) {
  var app = $.sammy(function() {

    this.get('#/', function() {
      $('#main').text('<h1>Sammy running!!!</h1>');
    });

    this.get('#/test', function() {
      $('#main').text('Hello World');
    });

  });

  $(function() {
    app.run('#/')
  });
})(jQuery);

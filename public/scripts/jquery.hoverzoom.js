$(document).ready(function() {
    /*$('.curso').mouseenter(function(e) {
        $(this).children('a').children('img').animate({ height: '130', left: '0', top: '0', width: '192'}, 100);
        $(this).children('a').children('span').fadeIn(200);
    }).mouseleave(function(e) {
        $(this).children('a').children('img').animate({ height: '120', left: '-20', top: '-20', width: '182'}, 100);
        $(this).children('a').children('span').fadeOut(200);
    });*/
    $('.curso').mouseenter(function(e) {
        $(this).children('a').children('img').animate({ height: '120', left: '0', top: '0', width: '182'}, 100);
        $(this).children('a').children('span.dark-background').fadeIn(200);
    }).mouseleave(function(e) {
        $(this).children('a').children('img').animate({ height: '130', left: '-10', top: '-10', width: '192'}, 100);
        $(this).children('a').children('span.dark-background').fadeOut(200);
    });
});
(function () {
    var Main;
    Main = function () {
        function Main() {
            this.pickHangers();
        }
        Main.prototype.pickHangers = function () {
            return $('ul[class*=-block-grid-').each(function (_this) {
                return function (i, el) {
                    var $liLastRow, $lis, $ul, length, multiplier, re, remainder, rowCount, str, width;
                    $ul = $(el);
                    $lis = $ul.find('li');
                    str = $ul.attr('class');
                    re = /\w+\-block\-grid\-(\d+)\b/i;
                    rowCount = str.match(re)[1];
                    length = $lis.length;
                    remainder = length % rowCount;
                    if (remainder > 0) {
                        $liLastRow = $($lis.slice(-remainder));
                        multiplier = rowCount - remainder;
                        width = _this.getWidthPercentage($lis, multiplier);
                        return $liLastRow.first().css({ 'margin-left': width + '%' });
                    }
                };
            }(this));
        };
        Main.prototype.getWidthPercentage = function ($el, n) {
            var parentWidth, percent, width;
            width = $el.outerWidth() * n;
            parentWidth = $el.parent().outerWidth();
            return percent = 100 * (width / parentWidth) / 2;
        };
        return Main;
    }();
    $(function () {
        var main;
        return main = new Main();
    });
}.call(this));

$(document).foundation({
  equalizer : {
    // Specify if Equalizer should make elements equal height once they become stacked.
    equalize_on_stack: true
    // Allow equalizer to resize hidden elements
    // act_on_hidden_el: true
  }
});

var stickySidebar = $('.sticky');

if (stickySidebar.length > 0) {
  var stickyHeight = stickySidebar.height(),
      sidebarTop = stickySidebar.offset().top;
}

// on scroll move the sidebar
$(window).scroll(function () {
  if (stickySidebar.length > 0) {
    var scrollTop = $(window).scrollTop();

    if (sidebarTop < scrollTop) {
      stickySidebar.css('top', scrollTop - sidebarTop);

      // stop the sticky sidebar at the footer to avoid overlapping
      var sidebarBottom = stickySidebar.offset().top + stickyHeight,
          stickyStop = $('.main-content').offset().top + $('.main-content').height();
      if (stickyStop < sidebarBottom) {
        var stopPosition = $('.main-content').height() - stickyHeight;
        stickySidebar.css('top', stopPosition);
      }
    }
    else {
      stickySidebar.css('top', '0');
    }
  }
});

$(window).resize(function () {
  if (stickySidebar.length > 0) {
    stickyHeight = stickySidebar.height();
  }
});

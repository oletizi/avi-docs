
$(document).ready(function () {
    var cookieName = 'expandable-nav-v1.1';

    function setActive() {
        var url = window.location;
        var parser = document.createElement('a');
        parser.href = url;
        var fullPath = parser.pathname;
        var shortPath = fullPath.replace(/\/$/, "");

        $('ul#expandable-nav a[href="' + fullPath + '"]').parent().addClass('active');
        $('ul#expandable-nav a[href="' + shortPath + '"]').parent().addClass('active');
    }

    function getExpanded() {
        var tmp = Cookies.getJSON(cookieName);
        var expanded;
        if (!Array.isArray(tmp)) {
            expanded = [];
        } else {
            expanded = tmp;
        }
        return expanded;
    }

    function containsObject(list, obj) {
        var i;
        for (i = 0; i < list.length; i++) {
            if (list[i] === obj) {
                return true;
            }
        }
        return false;
    }

    setActive();

    var expanded = getExpanded();

    if (Array.isArray(expanded)) {
        $("#expandable-nav .collapse").removeClass('in');
        for (var i = 0; i < expanded.length; i++) {
            $(expanded[i]).collapse("show");
        }
    }

    $("[data-toggle='collapse']").on("click", function () {
        var dataTarget = this.attributes['data-target'].value;
        var tmp = Cookies.getJSON(cookieName);
        var expanded;
        if (!Array.isArray(tmp)) {
            expanded = [];
        } else {
            expanded = tmp;
        }
        var index = expanded.indexOf(dataTarget);
        if (index >= 0) {
            // remove it
            expanded.splice(index, 1);
        } else {
            // add it
            expanded.push(dataTarget);
        }
        Cookies.set(cookieName, expanded);
    });
});
$ -> 
    $('#menu-trigger').click -> 
        if $('#menu').is(':visible')
            $('#menu-trigger').css('color', '#FF5252')
            $('#menu-trigger span').attr('class', 'glyphicon glyphicon-menu-hamburger');
            $('#menu').hide();
        else
            $('#menu-trigger').css('color', '#FFF')
            $('#menu-trigger span').attr('class', 'glyphicon glyphicon-remove');
            $('#menu').show();

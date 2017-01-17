function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
        $('.g-signin2').css('visibility', 'visible');
        $('#profile-display').css('visibility', 'hidden');
    });
}
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    $(document).ready(function () {
        console.log("Populating profile info...");
        $('#profile-display')
            .prepend('<p><a href="#" onClick="signOut();">Sign out &rsaquo;</a></p>')
            .prepend('<p>You are logged in as ' + profile.getEmail() + '</p>')
            .prepend('<p>Hello, ' + profile.getGivenName() + '.</p>')
        ;
        $('.g-signin2').css('visibility', 'hidden');
    });
    if (profile.getEmail().endsWith("avinetworks.com")) {
        var app = new annotator.App();
        app.include(annotator.identity.simple);
        app.include(annotator.ui.main);
        app.include(annotator.storage.http, {
            prefix: '/annotator-store/1.0'
        });

        app.start().then(function () {
            app.annotations.load("q=" + encodeURIComponent(window.location.pathname));
            app.ident.identity = profile.getEmail();
            console.log("identity: " + app.ident.identity);
        });

    }
}


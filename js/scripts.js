window.addEventListener('message', function(event) {
    var data = event.data;

    //Show notification
    if (data.action === 'showNotification') {
        document.getElementById('notificationText').innerText = data.message;
        document.getElementById('notification').style.display = 'block';

        //Hide the notification after a few seconds
        setTimeout(function() {
            document.getElementById('notification').style.display = 'none';
        }, 5000);
    }
});
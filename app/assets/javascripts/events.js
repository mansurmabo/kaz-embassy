$(document).ready(function() {
    $('#calendar').fullCalendar({
        eventSources: [
            {
                url: '/events.json'
            }
        ],
        header: {
            left: 'prevYear, prev,',
            center: 'title',
            right: 'next, nextYear'
        },
        defaultView: 'month',
        editable: false,
        timezone: "UTC"
    });
});
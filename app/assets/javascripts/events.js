$(document).ready(function() {
    $('#calendar').fullCalendar({
        eventSources: [
            {
                url: '/events.json'
            }
        ],
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        editable: false,
        timezone: "UTC"
    });
});
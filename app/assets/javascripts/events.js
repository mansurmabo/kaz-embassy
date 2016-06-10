$(document).ready(function () {
    var lang = window.location.href.toString().split('/')[3];
    if (lang == 'kz') {
        $('#calendar').fullCalendar({
            eventSources: [
                {
                    url: "events.json"
                }
            ],
            header: {
                left: 'prevYear, prev,',
                center: 'title',
                right: 'next, nextYear'
            },
            monthNames: ["Қаңтар", "Ақпан", "Наурыз", "Сәуір", "Мамыр", "Маусым", "Шілде", "Тамыз", "Қыркүйек", "Қазан", "Қараша", "Желтоқсан"],
            monthNamesShort: ['Қаң', 'Ақп', 'Нау', 'Сәу', 'Мам', 'Мау', 'Шіл', 'Там', 'Қыр', 'Қаз', 'Қар', 'Жел'],
            dayNames: ['Дүйсенбі', 'Сейсенбі', 'Сәрсенбі', 'Бейсенбі', 'Жұма', 'Сенбі', 'Жексенбі'],
            dayNamesShort: ['Дс', 'Сс', 'Ср', 'Бс', 'Жм', 'Сн', 'Жк'],
            defaultView: 'month',
            editable: false,
            timezone: "UTC"

        });
    } else {
        $('#calendar').fullCalendar({
            eventSources: [
                {
                    url: "events.json"

                }
            ],
            header: {
                left: 'prevYear, prev,',
                center: 'title',
                right: 'next, nextYear'
            },
            lang: lang,
            defaultView: 'month',
            editable: false,
            timezone: "UTC"

        });
    }
});

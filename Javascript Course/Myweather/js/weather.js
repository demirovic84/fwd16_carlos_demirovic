// Docs at http://simpleweatherjs.com
//First weather API approach using simpleweather code & settings.

//################################################################//
//################### TOP PAGE. YOUR LOCATION INFORMATION ################//
//################################################################//

//Your position. Show/Hide
if ("geolocation" in navigator) {
  $('.js-geolocation').show();
} else {
  $('.js-geolocation').hide();
}

navigator.geolocation.getCurrentPosition(function (position) {
    loadWeather(position.coords.latitude + ',' + position.coords.longitude);
});



function loadWeather(location, woeid) {
  $.simpleWeather({
        location: location,
        woeid: woeid,
        unit: 'c',
        success: function (weather) {

            if (weather.temp < 10) {
        $('#weather1').css("background-image", "url(img/fall.jpg)");
            } else {
        $('#weather1').css("background-image", "url(img/parisSummer.jpg)");
            }
          //Icon + temp + unit.  <--- THIS TOOK ME LIKE FOREVER TO SOLVE WITHH THE ICONS.
          html = '<h2><i class="wi wi-yahoo-' + weather.code + '"></i> ' + weather.temp + '&deg;' + weather.units.temp + '</h2>';
          //Location.
          html += '<ul class="ulcity"><li class="cityyy">' + 'Your position:' + ' ' + weather.city + '</li></ul>';
          //Weather condition
          html += '<ul><li>' + weather.currently + '</li>';
          //Wind speed + km/h.
          html += '<li>' + 'Wind:' + ' ' + weather.wind.speed + ',' + weather.units.speed + '</li>';
          //Sunris + Sunset.
          html += '<li>' + 'Sunrise:' + ' ' + weather.sunrise + '</li>';
          html += '<li>' + 'Sunset:' + ' ' + weather.sunset + '</li></ul>';

            var timestamp = moment(weather.updated);
          html += '<p class="updated">Updated ' + moment(timestamp).fromNow() + '</p>';

      $("#weather1").html(html);
        },
        error: function (error) {
      $("#weather1").html('<p>' + error + '</p>');
        }
    });
}

//################################################################//
//################### MID PAGE. PICKED LOCATIONS. ################//
//################################################################//

//##### Location 1. #####//
  $.simpleWeather({
        //New york id.
    woeid: '2459115',
    location: 'new york',
    unit: 'c',
    success: function (weather) {
        if (weather.temp < 10) {
            $('#weather').css("background-image", "url(img/newyorkWinter.jpg)");
        } else {
            $('#weather').css("background-image", "url(img/newyorkSummer.jpg)");
        }
          //Icon + temp + unit.
          html = '<h2><i class="wi wi-yahoo-' + weather.code + '"></i> ' + weather.temp + '&deg;' + weather.units.temp + '</h2>';
          //Location.
          html += '<ul class="ulcity"><li class="cityyy">' + ' ' + weather.city + '</li></ul>';
          //Weather condition
          html += '<ul><li>' + weather.currently + '</li>';
          //Wind speed + km/h.
          html += '<li>' + 'Wind:' + ' ' + weather.wind.speed + ',' + weather.units.speed + '</li>';
          //Sunris + Sunset.
          html += '<li>' + 'Sunrise:' + ' ' + weather.sunrise + '</li>';
          html += '<li>' + 'Sunset:' + ' ' + weather.sunset + '</li></ul>';



          //Forecast for several days ahead.
          //       for(var i=0;i<weather.forecast.length;i++) {
          //     html += '<p>'+weather.forecast[i].day+': '+weather.forecast[i].high+'</p>';
          //   }

        var timestamp = moment(weather.updated);
          html += '<p class="updated">Updated ' + moment(timestamp).fromNow() + '</p>';

      $("#weather").html(html);
    },
    error: function (error) {
      $("#weather").html('<p>' + error + '</p>');
    }
});


//##### Location 2. #####//
  $.simpleWeather({
        //Paris id.
    woeid: '615702',
    location: 'Paris',
    unit: 'c',
    success: function (weather) {
        if (weather.temp < 10) {
        $('#weather2').css("background-image", "url(img/parisWinter.jpg)");
        } else {
        $('#weather2').css("background-image", "url(img/parisSummer.jpg)");
        }
          //Icon + temp + unit.
          html = '<h2><i class="wi wi-yahoo-' + weather.code + '"></i> ' + weather.temp + '&deg;' + weather.units.temp + '</h2>';
          //Location.
          html += '<ul class="ulcity"><li class="cityyy">' + ' ' + weather.city + '</li></ul>';
          //Weather condition
          html += '<ul><li>' + weather.currently + '</li>';
          //Wind speed + km/h.
          html += '<li>' + 'Wind:' + ' ' + weather.wind.speed + ',' + weather.units.speed + '</li>';
          //Sunris + Sunset.
          html += '<li>' + 'Sunrise:' + ' ' + weather.sunrise + '</li>';
          html += '<li>' + 'Sunset:' + ' ' + weather.sunset + '</li></ul>';


        var timestamp = moment(weather.updated);
          html += '<p class="updated">Updated ' + moment(timestamp).fromNow() + '</p>';

      $("#weather2").html(html);
    },
    error: function (error) {
      $("#weather2").html('<p>' + error + '</p>');
    }
});

//##### Location 3. #####//

$.simpleWeather({
        //Paris id.
    woeid: '',
    location: 'Stockholm',
    unit: 'c',
    success: function (weather) {
        if (weather.temp < 10) {
        $('#weather3').css("background-image", "url(img/stockholmWinter.jpg)");
        } else {
        $('#weather3').css("background-image", "url(img/stockholmSummerjpg)");
        }
          //Icon + temp + unit.
          html = '<h2><i class="wi wi-yahoo-' + weather.code + '"></i> ' + weather.temp + '&deg;' + weather.units.temp + '</h2>';
          //Location.
          html += '<ul class="ulcity"><li class="cityyy">' + ' ' + weather.city + '</li></ul>';
          //Weather condition
          html += '<ul><li>' + weather.currently + '</li>';
          //Wind speed + km/h.
          html += '<li>' + 'Wind:' + ' ' + weather.wind.speed + ',' + weather.units.speed + '</li>';
          //Sunris + Sunset.
          html += '<li>' + 'Sunrise:' + ' ' + weather.sunrise + '</li>';
          html += '<li>' + 'Sunset:' + ' ' + weather.sunset + '</li></ul>';


        var timestamp = moment(weather.updated);
          html += '<p class="updated">Updated ' + moment(timestamp).fromNow() + '</p>';

      $("#weather3").html(html);
    },
    error: function (error) {
      $("#weather3").html('<p>' + error + '</p>');
    }
});

//##### Location 4. #####//

$.simpleWeather({
        //Paris id.
    woeid: '',
    location: 'Sydney',
    unit: 'c',
    success: function (weather) {
        if (weather.temp < 10) {
            $('#weather4').css("background-image", "url(img/sydneyWinter.jpg)");
        } else {
            $('#weather4').css("background-image", "url(img/SydneySummer.jpg)");
        }
          //Icon + temp + unit.
          html = '<h2><i class="wi wi-yahoo-' + weather.code + '"></i> ' + weather.temp + '&deg;' + weather.units.temp + '</h2>';
          //Location.
          html += '<ul class="ulcity"><li class="cityyy">' + ' ' + weather.city + '</li></ul>';
          //Weather condition
          html += '<ul><li>' + weather.currently + '</li>';
          //Wind speed + km/h.
          html += '<li>' + 'Wind:' + ' ' + weather.wind.speed + ',' + weather.units.speed + '</li>';
          //Sunris + Sunset.
          html += '<li>' + 'Sunrise:' + ' ' + weather.sunrise + '</li>';
          html += '<li>' + 'Sunset:' + ' ' + weather.sunset + '</li></ul>';


        var timestamp = moment(weather.updated);
          html += '<p class="updated">Updated ' + moment(timestamp).fromNow() + '</p>';

      $("#weather4").html(html);
    },
    error: function (error) {
        $("#weather4").html('<p>' + error + '</p>');
    }
});




// Docs at http://openweathermap.com
//Second weather API approach using openweathermap code & settings for location search.

//################################################################//
//####### BOTTOM PAGE. Search function for location + weather. #####//
//################################################################//

var btn = document.getElementById("btn");
    
//Hiding results before search.
$("#resHide").hide();

btn.addEventListener("click", function () {
    $("#resHide").show();

    var url = "http://api.openweathermap.org/data/2.5/weather?q=";
    var city = document.getElementById("city").value;
    var appId = "&appid=09e27585e120575e42ad8b3d7275e3aa&units=metric";
    var urlString = url + city + appId;

        $.getJSON(urlString, function (data) {
        $(".city_country").html(data.name);
        $(".cloud").html(data.weather[0].description);
        $(".wind_speed").html(JSON.stringify(Math.floor(data.wind.speed)) + " miles per hour");
        $(".temperature_").html(JSON.stringify(Math.floor(data.main.temp)) + " &deg;" + 'c');

        //Effect on button click.
        $("#btn").effect("highlight", {color: "darkturquoise"}, 2000);


    });
});

//My custom "alertBox".
    $('#btn').click(function () {
    if ($('#city').val() === '') {
    $("#alert").fadeIn().effect("highlight", {color: "coral"}, 1600).fadeOut();
//Hiding results if emty
    $("#resHide").hide();

    }
});

//Press enter on keyboard instead of searchbutton after input for result.
    $("#city").keyup(function (event) {
    if (event.keyCode === 13) {
        $("#btn").click();
    }
});

//A different approach on Mouse enter & mouseleave on search-button.
    $('#btn').hover(
    function () {
    // MOUSE ENTER
    $("#btn").css({background: 'darkturquoise', color: 'black'});

    },
    function () {
    // MOUSE LEAVE
    $("#btn").css({background: 'white', color: 'black'});

    }
);

$("a[href='#top']").click(function () {
  $("html, body").animate({scrollTop: 0}, "slow");
});


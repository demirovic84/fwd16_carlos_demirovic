/*global
google
$
*/



function initMap() {
    'use strict';
    var mapOptions = {
        center: new google.maps.LatLng(55.600997, 13.003240),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoom: 18,
        zoomControl: true,
        panControl: true,
        scaleControl: true,
        streetViewControl: true
    };



    var myMap = new google.maps.Map($("#map")[0], mapOptions);
    var pinLocation = new google.maps.LatLng(55.600997, 13.003240);

    var startPosition = new google.maps.Marker({
        position: pinLocation,
        map: myMap,
        draggable: true,
        icon: "marker.png",
        animation: google.maps.Animation.DROP
    });

    var contentString = '<div id="content">' +
            '<div id="siteNotice">' +
            '</div>' +
            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
            '<div id="bodyContent">' +
            '<p><b>KYH</b>, bedriver eftergymnasiala Yrkeshögskoleutbildningar (YH-utbildningar), godkända och kvalitetssäkrade av Myndigheten för yrkeshögskolan.' +
            '<br></br>' +
            '<p>KYH har idag skolor i Stockholm, Göteborg och Malmö. Till hösten kommer närmare 700 studerande att läsa vid någon av KYH:s utbildningar.' +
            '<p>Hemsida: <a href="http://www.kyh.se" target="_blank">' +
            'http://www.kyh.se </a> ' +
            '</div>' +
            '</div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
        startPosition.addListener('click', function () {
        infowindow.open(myMap, startPosition);
    });
}

$(function () {
    'use strict';
    var source = "https://maps.googleapis.com/maps/api/js?key=AIzaSyD3bisqd83LnJOB8e3sFAlO4P4cMXOG72g&callback=initMap";
    $("body").append("<script src = " + source + "></script>");
});






/*var price;
var sale;

price = prompt("Enter price");
var sale = price * 0.8;
console.log(sale);*/

/*var myArray = [];
var myString;

myString = prompt("Enter 5 numbers");
myArray = myString.split(",");

if (myString === null){
    prompt("ENTER SOME FUCKING NUMBERS");

}*/

/*
var myArray = [];
var myArrayNum = [];
var mytring;
var i;
var j;
var temp;

mytring = prompt("Enter ten numbers spereated by ommas");
myArray = mytring.split(",");

for (i = 0; i< 10; i = i +1){
    myArrayNum[i] = Number(myArray[i]);
}

for (i = 0; i < 10; i = i + 1) {
    for(j = 0; j < 10; j = j+1) {
        if(myArrayNum[j] > myArrayNum[j +1]) {
            temp = myArrayNum[j];
            myArrayNum[j] = myArrayNum[j +1];
            myArrayNum[j +1] = temp;
        }
    }
}

for */

/*
function myMessage() {
    var userName = prompt("Enter your name");
    alert("Hello" + userName + ". This is a function");
}
myMessage();
*/

/*function getArea(width, height){
    alert("Area = " + width * height);
}

getArea(10, 2);
*/


/*function getSize(width, height, depth) {
    "use strict";
    var area = width * height;
    var volume = width * height * depth;
    var sizes = [area, volume];
    return sizes;
}

function displayResult() {
    "use strict";
    var areaOne = getSize(3, 2, 4)[0];
    var volumeOne = getSize(3, 2, 4)[1];
    alert("Your area = " + areaOne + ", your volume = " + volumeOne);
}

displayResult();
*/




/*Visar randon nummer mellan 0 -100*/
/*
function getRandomInt(min, max) {
    "use strict";
    if (max < min) {
        [min, max] = [min, max];
    }

    let range = max - min + 1;
    return Math.floor(Math.random() * range) + min;
}

let values = Array.from({length: 10}, () => getRandomInt(0, 100));

console.log(values);
*/

// ######## Question 1 ########
/*
var cat = {
    name: "Lasse",
    age: 4,
    fur: "grey/white tiger"
};


cat.eyes = "green";
cat.age = 5;


var x;
for (x in cat) {
    console.log(x + " " + cat[x]);
}
*/
//######## Question 1 ########


// ######## Question 2 ########
/*
var arr = ["matches", "knife", "accelerant", "cedar wood", "stick", "tinder plug"];
var obj = {};
var i = 0;
for (i = 0; i < arr.length; i = i + 1) {
    obj[arr[i]] = 0;
}
console.log(obj);
*/
//######## Question 2 ########


//######## Question 3 ########
/*var person = {
    name: "carlos",
    weight: 85,
    eatDoritos: 0.5,
    fatty: function() {
        return this.weight + this.eatDoritos + " kg";
    }

};
console.log(person.fatty());
*/
//######## Question 3 ########


//######## Question 4 ########


//######## Question 4 ########


/*
function Dog(breed, name, colour, bark) {

this.breed = breed;

this.dogName = name;

this.colour = colour;

this.bark = bark;



}

var dog1 = new Dog("Bulldog", "Bruce", "white", "MJAU");

console.log("Name: " + dog1.dogName, "Breed: " + dog1.breed, "Colour " + dog1.colour, dog1.bark);

*/

//Regular expressions

//Question 1
//Uppercase to lowercase
/*
var string = "LETS TRY THIS OUT NOW!!",
    regex = /\b[A-Z]{2,}\b/g;

var modified = string.replace(regex, function (match) {
    "use strict"
    return match.toLowerCase();
});

console.log(modified);
alert(modified);
*/

//Question 4
//Q = Valid swedish postcode (5 digits)
//var string1 = prompt("Enter your numbers");
//var myString = string1.replace(/\D/g, "");

//console.log(myString);



/*
//Question 3
// Q = Enter a valid creditcardnumber (13 digits)

myString = prompt("Enter your creditcard number");

var re = /^4[0-9]{12}(?:[0-9]{3})?$/;

if (re.test(myString)) {

alert("OK! Yoy are ready to shop");
console.log("OK! Yoy are ready to shop");

} else {

alert("Not a valid creditcar number, go home");
console.log("Not a valid creditcar number, go home");

}
*/

/*
//Question 4
//Q = Valid swedish postcode (5 digits)
myPostcode = prompt("Enter your postcode");

var code = /^\d{5}$/;

if (code.test(myPostcode)) {


alert("Great, valid postcode");
console.log("Great, valid postcode");

} else {

alert("Not a valid postcode");
console.log("Not a valid postcode");


}
*/


/*global
window
*/

var memory_array = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H', 'I', 'I', 'J', 'J', 'K', 'K', 'L', 'L'];
var memory_values = [];
var memory_tile_ids = [];
var tiles_flipped = 0;
var pairs = 0;
var tries = 0;
//Displays on start. Reason is to Show Pairs/Tries:0
document.getElementById('pairs').innerHTML = "Pairs: 0";
document.getElementById('tries').innerHTML = "Tries: 0";

function flip2Back() {
    "use strict";
    // Flip the 2 tiles back over
    var tile_1 = document.getElementById(memory_tile_ids[0]);
    var tile_2 = document.getElementById(memory_tile_ids[1]);

    tile_1.style.background = 'url(img/masha.png) no-repeat';
    tile_1.innerHTML = "";
    tile_2.style.background = 'url(img/masha.png) no-repeat';
    tile_2.innerHTML = "";
    // Clear both arrays
    memory_values = [];
    memory_tile_ids = [];
}

function newBoard() {
    'use strict';
    tiles_flipped = 0;
    var output = '';
    var i;
    memory_array.memory_tile_shuffle();
    for (i = 0; i < memory_array.length; i = i + 1) {
        output += '<div id="tile_' + i + '" onclick="memoryFlipTile(this,\'' + memory_array[i] + '\')"></div>';
    }
    document.getElementById('memory_board').innerHTML = output;
}

function myFunction() {
    "use strict";
    newBoard();
    document.getElementById('pairs').innerHTML = "Pairs: 0";
    document.getElementById('tries').innerHTML = "Tries: 0";
}

document.getElementById("myBtn").addEventListener("click", myFunction);

window.addEventListener("load", newBoard);

//Randomizing the tiles
Array.prototype.memory_tile_shuffle = function () {
    'use strict';
    var dev = document.getElementById('dev');
    var i = this.length, j, temp;
    while (i > 0) {
        i = i - 1;
        dev.innerHTML += "Affecting index position " + i + " of the array";
        dev.innerHTML += "--- Generate a random number ranging between 0 and i+";
        j = Math.floor(Math.random() * (i + 1));
        dev.innerHTML += "--- Generated: " + j;
        dev.innerHTML += "Swap values found at index " + i + " and index " + j + "<br>";
        temp = this[j];
        this[j] = this[i];
        this[i] = temp;
    }
};

//Turning tiles
function memoryFlipTile(tile, val) {
    "use strict";
    if (tile.innerHTML === "" && memory_values.length < 2) {
        tile.style.background = '#FFF';
        tile.innerHTML = val;
        if (memory_values.length === 0) {
            memory_values.push(val);
            memory_tile_ids.push(tile.id);
        } else if (memory_values.length === 1) {
            memory_values.push(val);
            memory_tile_ids.push(tile.id);
            tries += 1;
                //Displays tries
            document.getElementById('tries').innerHTML = "Tries:" + " " + tries;
            if (memory_values[0] === memory_values[1]) {
                tiles_flipped += 2;
                pairs += 1;
                //Displays pairs
                document.getElementById('pairs').innerHTML = "Pairs:" + " " + pairs;




                // Clear both arrays
                memory_values = [];
                memory_tile_ids = [];
                // Check to see if the whole board is cleared
                if (tiles_flipped === memory_array.length) {
                    document.getElementById('memory_board').innerHTML = "";
                    alert("You made it! Play agin.");
                    newBoard();
                }
            } else {
                setTimeout(flip2Back, 500);
            }
        }
    }
}


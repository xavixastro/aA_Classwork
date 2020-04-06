class Clock {
    constructor() {
        // 1. Create a Date object.
        let date = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hour = date.getHours();
        this.minute = date.getMinutes();
        this.second = date.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        let timeString = `${("0" + this.hour).slice(-2)}:${("0" + this.minute).slice(-2)}:${("0" + this.second).slice(-2)}`;
        // Use console.log to print it.
        console.log(timeString);
    }

    _tick() {
        // 1. Increment the time by one second.
        this.second++;
        if (this.second === 60){
            this.second = 0;
            this.minute++;
            if (this.minute === 60){
                this.minute = 0;
                this.hour++;
                if (this.hour === 24){
                    this.hour = 0;
                }
            }
        }
        // 2. Call printTime.
        this.printTime();
    }
}

// const clock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
    if (numsLeft === 0){
        reader.close();
        return completionCallback(sum);
    }
    numsLeft--;
    reader.question('Please enter a number:', (res) => {
        num = parseInt(res);
        sum += num;
        console.log(`Current sum is ${sum}.`);
        addNumbers(sum, numsLeft, completionCallback);
    })
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


function askIfGreaterThan(el1, el2, callback){
    reader.question(`Is ${el1} greater than ${el2}?`, (res) => {
        if (res === "yes") {
            callback(true);
        }
        else {
            callback(false);
        }
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
    if (i === arr.length - 1){
        return outerBubbleSortLoop(madeAnySwaps);
    }
    askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan){
        if (isGreaterThan){
            [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
            madeAnySwaps = true;
        }
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop)
    })
}

function absurdBubbleSort(arr, sortCompletionCallback){
    function outerBubbleSortLoop(madeAnySwaps){
        if (madeAnySwaps === true){
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
        }else{
            return sortCompletionCallback(arr);
        }
    }
    outerBubbleSortLoop(true)
}


absurdBubbleSort([5, 1, 2, 7, 3, 6], (arr) => {
    console.log('Sorting completed');
    reader.close();
    console.log(arr);
} );

Function.prototype.myBind = function (context) {
    banana = this
    debugger
    return () => { this.apply(context) }
}


class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}

const turnOn = function () {
    console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
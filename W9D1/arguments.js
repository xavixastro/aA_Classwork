// function sum(){
//     let numsArray = Array.from(arguments);
//     let sum = 0;
//     numsArray.forEach(el => {
//         sum += el;
//     })
//     return sum;
// }

function sum(...args) {
    let numsArray = args;
    let sum = 0;
    numsArray.forEach(el => {
        sum += el;
    })
    return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

Function.prototype.myBind = function(){
    // console.log(this);
    // console.log(arguments);
    let that = this;
    let args = Array.from(arguments);
    let newContext = args[0];
    args = args.slice(1);
    // console.log(args);
    // newContext.says(args[1], args[2]);
    if (args.length === 1) {
        return function(...callTimeArgs){
            // let newArgs = args.concat(callTimeArgs);
            // that.call(newContext, ...newArgs);
            that.call(newContext, args[0], callTimeArgs[0]);
        }
    }
    else if (args.length > 1) {
        return function(){
        that.call(newContext, ...args );
    }}
    else{
        return function (...callTimeArgs) {
        that.call(newContext, ...callTimeArgs );
    }
    }
}


const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");



// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// markov.says.myBind(pavlov)("meow", "me")
// Pavlov says meow to me!
// true

function curriedSum(numArgs){
    let nums = [];
    // for (let i = numArgs; i > 0; i--){
        function _curriedSum(ele){
            nums.push(ele);
            if (nums.length === numArgs){
                let result = nums.reduce(function (a, b) {
                        return a + b;
                 })
                return result;
            }
            else{
                return _curriedSum;
            }
        }
    // }
    return _curriedSum;
}

const sumCurried = curriedSum(4);
console.log(sumCurried(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
    let arr = [];
    that = this;
    let _curry = function (ele) {
        arr.push(ele);
        if (arr.length === numArgs) {
            return that(...arr);
        }
        else {
            return _curry;
        }
    }
    return _curry;
}
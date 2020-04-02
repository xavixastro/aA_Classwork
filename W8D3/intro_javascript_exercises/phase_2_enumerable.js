Array.prototype.myEach = function(cb) {
    for (let i = 0; i < this.length; i++) {
        cb(this[i]);
    }
}


Array.prototype.myMap = function(cb) {
    let newArr = [];
    this.myEach(function (el){
        newArr.push(cb(el));
    })
    return newArr;
}


Array.prototype.myReduce = function(cb, initialValue = null) {
    let newArr = this;
    if (initialValue === null) {
        initialValue = this[0];
        newArr = this.slice(1);
    }
    let acc = initialValue;
    newArr.myEach(function(el){
        acc = cb(acc, el);
    })
    return acc;
}










// Array.prototype.myEach = function (callback) {
//     for(let i = 0; i < this.length; i++) {
//         callback(this[i])
//     }
// }

// Array.prototype.myMap = function (callback) {
//     let result = [];

//     this.myEach( function (el) {
//         result.push(callback(el))
//     })

//     return result;
// }

// Array.prototype.myReduce = function (callback, initialValue = null) {
//     let accum;
//     let newArray;
    
//     if (initialValue === null) {
//         accum = this[0];
//         newArray = this.slice(1);
//     } else {
//         accum = initialValue;
//         newArray = this;
//     }

        
//         newArray.myEach( function (ele) {
//             accum = callback(accum, ele);
//     })

//     return accum;
    
// }








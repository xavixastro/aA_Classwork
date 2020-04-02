Array.prototype.unique = function() {
    let newArr = [];
    for (let i = 0; i < this.length; i++) {
        if (!newArr.includes(this[i])) {
            newArr.push(this[i])
        }
    }
    return newArr
}


Array.prototype.twoSum = function(){
    let result = [];
    for (let i = 0; i < this.length-1; i++) {
        for (let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                result.push([i, j])
            }
        }
    }
    return result;
}



Array.prototype.transpose = function(){
    let newArr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            if (i === 0) {
                newArr.push([this[i][j]])
            }
            else {
                newArr[j].push(this[i][j]);
            }
        }
    }
    return newArr;
}





// Array.prototype.uniq = function () {
//     let result = [];
//     for(let i = 0; i < this.length; i++) {
//         if (!result.includes(this[i])) {
//             result.push(this[i]);
//         }
//     }
//     return result;
// }

// Array.prototype.twoSum = function() {
//     let result = [];
//     for (let i = 0; i < this.length; i++) {
//         for(let j = i + 1; j < this.length; j++) {
//             if (this[i] + this[j] === 0) {
//                 result.push([i, j]);
//             }
//         }
//     }
//     return result;
// }


// Array.prototype.transpose = function() {
//     let result = [[], []];
//     for (let i = 0; i < this.length; i++) {
//         for(let j = 0; j < this.length; j++) {
//             result[i].push(this[j][i]);
//         }
//     }
//     return result;
// }
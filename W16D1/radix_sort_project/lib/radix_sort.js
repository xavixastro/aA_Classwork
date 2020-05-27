const getDigitFrom = (num, place) => {
    return Math.floor(num / Math.pow(10, place-1)) % 10;
}

const getIntLength = (num) => {
    return num.toString().length
}

const getMaxDigits = (nums) => {
    let max = 0;
    nums.forEach (num => {
        max = Math.max(max, getIntLength(num))
    })
    return max;
}

function radixSort(arr) {
    if (!Array.isArray(arr)) return null;

    let max = getMaxDigits(arr);
    for (k = 0; k < max; k++) {
        let buckets = Array.from({length:10}, () => [])
        for (i = 0; i < arr.length; i++) {
            let digit = getDigitFrom(arr[i], k+1)
            buckets[digit].push(arr[i])
        }
        arr = [].concat(...buckets)
    }

    return arr;

}

module.exports = {
    radixSort
};
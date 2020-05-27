function countingSort(arr, max) {
    let buckets = new Array(max+1).fill(0);

    arr.forEach(el => {
        buckets[el]++;
    })

    let newArr = new Array();

    buckets.forEach ((bucket, i) => {
        while (bucket > 0) {
            newArr.push(i)
            bucket--;
        }
    })

    return newArr;
}


module.exports = {
    countingSort
};
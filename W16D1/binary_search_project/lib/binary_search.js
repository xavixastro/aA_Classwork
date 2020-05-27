function binarySearch(array, target) { 
    if (!array.length) return false;

    let midIdx = Math.floor(array.length / 2); 
    let midEle = array[midIdx]; 

    if (midEle < target) {
        return binarySearch(array.slice(midIdx+1), target) 
    } else if (midEle > target) {
        return binarySearch(array.slice(0, midIdx), target);
    } else {
        return true
    }

}

function binarySearchIndex(array, target) { //[5,3,2,7,6] target == 6
    if (!array.length) return -1;

    let midIdx = Math.floor(array.length / 2);
    let midEle = array[midIdx];

    if (midEle < target) {
      let val = binarySearchIndex(array.slice(midIdx + 1), target);
      return (val === -1) ? -1 : midIdx + 1 + val;
    } else if (midEle > target) {
      return binarySearchIndex(array.slice(0, midIdx), target);
    } else {
      return midIdx;
    }
}


module.exports = {
    binarySearch,
    binarySearchIndex
};
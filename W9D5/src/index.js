const DOMNodeCollection = require('./dom_node_collection.js');
Window.prototype.$l = function(selector){
    if (selector instanceof HTMLElement) { // <li></li> 
        let arr = [];
        arr.push(selector);
        return new DOMNodeCollection(arr);
    } else if (typeof selector === "string"){ // "p"
        let s = document.querySelectorAll(selector);
        return new DOMNodeCollection(Array.from(s));
    }

};


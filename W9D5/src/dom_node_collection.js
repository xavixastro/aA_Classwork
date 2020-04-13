function DOMNodeCollection(arr) {
    this.arr = arr;


}

DOMNodeCollection.prototype.html = function(arg){ // <ol> orange</ol>
    if (arg !== undefined){
        this.arr.forEach(el => {
            el.innerHTML = arg;
        })
    }else{
        return this.arr[0].innerHTML;
    }
};

DOMNodeCollection.prototype.empty = function() {
    this.arr.forEach(el => {
      el.innerHTML = "";
    });
};
//$( ".inner" ).append( "<p>Test</p>" );

DOMNodeCollection.prototype.append = function(args) {
    if (args instanceof DOMNodeCollection) {
        this.arr.forEach( el => {
            debugger
            for (let i = 0; i < args.length; i++) {     
                el.innerHTML += args[0].outerHTML;
            }
        });
    } else if (args instanceof HTMLElement) {
      this.arr.forEach(el => {
            el.innerHTML += args.innerHTML;
      });
    } else if (typeof args === "string"){
        this.arr.forEach(el => {
            el.innerHTML += args; 
        });
    }

};


module.exports = DOMNodeCollection;

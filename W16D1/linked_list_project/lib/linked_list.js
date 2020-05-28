// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val, 
        this.next = null
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null, 
        this.tail = null, 
        this.length = 0
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        let node = new Node(val);
        if (!this.length) {
            this.head = node;
            this.tail = node;
        } else {
            this.tail.next = node;
            this.tail = node;
        }
        this.length++;
        return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
        if (!this.length) return undefined;

        let removedNode;

        if (this.length === 1) {
            removedNode = this.tail;
            this.head = null;
            this.tail = null;
        } else{
            let node = this.head;
            while (node.next !== this.tail) {
                node = node.next;
            }
            removedNode = node.next;
            node.next = null;
            this.tail = node;
        }
        this.length--;
        return removedNode;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        let node = new Node(val);
        if (!this.length) {
            this.head = node;
            this.tail = node;
        } else {
            node.next = this.head;
            this.head = node;
        }
        this.length++;
        return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (!this.length) return undefined;

        let removedNode;

        removedNode = this.head;
        if (this.length === 1) {
          this.head = null;
          this.tail = null;
        } else {         
          this.head = this.head.next;
        }
        this.length--;
        return removedNode;
    }

    // TODO: Implement the contains method here
    contains(target) {
        let node = this.head
        while (node) {
            if (node.value === target) return true;
            node = node.next
        }
        return false;
    }

    // TODO: Implement the get method here
    get(index) {
        if (index < 0 || index >= this.length) return null;

        let node = this.head;
        for (let i = 0; i < this.length; i++) {
            if (index === i) return node;
            node = node.next;
        }
    }

    // TODO: Implement the set method here
    set(index, val) {
        if (index < 0 || index >= this.length) return false;

        let node = this.head;
        for (let i = 0; i < this.length; i++) {
            if (index === i) {
                node.value = val;
                return true;
            }
            node = node.next;
        }
    }

    // TODO: Implement the insert method here
    insert(index, val) {
        if (index < 0 || index >= this.length) return false;
        

        let node = new Node(val);
        
        let prevNode = this.get(index-1);
        let nextNode = this.get(index)
        
        prevNode.next = node;
        node.next = nextNode;

        this.length++;
        return true;
    }

    // TODO: Implement the remove method here
    remove(index) {
        if (index < 0 || index >= this.length) return undefined;

        let removedNode = this.get(index);

        let prevNode = this.get(index - 1);
        let nextNode = this.get(index + 1);

        prevNode.next = nextNode;

        this.length--;
        return removedNode;
    }

    // TODO: Implement the size method here
    size() {
        return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;

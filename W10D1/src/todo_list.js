
class toDoList {
  constructor() {
    this.todos = JSON.parse(localStorage.getItem("todos")) || [];
    this.ul = document.querySelector("ul.todos"); 
    this.form = document.querySelector(".add-todo-form");
    this.form.addEventListener("submit", this.addToDo.bind(this));
    this.populateList();
    this.ul.addEventListener("click", this.toggleStatus.bind(this))
  }

  addToDo(event) {
    event.preventDefault();
    let input = document.getElementsByName("add-todo")[0];
    let value = input.value;
    let todo = {value: value, done: false};
    this.todos.push(todo);
    input.value = "";
    localStorage.setItem("todos", JSON.stringify(this.todos));
    this.populateList();

  }

  toggleStatus(e){
    let input = e.target;
    // input.dataset.status = (input.dataset.status) ? false : true; 
    // this.todos[input.dataset.idx].done = (input.dataset.status) ? false : true; 
    this.todos[input.dataset.idx].done = !this.todos[input.dataset.idx].done; 
    localStorage.setItem("todos", JSON.stringify(this.todos));
    this.populateList();
  }

  populateList() {

    this.ul.innerHTML = "";
    
    this.todos.forEach( (todo, idx) => {
      let label = document.createElement("label");
      label.textContent = todo.value;
      let checkbox = document.createElement("input");
      checkbox.setAttribute("type", "checkbox");
      // checkbox.dataset.status = todo.done;
      checkbox.dataset.idx = idx;

    //   checkbox.checked = true;
      checkbox.checked = todo.done;
      let li = document.createElement("li");
      li.appendChild(label);
      li.appendChild(checkbox);  
      this.ul.appendChild(li);

    })

  }

  
}

let ourToDo = new toDoList();
window.ourToDo = ourToDo;


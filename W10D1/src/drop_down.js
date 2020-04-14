
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = (dogs) => {
  let dogNames = Object.keys(dogs);
  let dogLinks = [];
  dogNames.forEach( dog => {
    let link = document.createElement("a");
    link.innerHTML = dog;
    link.href = dogs[dog];
    let li = document.createElement("li");
    li.className = "dog-link";
    li.appendChild(link);
    dogLinks.push(li);
  })
  return dogLinks;
}

function attachDogLinks() {
  let dogLinks = dogLinkCreator(dogs);
  let ul = document.querySelector("ul.drop-down-dog-list");
  dogLinks.forEach(dog => ul.appendChild(dog));
}
// const attachDogLinks = () => {
//   let dogLinks = dogLinkCreator(dogs);
//   let ul = document.querySelector("ul.drop-down-dog-list");
//   dogLinks.forEach(dog => ul.appendChild(dog));
// }

const handleEnter = () => {
  let dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(link => link.classList.add("show"));
}

const handleLeave = () => {
  let dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(link => link.classList.remove("show"));
}

const nav = document.querySelector(".drop-down-dog-nav");
nav.addEventListener("mouseenter", handleEnter);
nav.addEventListener("mouseleave", handleLeave);
attachDogLinks();
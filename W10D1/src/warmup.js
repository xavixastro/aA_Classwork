
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (Array.from(htmlElement.children).length > 0) {
      Array.from(htmlElement.children).forEach( child => {
          htmlElement.removeChild(child);
      })
    }

    let pTag = document.createElement("p");
    pTag.innerHTML = string;
    htmlElement.appendChild(pTag);
};

htmlGenerator('Party Time.', partyHeader);
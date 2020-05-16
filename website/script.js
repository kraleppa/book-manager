const list = document.getElementById("list")
const dataField = document.getElementById("data-field")

const titleInput = document.getElementById("titleInput")
const authorInput = document.getElementById("authorInput")
const descriptionInput = document.getElementById("descriptionInput")
const pagesInput = document.getElementById("pagesInput")
const dateInput = document.getElementById("dateInput")
const imageUrlInput = document.getElementById("imageUrlInput")


fetch('http://localhost:4000/api/graphql',{
    method: 'POST',
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({
        query: `
            query{
                getAllBooks{
                    id
                    author
                    title
                }
            }
        `
    })
})
.then(res => res.json())
.then(data => {
    data.data.getAllBooks.forEach(book => {
        const element = document.createElement("li")
        element.className = "list-group-item"
        element.innerHTML = `${book.title} <button type="button" class="btn btn-success" 
        onclick=loadBookData(${book.id})>Więcej</button> <br>${book.author} `
        list.appendChild(element)
    })
})

loadBookData = (id) => {
    fetch('http://localhost:4000/api/graphql',{
    method: 'POST',
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({
        query: `
            query{
                getBook(id: "${id}"){
                    author
                    title
                    description
                    numberOfPages
                    releaseDate
                    imageUrl
                }
            }
        `
    })
})
.then(res => res.json())
.then(data => {
    let book = data.data.getBook
    const element = document.createElement("div")
    element.innerHTML = `
    <img src="${book.imageUrl}" style = "width: 30rem; height: 40rem">
                    <table class="table table-striped">
                        <tbody>
                            <tr><th>Tytuł:</th><td>${book.title}</td></tr>
                            <tr><th>Autor:</th><td>${book.author}</td></tr>
                            <tr><th>Opis:</th><td>${book.description}</td></tr>
                            <tr><th>Liczba stron:</th><td>${book.numberOfPages}</td></tr>
                            <tr><th>Dat wydania:</th><td>${book.releaseDate}</td></tr>
                        </tbody>
                    </table>
    `
    dataField.innerHTML=""
    dataField.appendChild(element)
})
}

addBook = () => {
    const title = titleInput.value
    const author = authorInput.value
    const description = descriptionInput.value
    const numberOfPages =  parseInt(pagesInput.value, 10)
    const date = dateInput.value
    const imageUrl = imageUrlInput.value
    fetch('http://localhost:4000/api/graphql',{
    method: 'POST',
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({
        query: `
            mutation{
                    addBook(input:{
                      title: "${title}",
                      author: "${author}",
                        description: "${description}",
                        releaseDate: "${date}",
                        numberOfPages: ${numberOfPages},
                        imageUrl: "${imageUrl}"
                    })
                    {
                      id
                      title
                      author
                      description
                      releaseDate
                      numberOfPages
                      imageUrl
                    }
                  }
        `
    })
})
.then(res => res.json())
.then(data => console.log(data.data))
.catch((error) => {
    console.error('Error:', error);
  });
}
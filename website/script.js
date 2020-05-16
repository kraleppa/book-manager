const list = document.getElementById("list")

fetch('http://localhost:4000/api/graphql',{
    method: 'POST',
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({
        query: `
            query{
                getAllBooks{
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
        element.innerHTML = `${book.title} <br> ${book.author}`
        list.appendChild(element)
    })
})
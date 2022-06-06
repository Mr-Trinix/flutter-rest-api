const bodyParser = require('body-parser')
const express = require('express')
const app = express()
const cors = require('cors')
const products = require('./db/products.json')
const users = require('./db/users.json')

app.use(bodyParser.json())
app.use(cors())

app.use(express.static('public'));
app.use('/images', express.static('images'));

//Routes
app.post('/login', (req, res) => {
    const email = req.body.email
    const password = req.body.password
    var result = { isCorrect: false }

    users.map(user => {
        if (user.email == email && user.password === password) {
            result = { isCorrect: true, uuid: user.uuid }
        }
    })

    res.send(result)
})

app.get('/products', (req, res) => {
    console.log("-> Get all products")
    res.send(products)
})
app.get('/products/:id', (req, res) => {
    const id = req.params.id
    const productsFilter = products[id - 1]

    console.log(`-> Get product ${id}`)
    res.send(productsFilter ? [productsFilter] : [{}])
})

app.get('/', (req, res) => {
    res.send({ serverName: "Trinix's Burger" })
})
app.get('*', (req, res) => {
    res.send({ error: "Page introuvable" })
})

//Listening
const port = 3001
app.listen(port, () => {
    console.log(`Server running on port ${port}`)
})

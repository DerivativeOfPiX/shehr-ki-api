const express = require('express');
const app = express();
const bodyParser = require('body-parser');
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())
const connection = require('./db.config');
const hostname = '127.0.0.1';
const port = 3000;

app.get('/', (req, res) => {
    res.send('Hello World!')
  })


//testing to see if db works with post requests. 

app.post('/users', (req, res) => {
    var query = connection.query('INSERT INTO user SET ?', req.body, (err, res, fields) => {
        if(err) throw err;
    });
    console.log(query.sql);
})

//listen for request on port 3000, and as a callback function have the port listened on logged
app.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
  });
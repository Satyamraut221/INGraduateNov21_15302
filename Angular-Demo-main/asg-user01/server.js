const express = require('express');
const server = express();
const cors = require('cors');
const CORS_OPTIONS = {
    origin: 'http://localhost:4200',
    optionsSuccessStatus: 200 
};
const port = 3000;

server.use(cors(CORS_OPTIONS));
server.use(express.json());
server.use(express.urlencoded({extended: true}));


const USERS = [
    {
        id: 1,
        name: 'Madhav'
    },
    {
        id: 2,
        name: 'Satyam'
        
    },
    {
        id: 3,
        name: 'Harshala'
       
    }
];

// #############################################################################//

server.get('/', (req, res) => {
    res.send('Express is Working ....!');
});

server.get('/users', (req, res) => {

    res.setHeader('Content-Type', 'application/json');
    res.send(USERS);
    // res.send('Hello Again Madhav!');
});
    




server.listen(port, () => {
    console.log(`http://localhost:${port} running`);
});
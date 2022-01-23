const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors');
const CORS_OPTIONS = {
    origin: 'http://localhost:4200',
    optionsSuccessStatus: 200
};
server.use(express.json());
server.use(express.urlencoded({extended: true}));
server.use(cors(CORS_OPTIONS));
const db = require('./db/models');
db.sequelize.sync();
// #############################################################################

//App Url "http://localhost:3000/app"

require('./app/app-route')(server);

//Main Url "http://localhost:3000/app"

server.get('/', (req, res) => {
    res.send({'message': 'Welcome to express + Postgres + Node'});
});

server.listen(port, () => {
    console.log(`Server is running on port: ${port}`);
});
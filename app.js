// BASE SETUP
// =================================================
var express = require('express'),
    app = express(),
    bodyParser = require('body-parser');

var port = process.env.PORT || 4400;
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/forest-ranger');

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));


// ROUTERS
// =================================================

// error handling
app.use(function (err, req, res, next) {
    console.log(req.body);
    res.status(err.status || 500);
});

var routes = require('./app/router')(app);

app.listen(port);
console.log('Up and running at port: ' + port);

module.exports = app;
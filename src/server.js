const express = require('express');
const app = express();
const models = require('./models/post')
const bodyParser = require('body-parser')
const promBundle = require("express-prom-bundle");
const config = require('./system-life');
const middlewares = require('./middleware')

const metricsMiddleware = promBundle({
    includeMethod: true, 
    includePath: true, 
    includeStatusCode: true, 
    includeUp: true,
    promClient: {
        collectDefaultMetrics: {
        }
      }
});

app.use(middlewares.countRequests)
app.use(metricsMiddleware)
app.use(config.middlewares.healthMid);
app.use('/', config.routers);
app.use(express.static('static'));
app.use(bodyParser.urlencoded({ extended: false }))
app.set('view engine', 'ejs');


app.get('/post', (req, res) => {
    res.render('edit-news');
});

app.post('/post', (req, res) => {

    models.Post.create({title: req.body.title, content: req.body.description, summary: req.body.resumo, publishDate: Date.now()});
    res.redirect('/');
});

app.get('/post/:id', async (req, res) => {

    const post = await models.Post.findByPk(req.params.id);
    res.render('view-news',{post: post});
});


app.get('/', async (req, res) => {

    const posts = await models.Post.findAll();
    res.render('index',{posts: posts});
});

models.initDatabase();
app.listen(8080);

console.log('Aplicação rodando na porta 8080');
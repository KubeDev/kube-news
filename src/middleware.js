const client = require('prom-client');

const counter = new client.Counter({
    name: 'http_requests_total',
    help: 'metric_help',
    labelNames: ['method', 'path']
  });

exports.countRequests = (req, res, next) => {

    counter.labels({method: req.method, path: req.path}).inc();

    console.log('Request Type:', req.method, req.path);
    next();
}
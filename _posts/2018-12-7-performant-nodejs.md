---
layout: post
title: Performant Node.js Applications
# title-color: '#333333'
# bigimg: /img/istio_mesh_banner.jpg
---

Node.js is a JavaScript runtime environment built on Chrome's V8 engine and libuv's asynchronous IO. It is primarily used for building backend services and APIs. Due to its very active community it has become one of the most popular server side frameworks. With the backing of *npm*, almost any kind of application can be developed hotfoot.

Node.js primarily differs from other web frameworks (like Spring Boot) in its single-threaded architecture. Unlike other frameworks, which spawn a new thread for each incoming request, Node.js serves all of them on a single thread. It can do this because of its non-blocking IO. Node.js actually started off as an experiment to tackle this very problem. Spawning a new thread for each incoming request is not a very elegant solution and it does not scale well. In order to process all of these threads, the underlying CPU has to do time-slicing. And eventually, when there are a big number of spawned threads, time-slicing itself becomes as costly as request processing. Node.js on the other hand, handles all of the requests on a single thread running the event loop. This allows it to handle multiple thousand requests simultaneously without breaking a sweat.

Web applications are inherently more IO heavy than processing heavy. Most of the actions are related to network or disk IO. The general trend of web applications is:

* Receive a request on the network
* Read data from a DB
* Do some processing
* Write data to DB
* Respond back to the network request

By making the IO non-blocking, Node.js has focused on the area that matters the most in terms of efficiency in web apps. Now let's discuss how can Node.js be made even more performant.

## Multiple Threads
Wait, what? Isn't Node.js so good because of its single threaded nature? Why would you want multi-threading?

That's exactly the question that should pop-up in your head. And you would be right. Node.js *is* efficient because of its single-threaded non-blocking IO. But if you think about it, if your application is running on just one core, what are all the other cores of your CPU doing? The answer is *nothing*, well, almost nothing. Libuv does spawn new threads for its asynchronous-ness. But compared to other frameworks, the CPU cores are very *free*. So, essentially you are running one app on just one core, where you could be running *'n'* apps on an *'n'* core CPU.

This is where the *cluster* module of Node.js comes in. The *cluster* module provides a way of creating child processes of the same application, which share the same port on the host. This means that you can run multiple copies of your application which are bound to the same port. This increases the efficiency by utilizing the multi-core CPU fully, essentially boosting the server capacity by almost *n-fold* where *n* is the number of cores of the CPU.

A simple pattern for using the *cluster* module as shown in the
[official documentation](https://nodejs.org/api/cluster.html) is copied below:

```javascript
const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  console.log(`Master ${process.pid} is running`);

  // Fork workers.
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
  });
} else {
  // Workers can share any TCP connection
  // In this case it is an HTTP server
  http.createServer((req, res) => {
    res.writeHead(200);
    res.end('hello world\n');
  }).listen(8000);

  console.log(`Worker ${process.pid} started`);
}
```

Once you have your Node app making full use of your host machine, the next logical step for increasing the app performance even further is to have a load-balanced distributed deployment using a tool like Kubernetes, which of course you know already due to my previous blog-posts :-)

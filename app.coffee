util = require("util")
redis = require("redis")
express = require('express')
sio = require('socket.io')

r = redis.createClient()

app = express.createServer()

app.configure(() ->
	app.use(express.bodyParser())
	app.use(express.methodOverride())
	app.use(app.router)
	app.use(express.static(__dirname + '/public'))
)

app.configure('development', () ->
	app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))
)

app.configure('production', () ->
	app.use(express.errorHandler())
)

app.get('/', (req, res) ->
	res.json({ name: 'david' , count: Math.floor(Math.random()*11) })
)

app.listen(3000)
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);

io = sio.listen(app)
io.sockets.on('connection', (socket) ->
	socket.emit('hello', { hello: 'world' })
	socket.on('other event', (data) ->
    	console.log(data);
	)
)

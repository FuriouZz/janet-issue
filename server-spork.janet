(import spork/http)
(import "./routes")

(print "start server at http://0.0.0.0:8000")
(http/server (http/router routes/routes))

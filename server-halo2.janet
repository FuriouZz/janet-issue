(import spork/http)
(import halo2)
(import "./routes")

(def router (http/router routes/routes))

(defn handler [req]
  (put req :route (get req :path)) # For compatibility with spork/http/router
  (router req)
)

(halo2/server handler 8000 "0.0.0.0")

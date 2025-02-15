(import halo2)
(import spork/sh)
(import spork/path)
(import spork/htmlgen)

(def content-types @{
  ".html" "text/html"
  ".csv" "text/csv"
  ".txt" "text/plain"
  ".css" "text/css"
  ".js" "text/javascript"
  ".json" "application/json"
})

(defn index [&] {
  :status 200
  :headers {"content-type" "text/html"}
  :body (htmlgen/html @[
    htmlgen/doctype-html
    [:head
      [:title "Dashboard"]
      [:link {:href "public/main.css" :rel "stylesheet"}]
    ]
    [:body
      [:script {:src "public/main.js" :type "module"}]
    ]
  ])
})

(defn not-found [&] {
  :status 404
  :body "Not found"
})

(defn static [req]
  (def route (drop 1 (get req :route)))
  {
    :status 200
    :body (slurp route)
    :headers {
      "content-type" (or
        (get content-types (path/ext route))
        "text/plain"
      )
    }
  }
)

(def routes @{
  "/" index
  :default not-found
})

(loop [path :in (sh/list-all-files "public")]
  (put routes (string "/" path) static)
)


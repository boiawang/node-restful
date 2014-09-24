urls = require('../models/urls').urls
express = require 'express'
app = express()
router = express.Router()

for url in urls
  router.get url.path, (req, res) ->
    res.json url.data

    req.end()

exports.router = router

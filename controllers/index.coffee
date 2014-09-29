urls = require('../models/urls').urls
router = require('../lib/config').router
marked = require 'marked'
qs = require 'querystring'
mongoose = require 'mongoose'
utils = require '../lib/utils'

# for url in urls
#   router.get url.path, (req, res) ->
#     res.json url.data
#
#     req.end()

exports.router = router

exports.index = (req, res, next) ->
  res.render 'addUrl'
  next()

exports.new = (req, res, next) ->

  data = JSON.parse req.body.data
  name = utils.toFirstWordUpper(req.body.name)

  res.render 'addUrl'
  next()

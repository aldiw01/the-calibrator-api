var express = require('express')
var router = express.Router()
const path = require('path')

/////////////////////////////////////////////////////////////////////////////////////////////
// API Get Image

router.use('/', express.static(path.join(__dirname, '../uploads')))

module.exports = router

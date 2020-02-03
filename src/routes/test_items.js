
const express = require('express')
var router = express.Router()
var db = require('../models/test_items')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Test Items => /api/test_items/

router.get('/', jwtMW, (req, res) => {
  db.getTestItemAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getTestItem(req.params, res)
})

router.get('/test_types/:id', jwtMW, (req, res) => {
  db.getTestItemType(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newTestItem(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateTestItem(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteTestItem(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteTestItemAll(req.params, res)
})

module.exports = router
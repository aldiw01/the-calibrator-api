
const express = require('express')
var router = express.Router()
var db = require('../models/test_types')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Test Types => /api/test_types/

router.get('/', jwtMW, (req, res) => {
  db.getTestTypeAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getTestType(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newTestType(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateTestType(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteTestType(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteTestTypeAll(req.params, res)
})

module.exports = router
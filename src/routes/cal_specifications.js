
const express = require('express')
var router = express.Router()
var db = require('../models/cal_specifications')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Specifications => /api/cal_specifications/

router.get('/', jwtMW, (req, res) => {
  db.getCalSpecificationAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCalSpecification(req.params, res)
})

router.get('/devices/:id', jwtMW, (req, res) => {
  db.getCalSpecificationDevice(req.params, res)
})

router.get('/test_items/:id', jwtMW, (req, res) => {
  db.getCalSpecificationTestItem(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newCalSpecification(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalSpecification(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCalSpecification(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCalSpecificationAll(req.params, res)
})

module.exports = router

const express = require('express')
var router = express.Router()
var db = require('../models/cal_results')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Results => /api/cal_results/

router.get('/', jwtMW, (req, res) => {
  db.getCalResultAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCalResult(req.params, res)
})

router.get('/device/:id', jwtMW, (req, res) => {
  db.getCalResultDevice(req.params, res)
})

router.get('/test_items/:id', jwtMW, (req, res) => {
  db.getCalResultTestItem(req.params, res)
})

router.get('/cal_certificates/:id', jwtMW, (req, res) => {
  db.getCalResultCertificate(req.params, res)
})

router.get('/raw_data/:id', jwtMW, (req, res) => {
  db.getCalResultRawData(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newCalResult(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalResult(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCalResult(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCalResultAll(req.params, res)
})

module.exports = router
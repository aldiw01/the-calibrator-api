
const express = require('express')
var router = express.Router()
var db = require('../models/cal_manuals')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_ADMIN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Manuals => /api/cal_manuals/

router.get('/', jwtMW, (req, res) => {
  db.getCalManualAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCalManual(req.params, res)
})

router.get('/devices/:id', jwtMW, (req, res) => {
  db.getCalManualDevice(req.params, res)
})

router.get('/test_items/:id', jwtMW, (req, res) => {
  db.getCalManualTestItem(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newCalManual(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalManual(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCalManual(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCalManualAll(req.params, res)
})

module.exports = router
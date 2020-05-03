
const express = require('express')
var router = express.Router()
var db = require('../models/cal_steps')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Steps => /api/cal_steps/

router.get('/', jwtMW, (req, res) => {
  db.getCalStepAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCalStep(req.params, res)
})

router.get('/reference/:id', (req, res) => {
  db.getCalStepReference(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newCalStep(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalStep(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCalStep(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCalStepAll(req.params, res)
})

module.exports = router

const express = require('express')
var router = express.Router()
var db = require('../models/cal_requests')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Requests => /api/cal_requests/

router.get('/', jwtMW, (req, res) => {
  db.getCalRequestAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCalRequest(req.params, res)
})

router.get('/lab/:id', jwtMW, (req, res) => {
  db.getCalRequestLab(req.params, res)
})

router.get('/engineers/:id', jwtMW, (req, res) => {
  db.getCalRequestEngineer(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getCalRequestType(req.params, res)
})

router.get('/cal_certificate/:id', jwtMW, (req, res) => {
  db.getCalRequestCertificate(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newCalRequest(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalRequest(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCalRequest(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCalRequestAll(req.params, res)
})

module.exports = router
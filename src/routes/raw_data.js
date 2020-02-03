
const express = require('express')
var router = express.Router()
var db = require('../models/raw_data')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Raw Data => /api/raw_data/

router.get('/', jwtMW, (req, res) => {
  db.getRawDataAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getRawData(req.params, res)
})

router.get('/cal_request/:id', jwtMW, (req, res) => {
  db.getRawDataCalRequest(req.params, res)
})

router.get('/test_items/:id', jwtMW, (req, res) => {
  db.getRawDataTestItem(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newRawData(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateRawData(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteRawData(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteRawDataAll(req.params, res)
})

module.exports = router
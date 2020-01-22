
const express = require('express')
var router = express.Router()
var db = require('../models/history')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_ADMIN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API History => /api/history/

router.get('/', jwtMW, (req, res) => {
  db.getHistoryAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getHistory(req.params, res)
})

router.get('/cal_request/:id', jwtMW, (req, res) => {
  db.getHistoryCalRequest(req.params, res)
})

router.get('/engineers/:id', jwtMW, (req, res) => {
  db.getHistoryEngineer(req.params, res)
})

router.get('/cal_steps/:id', jwtMW, (req, res) => {
  db.getHistoryCalStep(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newHistory(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateHistory(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteHistory(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteHistoryAll(req.params, res)
})

module.exports = router
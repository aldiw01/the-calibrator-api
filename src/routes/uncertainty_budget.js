
const express = require('express')
var router = express.Router()
var db = require('../models/uncertainty_budget')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Uncertainty Budget => /api/uncertainty_budget/

router.get('/', jwtMW, (req, res) => {
  db.getUncertaintyBudgetAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getUncertaintyBudget(req.params, res)
})

router.get('/test_items/:id', jwtMW, (req, res) => {
  db.getUncertaintyBudgetTestItem(req.params, res)
})

router.get('/devices/:id', jwtMW, (req, res) => {
  db.getUncertaintyBudgetDevice(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newUncertaintyBudget(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateUncertaintyBudget(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteUncertaintyBudget(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteUncertaintyBudgetAll(req.params, res)
})

module.exports = router
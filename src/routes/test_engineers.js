
const express = require('express')
var router = express.Router()
var db = require('../models/test_engineers')
const exjwt = require('express-jwt')
const crypto = require("crypto")

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// CONSTANT LIST

const CIPHER_SECRET = process.env.APP_CIPHER_SECRET
const CIPHER_BASE = process.env.APP_CIPHER_BASE
const HASH_ALGORITHM = process.env.APP_HASH_ALGORITHM

/////////////////////////////////////////////////////////////////////////////////////////////
// API Test Engineers => /api/engineers/

router.get('/', jwtMW, (req, res) => {
  db.getEngineerAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getEngineer(req.params, res)
})

router.get('/role/:id', jwtMW, (req, res) => {
  db.getEngineerRole(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  const password = crypto.createHmac(HASH_ALGORITHM, CIPHER_SECRET).update(req.body.password).digest(CIPHER_BASE);
  db.newEngineer(req.body, password, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateEngineer(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/:id', jwtMW, (req, res) => {
  db.deactivateEngineer(req.params, res)
})

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteEngineer(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteEngineerAll(req.params, res)
})

module.exports = router
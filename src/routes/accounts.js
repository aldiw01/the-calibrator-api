
const express = require('express')
var router = express.Router()
var db = require('../models/accounts')
const jwt = require('jsonwebtoken')
const exjwt = require('express-jwt')
const crypto = require("crypto")

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const SECRET = process.env.APP_TOKEN_SECRET

/////////////////////////////////////////////////////////////////////////////////////////////
// CONSTANT LIST

const CIPHER_SECRET = process.env.APP_CIPHER_SECRET
const CIPHER_BASE = process.env.APP_CIPHER_BASE
const HASH_ALGORITHM = process.env.APP_HASH_ALGORITHM

/////////////////////////////////////////////////////////////////////////////////////////////
// API Accounts => /api/accounts/

router.post('/login', (req, res) => {
  const { email } = req.body;
  console.log("login")

  const password = crypto.createHmac(HASH_ALGORITHM, CIPHER_SECRET).update(req.body.password).digest(CIPHER_BASE);
  console.log(password)

  db.cekLogin(email, password, function (err, data) {
    if (data.length === 1 && (data[0].role === "1" || data[0].role === "2")) {
      //If all credentials are correct do this
      let token = jwt.sign({
        id: data[0].id,
        name: data[0].name,
        lab: data[0].lab,
        email: data[0].email,
        role: data[0].role,
        photo: data[0].photo,
        registered: data[0].registered,
        updated: data[0].updated
      }, SECRET, { expiresIn: 43210 }); // Sigining the token
      res.json({
        success: true,
        err: null,
        token
      });
    }
    else if (data.length === 1 && data[0].role === "0") {
      res.json({
        success: false,
        token: null,
        err: 'Email is not verified'
      });
    }
    else {
      res.json({
        success: false,
        token: null,
        err: 'Username or password is incorrect'
      });
    }
  });
});

/////////////////////////////////////////////////////////////////////////////////////////////
// Forgot and Reset Password

router.post('/forgot-password', (req, res) => {
  const token = crypto.randomBytes(16).toString('hex');
  db.forgotPassword(req.body, res, token);
})

router.get('/forgot-password/get-token/:token', (req, res) => {
  db.forgotPassword_getToken(req.params, res);
})

router.put('/forgot-password/edit-password', (req, res) => {
  const password = crypto.createHmac(HASH_ALGORITHM, CIPHER_SECRET).update(req.body.password).digest(CIPHER_BASE);
  db.forgotPassword_editPassword(req.body, password, res);
})

/////////////////////////////////////////////////////////////////////////////////////////////
// API List

router.post('/check-user-registered', (req, res) => {
  db.checkUserRegistered(req.body, res);
})

router.get('/user/verify/:id', (req, res) => {
  db.checkVerified(req.params, res);
})

router.put('/user/verify/:id', jwtMW, (req, res) => {
  db.verifyUser(req.params, res);
})

router.post('/user/verify-token', (req, res) => {
  db.verifyToken(req.body, res);
})

router.delete('/token/verification/all', (req, res) => {
  db.deleteVerificationToken(req.params, res);
})

router.delete('/token/reset-password/all', (req, res) => {
  db.deleteResetPasswordToken(req.params, res);
})

router.delete('/token/inactive/all', (req, res) => {
  db.deleteInactiveToken(req.params, res);
})

module.exports = router
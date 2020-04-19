
const express = require('express')
var router = express.Router()
var db = require('../models/cal_requests')
const exjwt = require('express-jwt')
const multer = require('multer')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageRequests = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/requests/');
  },
  filename: function (req, file, cb) {
    cb(null, req.params.id.replace(new RegExp("/", 'g'), "") + '_' + new Date().valueOf() + path.extname(file.originalname));
  }
})

function fileFilter(req, file, cb) {
  if (file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true)
  } else {
    cb({ message: 'Only for images (jpg/jpeg/png).' }, false)
  }
};

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

router.post('/', jwtMW, (req, res) => {
  db.newCalRequest(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCalRequest(req.body, res)
})

router.put('/documentation/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageRequests,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('documentation')
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.file == undefined) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.documentation = req.file.filename

    db.updateCalRequestDocumentation(req, res)
  })
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
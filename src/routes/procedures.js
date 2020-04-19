
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/procedures')
const exjwt = require('express-jwt')
var path = require('path')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageProcedures = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/procedures/');
  },
  filename: function (req, file, cb) {
    cb(null, req.body.id.replace(new RegExp("/", 'g'), "") + '_v' + req.body.version + '_' + req.body.name + path.extname(file.originalname));
  }
})

function fileFilter(req, file, cb) {
  if (file.mimetype === 'application/pdf' || file.mimetype === 'application/msword') {
    cb(null, true)
  } else {
    cb({ message: 'Only for documents (pdf/doc).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Procedures => /api/procedures/

router.get('/', jwtMW, (req, res) => {
  db.getProcedureAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getProcedure(req.params, res)
})

router.get('/type/:id', jwtMW, (req, res) => {
  db.getProcedureType(req.params, res)
})

router.get('/pic/:id', jwtMW, (req, res) => {
  db.getProcedurePIC(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageProcedures,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file')
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
    req.body.file = req.file.filename

    db.newProcedure(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageProcedures,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('file')
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.file == undefined && req.body.file === undefined) {
      res.send('index', { message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.file = req.file ? req.file.filename : req.body.file

    db.updateProcedure(req.body, res)
  })
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteProcedure(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteProcedureAll(req.params, res)
})

module.exports = router
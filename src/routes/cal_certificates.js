
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/cal_certificates')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageCertificates = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/cal_certificates/');
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '_' + new Date().valueOf() + '_' + file.originalname);
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
// API Calibration Certificates => /api/cal_certificates/

router.get('/', jwtMW, (req, res) => {
  db.getCertificateAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getCertificate(req.params, res)
})

router.get('/devices/:id', (req, res) => {
  db.getCertificateDevice(req.params, res)
})

router.get('/engineers/:id', jwtMW, (req, res) => {
  db.getCertificateEngineer(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageCertificates,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('certificate_file')
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
      res.send('index', { message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.certificate_file = req.file.filename

    db.newCertificate(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateCertificate(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteCertificate(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteCertificateAll(req.params, res)
})

module.exports = router
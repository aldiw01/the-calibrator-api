
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/forms')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageForms = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, __dirname + '/uploads/forms/')
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, '-') + '_' + file.originalname)
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
// API Calibration Forms => /api/forms/

router.get('/', jwtMW, (req, res) => {
  db.getFormAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getForm(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageForms,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('fileImage')
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
    req.body.file = req.file.filename

    db.newForm(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateForm(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteForm(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteFormAll(req.params, res)
})

module.exports = router
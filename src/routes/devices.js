
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/devices')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_ADMIN_SECRET
});

const storageDevices = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, __dirname + '/uploads/devices/')
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, '-') + '_' + file.originalname)
  }
})

function fileFilter(req, file, cb) {
  if (file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true)
  } else {
    cb({ message: 'Only for image (jpg/jpeg/png).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Devices => /api/devices/

router.get('/', jwtMW, (req, res) => {
  db.getDeviceAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getDevice(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
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
    req.body.documentation = req.file.filename

    db.newDevice(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateDevice(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/:id', jwtMW, (req, res) => {
  db.deactivateDevice(req.params, res)
})

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteDevice(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteDeviceAll(req.params, res)
})

module.exports = router
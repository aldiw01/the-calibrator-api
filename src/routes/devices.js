
const express = require('express')
var router = express.Router()
const multer = require('multer')
var db = require('../models/devices')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const storageDevices = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'src/uploads/devices/')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '_' + new Date().valueOf() + '_' + file.originalname)
  }
})

function fileFilter(req, file, cb) {
  if (file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/png' || file.mimetype === 'application/pdf' || file.mimetype === 'application/msword') {
    cb(null, true)
  } else {
    cb({ message: 'Only for images or documents (jpg/jpeg/png/pdf/doc).' }, false)
  }
};

/////////////////////////////////////////////////////////////////////////////////////////////
// API Devices => /api/devices/

router.get('/', jwtMW, (req, res) => {
  db.getDeviceAll(req.body, res)
})

router.get('/dashboard/', (req, res) => {
  db.getDeviceDashboard(req.params, res)
})

router.get('/:id', (req, res) => {
  db.getDevice(req.params, res)
})

router.get('/owner/:id', (req, res) => {
  db.getDeviceOwner(req.params, res)
})

router.get('/defect_status/:lab/:id', (req, res) => {
  db.getDeviceDefectStatus(req.params, res)
})

router.get('/calibration_status/:lab', (req, res) => {
  db.getDeviceCalibrationStatus(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).fields([{ name: 'manual_file', maxCount: 1 }, { name: 'spec_file', maxCount: 1 }, { name: 'documentation', maxCount: 1 }])
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      // A Multer error occurred when uploading.
      res.send(err)
      return
    } else if (err) {
      // An unknown error occurred when uploading.
      res.send(err)
      return
    } else if (req.files == undefined) {
      res.send({ message: 'No file selected!' })
      return
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.manual_file = req.files.manual_file[0].filename
    req.body.spec_file = req.files.spec_file[0].filename
    req.body.documentation = req.files.documentation[0].filename

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
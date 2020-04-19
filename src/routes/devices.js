
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
    if (req.params.id !== undefined)
      cb(null, file.fieldname + '_' + req.params.id.replace("/", "-") + '_' + new Date().valueOf())
    else
      cb(null, file.fieldname + '_' + req.body.id.replace("/", "-") + '_' + new Date().valueOf())
  }
})

function fileFilter(req, file, cb) {
  if (file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/png' || file.mimetype === 'application/pdf' || file.mimetype === 'application/msword') {
    cb(null, true)
  } else {
    cb({ message: 'Only for images or documents (jpg/jpeg/png/pdf/doc).' }, false)
  }
};

function fileFilter2(req, file, cb) {
  if (file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true)
  } else {
    cb({ message: 'Only for images (jpg/jpeg/png).' }, false)
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

router.get('/owner/:id', jwtMW, (req, res) => {
  db.getDeviceOwner(req.params, res)
})

router.get('/defect_status/:lab/:id', jwtMW, (req, res) => {
  db.getDeviceDefectStatus(req.params, res)
})

router.get('/lab/:lab', jwtMW, (req, res) => {
  db.getDeviceCalibrationStatus(req.params, res)
})

router.get('/schedule/regular_check', (req, res) => {
  db.getDeviceRegularCheckScheduleAll(req.params, res)
})

router.get('/schedule/regular_check/:id', jwtMW, (req, res) => {
  db.getDeviceRegularCheckSchedule(req.params, res)
})

router.get('/search/:id', jwtMW, (req, res) => {
  db.getDeviceSearch(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
    limits: {
      fileSize: 1 * 1024 * 1024
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
    }
    // Everything went fine.
    console.log('Upload success.')

    // File name key used while in production and filename in development
    req.body.manual_file = req.files.manual_file ? req.files.manual_file[0].filename : ''
    req.body.spec_file = req.files.spec_file ? req.files.spec_file[0].filename : ''
    req.body.documentation = req.files.documentation[0].filename || ''

    db.newDevice(req.body, res)
  })
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateDevice(req.body, res)
})

router.put('/documentation/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
    limits: {
      fileSize: 1 * 1024 * 1024
    },
    fileFilter: fileFilter2
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

    db.updateDeviceDocumentation(req, res)
  })
})

router.put('/manual_file/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('manual_file')
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
    req.body.manual_file = req.file.filename

    db.updateDeviceManual(req, res)
  })
})

router.put('/spec_file/:id', jwtMW, (req, res) => {
  var upload = multer({
    storage: storageDevices,
    limits: {
      fileSize: 5 * 1024 * 1024
    },
    fileFilter: fileFilter
  }).single('spec_file')
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
    req.body.spec_file = req.file.filename

    db.updateDeviceSpecification(req, res)
  })
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
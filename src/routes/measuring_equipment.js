
const express = require('express')
var router = express.Router()
var db = require('../models/measuring_equipment')
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

/////////////////////////////////////////////////////////////////////////////////////////////
// API Calibration Results => /api/measuring_equipment/

router.get('/', jwtMW, (req, res) => {
  db.getMeasuringEquipmentAll(req.body, res)
})

router.get('/:id', (req, res) => {
  db.getMeasuringEquipment(req.params, res)
})

router.get('/request/:id', jwtMW, (req, res) => {
  db.getMeasuringEquipmentRequest(req.params, res)
})

router.get('/device/:id', jwtMW, (req, res) => {
  db.getMeasuringEquipmentDeviceID(req.params, res)
})

router.post('/', jwtMW, (req, res) => {
  db.newMeasuringEquipment(req.body, res)
})

router.put('/:id', jwtMW, (req, res) => {
  db.updateMeasuringEquipment(req.body, res)
})

/////////////////////////////////////////////////////////////////////////////////////////////
// EXTREAMLY DANGEROUS, USE THIS WISELY

router.delete('/ever/:id', jwtMW, (req, res) => {
  db.deleteMeasuringEquipment(req.params, res)
})

router.delete('/all/ever', jwtMW, (req, res) => {
  db.deleteMeasuringEquipmentAll(req.params, res)
})

module.exports = router
var express = require('express')
var router = express.Router()
const exjwt = require('express-jwt')

// Instantiating the express-jwt middleware
const jwtMW = exjwt({
  secret: process.env.APP_TOKEN_SECRET
});

const accounts = require('./accounts')
const cal_certificates = require('./cal_certificates')
const cal_specifications = require('./cal_specifications')
const cal_requests = require('./cal_requests')
const cal_results = require('./cal_results')
const cal_steps = require('./cal_steps')
const devices = require('./devices')
const forms = require('./forms')
const history = require('./history')
const procedures = require('./procedures')
const raw_data = require('./raw_data')
const test_engineers = require('./test_engineers')
const test_items = require('./test_items')
const test_types = require('./test_types')
const uncertainty_budget = require('./uncertainty_budget')
const uploads = require('./uploads')

/////////////////////////////////////////////////////////////////////////////////////////////
// API Routes

router.use('/accounts', accounts)
router.use('/cal_certificates', cal_certificates)
router.use('/cal_specifications', cal_specifications)
router.use('/cal_requests', cal_requests)
router.use('/cal_results', cal_results)
router.use('/cal_steps', cal_steps)
router.use('/devices', devices)
router.use('/forms', forms)
router.use('/history', history)
router.use('/procedures', procedures)
router.use('/raw_data', raw_data)
router.use('/engineers', test_engineers)
router.use('/test_items', test_items)
router.use('/test_types', test_types)
router.use('/uncertainty_budget', uncertainty_budget)
router.use('/uploads', uploads)

router.get('/', jwtMW /* Using the express jwt MW here */, (req, res) => {
  res.send({ message: 'You are authenticated' }); //Sending some response when authenticated
});

module.exports = router
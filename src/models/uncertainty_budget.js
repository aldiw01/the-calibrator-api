const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // UNCERTAINTY BUDGET MODELS

  getUncertaintyBudgetAll: function (req, res) {
    c.query("SELECT * FROM `uncertainty_budget`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_item_id: items[1],
          device_id: items[2],
          calibrator_certificate: items[3],
          drift: items[4],
          resolution: items[5],
          repeatibility: items[6],
          other: items[7],
          uncertainty: items[8],
          calibration_date: items[9]
        });
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getUncertaintyBudget: function (req, res) {
    c.query("SELECT * FROM `uncertainty_budget` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_item_id: items[1],
          device_id: items[2],
          calibrator_certificate: items[3],
          drift: items[4],
          resolution: items[5],
          repeatibility: items[6],
          other: items[7],
          uncertainty: items[8],
          calibration_date: items[9]
        });
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getUncertaintyBudgetTestItem: function (req, res) {
    c.query("SELECT * FROM `uncertainty_budget` WHERE test_item_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_item_id: items[1],
          device_id: items[2],
          calibrator_certificate: items[3],
          drift: items[4],
          resolution: items[5],
          repeatibility: items[6],
          other: items[7],
          uncertainty: items[8],
          calibration_date: items[9]
        });
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getUncertaintyBudgetDevice: function (req, res) {
    c.query("SELECT * FROM `uncertainty_budget` WHERE device_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_item_id: items[1],
          device_id: items[2],
          calibrator_certificate: items[3],
          drift: items[4],
          resolution: items[5],
          repeatibility: items[6],
          other: items[7],
          uncertainty: items[8],
          calibration_date: items[9]
        });
      });
      if (data.length < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  newUncertaintyBudget: function (req, res) {
    const waktu = new Date().toISOString();
    var request = ['U' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.test_item_id, req.device_id, req.calibrator_certificate, req.drift, req.resolution, req.repeatibility, req.other, req.uncertainty, req.calibration_date];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `uncertainty_budget`(`id`, `test_item_id`, `calibrator_certificate`, `device_id`, `drift`, `resolution`, `repeatibility`, `other`, `uncertainty`, `calibration_date`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Uncertainty Budget has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateUncertaintyBudget: function (req, res) {
    var request = [req.test_item_id, req.device_id, req.calibrator_certificate, req.drift, req.resolution, req.repeatibility, req.other, req.uncertainty, req.calibration_date, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `uncertainty_budget` SET `test_item_id`=?, `device_id`=?, `calibrator_certificate`=?, `drift`=?, `resolution`=?, `repeatibility`=?, `other`=?, `uncertainty`=?, `calibration_date`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Uncertainty Budget has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteUncertaintyBudget: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `uncertainty_budget` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          err: null,
          message: "Uncertainty Budget has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteUncertaintyBudgetAll: function (req, res) {
    c.query("DELETE FROM `uncertainty_budget`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }
      console.log(rows.info)
      if (rows.info.affectedRows < 1) {
        res.status(404).send({ message: 'Data not found.' });
      } else {
        res.json({
          affectedRows: rows.info.affectedRows,
          message: "All Uncertainty Budget has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
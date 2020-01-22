const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CALIBRATION RESULT MODELS

  getCalResultAll: function (req, res) {
    c.query("SELECT * FROM `cal_results`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  getCalResult: function (req, res) {
    c.query("SELECT * FROM `cal_results` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  getCalResultDevice: function (req, res) {
    c.query("SELECT * FROM `cal_results` WHERE device_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  getCalResultTestItem: function (req, res) {
    c.query("SELECT * FROM `cal_results` WHERE test_item_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  getCalResultCertificate: function (req, res) {
    c.query("SELECT * FROM `cal_results` WHERE test_certificate_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  getCalResultRawData: function (req, res) {
    c.query("SELECT * FROM `cal_results` WHERE raw_data_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          device_id: items[1],
          test_item_id: items[2],
          test_certificate_id: items[3],
          raw_data_id: items[4],
          range: items[5],
          input_frequency: items[6],
          input_value: items[7],
          specification: items[8],
          indicated_value: items[9],
          correction: items[10],
          uncertainty: items[11],
          measure_unit: items[12],
          is_out_spec: items[13],
          is_accredited: items[14]
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
  newCalResult: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      'R' + new Date(waktu).valueOf().toString(32).toUpperCase(),
      req.device_id,
      req.test_item_id,
      req.test_certificate_id,
      req.raw_data_id,
      req.range,
      req.input_frequency,
      req.input_value,
      req.specification,
      req.indicated_value,
      req.correction,
      req.uncertainty,
      req.measure_unit,
      req.is_out_spec,
      req.is_accredited
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `cal_results`(`id`, `device_id`, `test_item_id`, `test_certificate_id`, `raw_data_id`, `range`, `input_frequency`, `input_value`, `specification`, `indicated_value`, `correction`, `uncertainty`, `measure_unit`, `is_out_spec`, `is_accredited`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Result has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCalResult: function (req, res) {
    var request = [req.device_id, req.test_item_id, req.test_certificate_id, req.raw_data_id, req.range, req.input_frequency, req.input_value, req.specification, req.indicated_value, req.correction, req.uncertainty, req.measure_unit, req.is_out_spec, req.is_accredited, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `cal_results` SET `device_id`=?, `test_item_id`=?, `test_certificate_id`=?, `raw_data_id`=?, `range`=?, `input_frequency`=?, `input_value`=?, `specification`=?, `indicated_value`=?, `correction`=?, `uncertainty`=?, `measure_unit`=?, `is_out_spec`=?, `is_accredited`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Result has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteCalResult: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `cal_results` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Calibration Result has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteCalResultAll: function (req, res) {
    c.query("DELETE FROM `cal_results`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Calibration Result has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
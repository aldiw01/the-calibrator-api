const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // RAW DATA MODELS

  getRawDataAll: function (req, res) {
    c.query("SELECT * FROM `raw_data`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          cal_request_id: items[1],
          test_item_id: items[2],
          range: items[3],
          input_frequency: items[4],
          input_value: items[5],
          result1: items[6],
          result2: items[7],
          result3: items[8],
          result4: items[9],
          result5: items[10],
          measure_unit: items[11]
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
  getRawData: function (req, res) {
    c.query("SELECT * FROM `raw_data` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          cal_request_id: items[1],
          test_item_id: items[2],
          range: items[3],
          input_frequency: items[4],
          input_value: items[5],
          result1: items[6],
          result2: items[7],
          result3: items[8],
          result4: items[9],
          result5: items[10],
          measure_unit: items[11]
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
  getRawDataCalRequest: function (req, res) {
    c.query("SELECT * FROM `raw_data` WHERE cal_request_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          cal_request_id: items[1],
          test_item_id: items[2],
          range: items[3],
          input_frequency: items[4],
          input_value: items[5],
          result1: items[6],
          result2: items[7],
          result3: items[8],
          result4: items[9],
          result5: items[10],
          measure_unit: items[11]
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
  getRawDataTestItem: function (req, res) {
    c.query("SELECT * FROM `raw_data` WHERE test_item_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          cal_request_id: items[1],
          test_item_id: items[2],
          range: items[3],
          input_frequency: items[4],
          input_value: items[5],
          result1: items[6],
          result2: items[7],
          result3: items[8],
          result4: items[9],
          result5: items[10],
          measure_unit: items[11]
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
  newRawData: function (req, res) {
    const waktu = new Date().toISOString();
    var request = ['W' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.cal_request_id, req.test_item_id, req.range, req.input_frequency, req.input_value, req.result1, req.result2, req.result3, req.result4, req.result5, req.measure_unit];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `raw_data`(`id`, `cal_request_id`, `test_item_id`, `range`, `input_frequency`, `input_value`, `result1`, `result2`, `result3`, `result4`, `result5`, `measure_unit`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Raw Data has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateRawData: function (req, res) {
    var request = [req.cal_request_id, req.test_item_id, req.range, req.input_frequency, req.input_value, req.result1, req.result2, req.result3, req.result4, req.result5, req.measure_unit, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `raw_data` SET `cal_request_id`=?, `test_item_id`=?, `range`=?, `input_frequency`=?, `input_value`=?, `result1`=?, `result2`=?, `result3`=?, `result4`=?, `result5`=?, `measure_unit`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Raw Data has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteRawData: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `raw_data` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Raw Data has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteRawDataAll: function (req, res) {
    c.query("DELETE FROM `raw_data`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Raw Data has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
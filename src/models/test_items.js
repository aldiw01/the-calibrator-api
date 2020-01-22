const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // TEST ITEM MODELS

  getTestItemAll: function (req, res) {
    c.query("SELECT * FROM `test_items`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_type_id: items[1],
          item_name: items[2],
          is_AC: items[3],
          bottom_frequency: items[4],
          upper_frequency: items[5],
          bottom_range: items[6],
          upper_range: items[7],
          CMC: items[8],
          measure_unit: items[9]
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
  getTestItem: function (req, res) {
    c.query("SELECT * FROM `test_items` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_type_id: items[1],
          item_name: items[2],
          is_AC: items[3],
          bottom_frequency: items[4],
          upper_frequency: items[5],
          bottom_range: items[6],
          upper_range: items[7],
          CMC: items[8],
          measure_unit: items[9]
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
  getTestItemType: function (req, res) {
    c.query("SELECT * FROM `test_items` WHERE test_type_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_type_id: items[1],
          item_name: items[2],
          is_AC: items[3],
          bottom_frequency: items[4],
          upper_frequency: items[5],
          bottom_range: items[6],
          upper_range: items[7],
          CMC: items[8],
          measure_unit: items[9]
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
  newTestItem: function (req, res) {
    const waktu = new Date().toISOString();
    var request = ['T' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.test_type_id, req.item_name, req.is_AC, req.bottom_frequency, req.upper_frequency, req.bottom_range, req.upper_range, req.CMC, req.measure_unit];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_items`(`id`, `test_type_id`, `item_name`, `is_AC`, `bottom_frequency`, `upper_frequency`, `bottom_range`, `upper_range`, `CMC`, `measure_unit`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Item has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateTestItem: function (req, res) {
    var request = [req.test_type_id, req.item_name, req.is_AC, req.bottom_frequency, req.upper_frequency, req.bottom_range, req.upper_range, req.CMC, req.measure_unit, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_items` SET `test_type_id`=?, `item_name`=?, `is_AC`=?, `bottom_frequency`=?, `upper_frequency`=?, `bottom_range`=?, `upper_range`=?, `CMC`=?, `measure_unit`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Item has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteTestItem: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `test_items` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Test Item has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteTestItemAll: function (req, res) {
    c.query("DELETE FROM `test_items`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Test Item has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
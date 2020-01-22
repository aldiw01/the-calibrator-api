const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CALIBRATION MANUAL MODELS

  getCalManualAll: function (req, res) {
    c.query("SELECT * FROM `cal_manuals`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          ppm_output: items[3],
          floor: items[4],
          resolution: items[5]
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
  getCalManual: function (req, res) {
    c.query("SELECT * FROM `cal_manuals` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          ppm_output: items[3],
          floor: items[4],
          resolution: items[5]
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
  getCalManualDevice: function (req, res) {
    c.query("SELECT * FROM `cal_manuals` WHERE device_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          ppm_output: items[3],
          floor: items[4],
          resolution: items[5]
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
  getCalManualTestItem: function (req, res) {
    c.query("SELECT * FROM `cal_manuals` WHERE test_item_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          ppm_output: items[3],
          floor: items[4],
          resolution: items[5]
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
  newCalManual: function (req, res) {
    const waktu = new Date().toISOString();
    var request = ['M' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.device_id, req.test_item_id, req.ppm_output, req.floor, req.resolution];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `cal_manuals`(`id`, `device_id`, `test_item_id`, `ppm_output`, `floor`, `resolution`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Manual has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCalManual: function (req, res) {
    var request = [req.device_id, req.test_item_id, req.ppm_output, req.floor, req.resolution, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `cal_manuals` SET `device_id`=?, `test_item_id`=?, `ppm_output`=?, `floor`=?, `resolution`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Manual has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteCalManual: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `cal_manuals` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Calibration Manual has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteCalManualAll: function (req, res) {
    c.query("DELETE FROM `cal_manuals`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Calibration Manual has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
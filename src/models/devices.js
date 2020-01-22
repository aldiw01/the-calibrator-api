const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // DEVICE MODELS

  getDeviceAll: function (req, res) {
    c.query("SELECT * FROM `devices`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          manufacturer: items[2],
          model: items[3],
          serial_number: items[4],
          owner: items[5],
          issue_date: items[6],
          calibration_date: items[7],
          due_date: items[8],
          calibration_period: items[9],
          defect_status: items[10],
          documentation: items[11],
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
  getDevice: function (req, res) {
    c.query("SELECT * FROM `devices` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          name: items[1],
          manufacturer: items[2],
          model: items[3],
          serial_number: items[4],
          owner: items[5],
          issue_date: items[6],
          calibration_date: items[7],
          due_date: items[8],
          calibration_period: items[9],
          defect_status: items[10],
          documentation: items[11],
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
  newDevice: function (req, res) {
    const waktu = new Date().toISOString();
    var id = req.id || 'D' + new Date(waktu).valueOf().toString(32).toUpperCase()
    var request = [id, req.name, req.manufacturer, req.model, req.serial_number, req.owner, req.issue_date, req.calibration_date, req.due_date, req.calibration_period, req.defect_status, req.documentation];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `devices`(`id`, `name`, `manufacturer`, `model`, `serial_number`, `owner`, `issue_date`, `calibration_date`, `due_date`, `calibration_period`, `defect_status`, `documentation`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Device has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateDevice: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.name, req.manufacturer, req.model, req.serial_number, req.owner, req.issue_date, req.calibration_date, req.due_date, req.calibration_period, req.defect_status, waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `name`=?, `manufacturer`=?, `model`=?, `serial_number`=?, `owner`=?, `issue_date`=?, `calibration_date`=?, `due_date`=?, `calibration_period`=?, `defect_status`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Device has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deactivateDevice: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `defect_status`='1', `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Device has deactivate successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteDevice: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `devices` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Device has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteDeviceAll: function (req, res) {
    c.query("DELETE FROM `devices`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Device has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
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

  getMeasuringEquipmentAll: function (req, res) {
    c.query("SELECT * FROM `measuring_equipment`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          request_id: items[1],
          device_name: items[2],
          manufacturer: items[3],
          model: items[4],
          serial_number: items[5],
          device_id: items[6]
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
  getMeasuringEquipment: function (req, res) {
    c.query("SELECT * FROM `measuring_equipment` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          request_id: items[1],
          device_name: items[2],
          manufacturer: items[3],
          model: items[4],
          serial_number: items[5],
          device_id: items[6]
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
  getMeasuringEquipmentRequest: function (req, res) {
    c.query("SELECT * FROM `measuring_equipment` WHERE request_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          request_id: items[1],
          device_name: items[2],
          manufacturer: items[3],
          model: items[4],
          serial_number: items[5],
          device_id: items[6]
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
  getMeasuringEquipmentDeviceID: function (req, res) {
    c.query("SELECT * FROM `measuring_equipment` WHERE device_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          request_id: items[1],
          device_name: items[2],
          manufacturer: items[3],
          model: items[4],
          serial_number: items[5],
          device_id: items[6]
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
  newMeasuringEquipment: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [
      'M' + new Date(waktu).valueOf().toString(32).toUpperCase(),
      req.request_id,
      req.device_name,
      req.manufacturer,
      req.model,
      req.serial_number,
      req.device_id,
    ];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `measuring_equipment`(`id`, `request_id`, `device_name`, `manufacturer`, `model`, `serial_number`, `device_id`) VALUES (?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Measuring Equipment has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateMeasuringEquipment: function (req, res) {
    var request = [req.device_name, req.manufacturer, req.model, req.serial_number, req.device_id, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `measuring_equipment` SET `device_name`=?, `manufacturer`=?, `model`=?, `serial_number`=?, `device_id`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Measuring Equipment has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteMeasuringEquipment: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `measuring_equipment` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Measuring Equipment has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteMeasuringEquipmentAll: function (req, res) {
    c.query("DELETE FROM `measuring_equipment`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Measuring Equipment has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
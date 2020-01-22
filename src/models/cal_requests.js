const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CALIBRATION REQUEST MODELS

  getCalRequestAll: function (req, res) {
    c.query("SELECT * FROM `cal_requests`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequest: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequestEngineer: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE test_engineer_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequestRequestor: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE requestor_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequestDevice: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE device_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequestCalStep: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE cal_step_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  getCalRequestCertificate: function (req, res) {
    c.query("SELECT * FROM `cal_requests` WHERE cal_certificate_id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          test_engineer_id: items[1],
          requestor_id: items[2],
          device_id: items[3],
          cal_step_id: items[4],
          cal_certificate_id: items[5],
          created: items[6],
          updated: items[7]
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
  newCalRequest: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.id, req.test_engineer_id, req.requestor_id, req.device_id, req.cal_step_id, req.cal_certificate_id, waktu, waktu];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `cal_requests`(`id`, `test_engineer_id`, `requestor_id`, `device_id`, `cal_step_id`, `cal_certificate_id`, `created`, `updated`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Request has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCalRequest: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.test_engineer_id, req.requestor_id, req.device_id, req.cal_step_id, req.cal_certificate_id, waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `cal_requests` SET `test_engineer_id`=?, `requestor_id`=?, `device_id`=?, `cal_step_id`=?, `cal_certificate_id`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Calibration Request has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteCalRequest: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `cal_requests` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Calibration Request has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteCalRequestAll: function (req, res) {
    c.query("DELETE FROM `cal_requests`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Calibration Request has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
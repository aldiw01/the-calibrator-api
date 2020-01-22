const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CALIBRATION CERTIFICATE MODELS

  getCertificateAll: function (req, res) {
    c.query("SELECT * FROM `cal_certificates`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          calibration_date: items[2],
          due_date: items[3],
          test_engineer_id: items[4],
          certificate_file: items[5]
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
  getCertificate: function (req, res) {
    c.query("SELECT * FROM `cal_certificates` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          calibration_date: items[2],
          due_date: items[3],
          test_engineer_id: items[4],
          certificate_file: items[5]
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
  newCertificate: function (req, res) {
    var request = [req.id, req.device_id, req.calibration_date, req.due_date, req.test_engineer_id, req.certificate_file];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `cal_certificates`(`id`, `device_id`, `calibration_date`, `due_date`, `test_engineer_id`, `certificate_file`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Certificate has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCertificate: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.device_id, req.calibration_date, req.due_date, req.test_engineer_id, waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `cal_certificates` SET `device_id`=?, `calibration_date`=?, `due_date`=?, `test_engineer_id`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Certificate has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteCertificate: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `cal_certificates` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Certificate has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteCertificateAll: function (req, res) {
    c.query("DELETE FROM `cal_certificates`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Certificate has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
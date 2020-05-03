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
    c.query("SELECT Req.`id`, Req.`lab`, Req.`request_type`, Req.`device_name`, Req.`manufacturer`, Req.`model`, Req.`serial_number`, Req.`capacity`, Req.`made_in`, Req.`test_reference`, Req.`company_name`, Req.`company_address`, Req.`created`, Req.`start_target`, Req.`finished_target`, Req.`actual_start`, Req.`actual_finished`, TE1.`name`, IFNULL(TE2.`name`, ''), IFNULL(TE3.`name`, ''), Req.`documentation` FROM `cal_requests` Req LEFT OUTER JOIN `test_engineers` TE1 ON Req.`engineer_1` = TE1.`id` LEFT OUTER JOIN `test_engineers` TE2 ON Req.`engineer_2` = TE2.`id` LEFT OUTER JOIN `test_engineers` TE3 ON Req.`engineer_3` = TE3.`id`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          lab: items[1],
          request_type: items[2],
          device_name: items[3],
          manufacturer: items[4],
          model: items[5],
          serial_number: items[6],
          capacity: items[7],
          made_in: items[8],
          test_reference: items[9],
          company_name: items[10],
          company_address: items[11],
          created: items[12],
          start_target: items[13],
          finished_target: items[14],
          actual_start: items[15],
          actual_finished: items[16],
          engineer_1: items[17],
          engineer_2: items[18],
          engineer_3: items[19],
          documentation: items[20]
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
    c.query("SELECT Req.`id`, Req.`lab`, Req.`request_type`, Req.`device_name`, Req.`manufacturer`, Req.`model`, Req.`serial_number`, Req.`capacity`, Req.`made_in`, Req.`test_reference`, Req.`company_name`, Req.`company_address`, Req.`created`, Req.`start_target`, Req.`finished_target`, Req.`actual_start`, Req.`actual_finished`, TE1.`name`, IFNULL(TE2.`name`, ''), IFNULL(TE3.`name`, ''), Req.`documentation` FROM `cal_requests` Req LEFT OUTER JOIN `test_engineers` TE1 ON Req.`engineer_1` = TE1.`id` LEFT OUTER JOIN `test_engineers` TE2 ON Req.`engineer_2` = TE2.`id` LEFT OUTER JOIN `test_engineers` TE3 ON Req.`engineer_3` = TE3.`id` WHERE Req.`id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          lab: items[1],
          request_type: items[2],
          device_name: items[3],
          manufacturer: items[4],
          model: items[5],
          serial_number: items[6],
          capacity: items[7],
          made_in: items[8],
          test_reference: items[9],
          company_name: items[10],
          company_address: items[11],
          created: items[12],
          start_target: items[13],
          finished_target: items[14],
          actual_start: items[15],
          actual_finished: items[16],
          engineer_1: items[17],
          engineer_2: items[18],
          engineer_3: items[19],
          documentation: items[20]
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
  getCalRequestLab: function (req, res) {
    c.query("SELECT Req.`id`, Req.`lab`, Req.`request_type`, Req.`device_name`, Req.`manufacturer`, Req.`model`, Req.`serial_number`, Req.`capacity`, Req.`made_in`, Req.`test_reference`, Req.`company_name`, Req.`company_address`, Req.`created`, Req.`start_target`, Req.`finished_target`, Req.`actual_start`, Req.`actual_finished`, TE1.`name`, IFNULL(TE2.`name`, ''), IFNULL(TE3.`name`, ''), Req.`documentation` FROM `cal_requests` Req LEFT OUTER JOIN `test_engineers` TE1 ON Req.`engineer_1` = TE1.`id` LEFT OUTER JOIN `test_engineers` TE2 ON Req.`engineer_2` = TE2.`id` LEFT OUTER JOIN `test_engineers` TE3 ON Req.`engineer_3` = TE3.`id` WHERE Req.`lab`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          lab: items[1],
          request_type: items[2],
          device_name: items[3],
          manufacturer: items[4],
          model: items[5],
          serial_number: items[6],
          capacity: items[7],
          made_in: items[8],
          test_reference: items[9],
          company_name: items[10],
          company_address: items[11],
          created: items[12],
          start_target: items[13],
          finished_target: items[14],
          actual_start: items[15],
          actual_finished: items[16],
          engineer_1: items[17],
          engineer_2: items[18],
          engineer_3: items[19],
          documentation: items[20]
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
    c.query("SELECT Req.`id`, Req.`lab`, Req.`request_type`, Req.`device_name`, Req.`manufacturer`, Req.`model`, Req.`serial_number`, Req.`capacity`, Req.`made_in`, Req.`test_reference`, Req.`company_name`, Req.`company_address`, Req.`created`, Req.`start_target`, Req.`finished_target`, Req.`actual_start`, Req.`actual_finished`, TE1.`name`, IFNULL(TE2.`name`, ''), IFNULL(TE3.`name`, ''), Req.`documentation` FROM `cal_requests` Req LEFT OUTER JOIN `test_engineers` TE1 ON Req.`engineer_1` = TE1.`id` LEFT OUTER JOIN `test_engineers` TE2 ON Req.`engineer_2` = TE2.`id` LEFT OUTER JOIN `test_engineers` TE3 ON Req.`engineer_3` = TE3.`id` WHERE Req.`engineer_1`=? OR Req.`engineer_2`=? OR Req.`engineer_3`=?", [req.id, req.id, req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          lab: items[1],
          request_type: items[2],
          device_name: items[3],
          manufacturer: items[4],
          model: items[5],
          serial_number: items[6],
          capacity: items[7],
          made_in: items[8],
          test_reference: items[9],
          company_name: items[10],
          company_address: items[11],
          created: items[12],
          start_target: items[13],
          finished_target: items[14],
          actual_start: items[15],
          actual_finished: items[16],
          engineer_1: items[17],
          engineer_2: items[18],
          engineer_3: items[19],
          documentation: items[20]
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
  getCalRequestType: function (req, res) {
    c.query("SELECT Req.`id`, Req.`lab`, Req.`request_type`, Req.`device_name`, Req.`manufacturer`, Req.`model`, Req.`serial_number`, Req.`capacity`, Req.`made_in`, Req.`test_reference`, Req.`company_name`, Req.`company_address`, Req.`created`, Req.`start_target`, Req.`finished_target`, Req.`actual_start`, Req.`actual_finished`, TE1.`name`, IFNULL(TE2.`name`, ''), IFNULL(TE3.`name`, ''), Req.`documentation` FROM `cal_requests` Req LEFT OUTER JOIN `test_engineers` TE1 ON Req.`engineer_1` = TE1.`id` LEFT OUTER JOIN `test_engineers` TE2 ON Req.`engineer_2` = TE2.`id` LEFT OUTER JOIN `test_engineers` TE3 ON Req.`engineer_3` = TE3.`id` WHERE Req.`request_type`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          id: items[0],
          lab: items[1],
          request_type: items[2],
          device_name: items[3],
          manufacturer: items[4],
          model: items[5],
          serial_number: items[6],
          capacity: items[7],
          made_in: items[8],
          test_reference: items[9],
          company_name: items[10],
          company_address: items[11],
          created: items[12],
          start_target: items[13],
          finished_target: items[14],
          actual_start: items[15],
          actual_finished: items[16],
          engineer_1: items[17],
          engineer_2: items[18],
          engineer_3: items[19],
          documentation: items[20]
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
    var request = [req.id, req.lab, req.request_type, req.device_name, req.manufacturer, req.model, req.serial_number, req.capacity, req.made_in, req.test_reference, req.company_name, req.company_address, req.created, req.start_target, req.finished_target, req.actual_start, req.actual_finished, req.engineer_1, req.engineer_2, req.engineer_3, req.documentation];

    console.log(request)
    // SOME VALUE(S) CAN BE NULL

    c.query("INSERT INTO `cal_requests`(`id`, `lab`, `request_type`, `device_name`, `manufacturer`, `model`, `serial_number`, `capacity`, `made_in`, `test_reference`, `company_name`, `company_address`, `created`, `start_target`, `finished_target`, `actual_start`, `actual_finished`, `engineer_1`, `engineer_2`, `engineer_3`, `documentation`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Request has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateCalRequest: function (req, res) {
    var request = [req.device_name, req.manufacturer, req.model, req.serial_number, req.capacity, req.made_in, req.test_reference, req.company_name, req.company_address, req.created, req.start_target, req.finished_target, req.actual_start, req.actual_finished, req.id];

    // SOME VALUE(S) CAN BE NULL

    c.query("UPDATE `cal_requests` SET `device_name`=?, `manufacturer`=?, `model`=?, `serial_number`=?, `capacity`=?, `made_in`=?, `test_reference`=?, `company_name`=?, `company_address`=?, `created`=?, `start_target`=?, `finished_target`=?, `actual_start`=?, `actual_finished`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Request has updated successfully",
        success: true
      });
    });
    c.end();
  },
  updateCalRequestDocumentation: function (req, res) {
    var request = [req.body.documentation, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `cal_requests` SET `documentation`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Test Request Documentation has updated successfully",
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
          message: "Test Request has deleted successfully",
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
          message: "All Test Request has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
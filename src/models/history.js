const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // HISTORY MODELS

  getHistoryAll: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`step_name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` LEFT OUTER JOIN `test_engineers` e ON h.`test_engineer_id`=e.`id` ORDER BY h.`created` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistory: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`step_name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` LEFT OUTER JOIN `test_engineers` e ON h.`test_engineer_id`=e.`id` WHERE h.`id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryReference: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`step_name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` LEFT OUTER JOIN `test_engineers` e ON h.`test_engineer_id`=e.`id` WHERE h.`reference_id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryEngineer: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`step_name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` LEFT OUTER JOIN `test_engineers` e ON h.`test_engineer_id`=e.`id` WHERE h.`test_engineer_id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryCalStep: function (req, res) {
    c.query("SELECT h.`reference_id`, e.`name`, s.`step_name`, s.`info`, s.`step_number`, h.`message`, h.`created` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` LEFT OUTER JOIN `test_engineers` e ON h.`test_engineer_id`=e.`id` WHERE h.`cal_step_id`=? ORDER BY h.`created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          reference_id: items[0],
          name: items[1],
          action: items[2],
          info: items[3],
          step_number: items[4],
          message: items[5],
          created: items[6]
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
  getHistoryRequestStep: function (req, res) {
    c.query("SELECT s.`step_number`, s.`step_name` FROM `history` h LEFT OUTER JOIN `cal_steps` s ON h.`cal_step_id`=s.`id` WHERE h.`reference_id`=? AND h.`cal_step_id` LIKE 'REQ%' ORDER BY h.`created` DESC LIMIT 1", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          step_number: items[0],
          step_name: items[1]
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
  newHistory: function (req, res) {
    const waktu = new Date().toISOString();
    var request = ['H' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.reference_id, req.test_engineer_id, req.cal_step_id, req.message, waktu];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `history`(`id`, `reference_id`, `test_engineer_id`, `cal_step_id`, `message`, `created`) VALUES (?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Action has recorded successfully",
        success: true
      });
    });
    c.end();
  },
  updateHistory: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.reference_id, req.test_engineer_id, req.cal_step_id, req.message, waktu, req.id];
    if (request.includes(undefined)) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `history` SET `reference_id`=?, `test_engineer_id`=?, `cal_step_id`=?, `message`=?, `created`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "History has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deleteHistory: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `history` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "History has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteHistoryAll: function (req, res) {
    c.query("DELETE FROM `history`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All History has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
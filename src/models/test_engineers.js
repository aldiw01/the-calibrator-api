const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // TEST ENGINEER MODELS

  getEngineerAll: function (req, res) {
    c.query("SELECT * FROM `test_engineers`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          lab: items[2],
          // password: items[3],
          email: items[4],
          role: items[5],
          photo: items[6],
          registered: items[7],
          updated: items[8]
        });
      });
      if (data.length < 1) {
        res.status(404).send('Data not found.');
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getEngineer: function (req, res) {
    c.query("SELECT * FROM `test_engineers` WHERE `id`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          lab: items[2],
          // password: items[3],
          email: items[4],
          role: items[5],
          photo: items[6],
          registered: items[7],
          updated: items[8]
        });
      });
      if (data.length < 1) {
        res.status(404).send('Data not found.');
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getEngineerRole: function (req, res) {
    c.query("SELECT * FROM `test_engineers` WHERE `role`=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          lab: items[2],
          // password: items[3],
          email: items[4],
          role: items[5],
          photo: items[6],
          registered: items[7],
          updated: items[8]
        });
      });
      if (data.length < 1) {
        res.status(404).send('Data not found.');
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  getEngineerSearch: function (req, res) {
    var request = ["%" + req.id + "%", "%" + req.id + "%"];
    c.query("SELECT * FROM `test_engineers` WHERE `id` LIKE ? OR `name` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          lab: items[2],
          // password: items[3],
          email: items[4],
          role: items[5],
          photo: items[6],
          registered: items[7],
          updated: items[8]
        });
      });
      if (data.length < 1) {
        res.status(404).send('Data not found.');
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  newEngineer: function (req, password, res) {
    const waktu = new Date().toISOString();
    var request = [req.id, req.name, req.lab, password, req.email, waktu, waktu];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("INSERT INTO `test_engineers`(`id`, `name`, `lab`, `password`, `email`, `role`, `registered`, `updated`) VALUES (?, ?, ?, ?, ?, '1', ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Engineer has registered successfully",
        success: true
      });
    });
    c.end();
  },
  updateEngineer: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.name, req.lab, req.email, waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_engineers` SET `name`=?, `lab`=?, `email`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Engineer has updated successfully",
        success: true
      });
    });
    c.end();
  },
  updateEngineerPhoto: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.body.photo, waktu, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_engineers` SET `photo`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Profile photo has updated successfully",
        success: true
      });
    });
    c.end();
  },
  deactivateEngineer: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_engineers` SET `status`='9', `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Engineer has deactivate successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteEngineer: function (req, res) {
    var request = [req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("DELETE FROM `test_engineers` WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "Engineer has deleted successfully",
          success: true
        });
      }
    });
    c.end();
  },
  deleteEngineerAll: function (req, res) {
    c.query("DELETE FROM `test_engineers`", null, { metadata: true, useArray: true }, function (err, rows) {
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
          message: "All Engineer has deleted successfully :[",
          success: true
        });
      }
    });
    c.end();
  }
}
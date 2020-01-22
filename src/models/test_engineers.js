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
    c.query("SELECT * FROM `test_engineers` ORDER BY `created` DESC", null, { metadata: true, useArray: true }, function (err, rows) {
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
          codename: items[3],
          // password: items[4],
          email: items[5],
          role: items[6],
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
    c.query("SELECT * FROM `test_engineers` WHERE id=?", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          codename: items[3],
          // password: items[4],
          email: items[5],
          role: items[6],
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
    c.query("SELECT * FROM `test_engineers` WHERE role=? ORDER BY `created` DESC", [req.id], { metadata: true, useArray: true }, function (err, rows) {
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
          codename: items[3],
          // password: items[4],
          email: items[5],
          role: items[6],
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
    var request = ['E' + new Date(waktu).valueOf().toString(32).toUpperCase(), req.name, req.lab, req.codename, password, req.email, waktu, waktu];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    // c.query("INSERT INTO `verification_token`(`email`, `token`, `status`, `created`, `updated`) VALUES (?, ?, '0', ?, ?)", [req.email, req.token, waktu, waktu], { metadata: true, useArray: true }, function (err, rows) {
    //   if (err) {
    //     res.status(500).send({ message: "Error 500: Internal Server Error" });
    //     console.log(err);
    //     return
    //   }

    //   mailService.sendVerification(req.email, req.name, req.token);
    // });
    c.query("INSERT INTO `test_engineers`(`id`, `name`, `lab`, `codename`, `password`, `email`, `role`, `registered`, `updated`) VALUES (?, ?, ?, ?, ?, ?, '0', ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
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
    var request = [req.name, req.lab, req.codename, req.email, waktu, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_engineers` SET `name`=?, `lab`=?, `codename`=?, `email`=?, `updated`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
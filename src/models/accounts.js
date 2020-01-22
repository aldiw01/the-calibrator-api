const Client = require('mariasql');
const c = new Client({
  host: process.env.APP_DATABASE_HOST,
  user: process.env.APP_DATABASE_USER,
  password: process.env.APP_DATABASE_PASSWORD,
  db: process.env.APP_DATABASE_DB
});

module.exports = {

  /////////////////////////////////////////////////////////////////////////////////////////////
  // ACCOUNT MODELS

  cekLogin: function (email, pass, callback) {
    var req = [email, pass];
    c.query("SELECT * FROM `test_engineers` WHERE `email`=? AND `password`=?", req, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      if (rows.info.numRows !== '0') {
        rows.forEach(function (items) {
          data.push({
            id: items[0],
            name: items[1],
            lab: items[2],
            codename: items[3],
            email: items[5],
            role: items[6],
            registered: items[7],
            updated: items[8]
          });
        });
      }
      callback(err, data);
    });
    c.end();
  },

  /////////////////////////////////////////////////////////////////////////////////////////////
  // VERIFICATION

  verifyToken: function (req, res) {
    const waktu = new Date().toISOString();
    c.query("SELECT `email`, `status` FROM `verification_token` WHERE `token`=? AND (`status`=0 OR `status`=2)", [req.token], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      if (rows.info.numRows !== '0') {
        rows.forEach(function (items) {
          if (items[1] === '2') {
            c.query("UPDATE `verification_token` SET `status`='3', `updated`=? WHERE `token`=?", [waktu, req.token], { metadata: true, useArray: true }, function (err, rows) {
              if (err) {
                res.status(500).send({ message: "Error 500: Internal Server Error" });
                console.log(err);
                return
              }
            });
            c.query("UPDATE `test_engineers` SET status='1', `updated`=? WHERE `email`=? AND `id` LIKE 'A%'", [waktu, items[0]], { metadata: true, useArray: true }, function (err, rows) {
              if (err) {
                res.status(500).send({ message: "Error 500: Internal Server Error" });
                console.log(err);
                return
              }

              res.json({
                success: true,
                err: null,
                message: "Thank you for verifying your email. Please wait until our staff validate your data."
              });
            });
          } else {
            c.query("UPDATE `verification_token` SET `status`='1', `updated`=? WHERE `token`=?", [waktu, req.token], { metadata: true, useArray: true }, function (err, rows) {
              if (err) {
                res.status(500).send({ message: "Error 500: Internal Server Error" });
                console.log(err);
                return
              }
            });
            c.query("UPDATE `test_engineers` SET status='1', `updated`=? WHERE `email`=? AND `id` LIKE 'U%'", [waktu, items[0]], { metadata: true, useArray: true }, function (err, rows) {
              if (err) {
                res.status(500).send({ message: "Error 500: Internal Server Error" });
                console.log(err);
                return
              }

              res.json({
                success: true,
                err: null,
                message: "Thank you for verifying your email. Please wait until our staff validate your data."
              });
            });
          }
        });
      } else {
        res.json({
          success: false,
          err: null,
          message: "Invalid token!"
        });
      }
    });
    c.end();
  },
  verifyUser: function (req, res) {
    const waktu = new Date().toISOString();
    var request = [req.id, waktu, waktu];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `test_engineers` SET `status`='2', `updated`=? WHERE `id`=? AND `id` LIKE 'U%'", [waktu, req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "User has verified successfully",
        success: true
      });
    });
    c.end();
  },
  checkVerified: function (req, res) {
    c.query("SELECT `status` FROM `test_engineers` WHERE `id`=? AND `status`=1", [req.id], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      if (rows.info.numRows !== '0') {
        res.json({
          success: true,
          err: null,
          message: "User was already verified"
        });
      } else {
        res.json({
          success: false,
          err: null,
          message: "User is not verified"
        });
      }
    });
    c.end();
  },

  /////////////////////////////////////////////////////////////////////////////////////////////
  // FORGOT PASSWORD

  forgotPassword(req, res, token) {
    const expired = new Date().valueOf() + 3 * 60 * 60 * 1000;
    const waktu = new Date().toISOString()
    var request = [req.email, token, expired, waktu, waktu];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("SELECT `name` FROM `test_engineers` WHERE `email`=? AND `id` LIKE 'U%'", [req.email], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          name: items[0]
        });
      });
      if (data.length < 1) {
        res.send({
          message: "User is not registered",
          success: false
        });
      } else {
        c.query("INSERT INTO `reset_password` (`email`, `token`, `expired`, `status`, `created`, `updated`) VALUES (?, ?, ?, 0, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
          if (err) {
            res.status(500).send({ message: "Error 500: Internal Server Error" });
            console.log(err);
            return
          }

          mailService.sendResetPassword(req.email, data[0].name, token, res);
        });
      }
    });
    c.end();
  },
  forgotPassword_getToken(req, res) {
    c.query("SELECT `email`, `expired`, `status` FROM `reset_password` WHERE `token`=? AND (`status`=0 OR `status`=2)", [req.token], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        data.push({
          email: items[0],
          expired: items[1],
          status: items[2]
        });
      });
      if (data.length < 1) {
        res.json({
          message: "Token not found",
          success: false,
          err: null,
          affectedRows: rows.info.affectedRows
        });
      } else {
        res.json(data);
      }
    });
    c.end();
  },
  forgotPassword_editPassword: function (req, password, res) {
    const waktu = new Date().toISOString();
    c.query("UPDATE `test_engineers` SET `password`=?, `updated`=? WHERE `email`=? AND `id` LIKE 'U%'", [password, waktu, req.email], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }
      res.json({
        message: "Your password has changed successfully",
        success: true,
        affectedRows: rows.info.affectedRows
      });
    });
    c.query("UPDATE `reset_password` SET `status`=1, `updated`=? WHERE `token`=?", [waktu, req.token], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }
    });

    c.end();
  },

  /////////////////////////////////////////////////////////////////////////////////////////////
  // CHECK REGISTERED

  checkUserRegistered: function (req, res) {
    c.query("SELECT * FROM `test_engineers` WHERE `email`=? AND `id` LIKE 'U%'", [req.email], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      if (rows.info.numRows !== '0') {
        res.json({
          success: true,
          err: null,
          message: "email already registered"
        });
      } else {
        res.json({
          success: false,
          err: null,
          message: "email not registered"
        });
      }
    });
    c.end();
  },
  deleteVerificationToken: function (req, res) {
    c.query("DELETE FROM `verification_token`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        message: "All Verification Token has deleted successfully :[",
        success: true
      });
    });
    c.end();
  },
  deleteResetPasswordToken: function (req, res) {
    c.query("DELETE FROM `reset_password`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        message: "All Reset Password Token has deleted successfully :[",
        success: true
      });
    });
    c.end();
  },
  deleteInactiveToken: function (req, res) {
    const waktu = new Date().valueOf();
    c.query("DELETE FROM `reset_password` WHERE `status`=1 OR `status`=3 OR `expired`<?", [waktu], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }
    });
    c.query("DELETE FROM `verification_token` WHERE `status`=1 OR `status`=3", [waktu], { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        message: "All Inactive Token has deleted successfully :]",
        success: true
      });
    });
    c.end();
  },

}

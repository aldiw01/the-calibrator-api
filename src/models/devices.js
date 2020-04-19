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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
  getDeviceOwner: function (req, res) {
    const owner = "%" + req.id + "%"
    c.query("SELECT * FROM `devices` WHERE id LIKE ?", [owner], { metadata: true, useArray: true }, function (err, rows) {
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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
  getDeviceDashboard: function (req, res) {
    var waktu = new Date().toISOString().split("T");
    // var cal, cab, dev, ene, tra, tot, d_cal, d_cab, d_dev, d_ene, d_tra, d_tot, u_cal, u_cab, u_dev, u_ene, u_tra, u_tot;
    var data = {
      cal: '', cab: '', dev: '', ene: '', tra: '', tot: '',
      d_cal: '', d_cab: '', d_dev: '', d_ene: '', d_tra: '', d_tot: '',
      u_cal: '', u_cab: '', u_dev: '', u_ene: '', u_tra: '', u_tot: '',
      l_cal: '', l_cab: '', l_dev: '', l_ene: '', l_tra: '', l_tot: '',
    }
    c.query("SELECT * FROM `devices`", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
      data.tot = rows.info.numRows;
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAL%'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.cal = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAB%'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.cab = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%TRA%'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.tra = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CPE%'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.dev = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%ENE%'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.ene = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAL%' AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_cal = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAB%' AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_cab = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%TRA%' AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_tra = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CPE%' AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_dev = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%ENE%' AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_ene = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.d_tot = rows.info.numRows;
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAL%' AND `calibration_object` = 1 AND `due_date` < ? AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_cal = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_cal = "All OK"
        } else {
          data.l_cal = result
        }
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CAB%' AND `calibration_object` = 1 AND `due_date` < ? AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_cab = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_cab = "All OK"
        } else {
          data.l_cab = result
        }
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%TRA%' AND `calibration_object` = 1 AND `due_date` < ? AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_tra = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_tra = "All OK"
        } else {
          data.l_tra = result
        }
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%CPE%' AND `calibration_object` = 1 AND `due_date` < ? AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_dev = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_dev = "All OK"
        } else {
          data.l_dev = result
        }
      });
      c.query("SELECT * FROM `devices` WHERE `id` LIKE '%ENE%' AND `calibration_object` = 1 AND `due_date` < ? AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_ene = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_ene = "All OK"
        } else {
          data.l_ene = result
        }
      });
      c.query("SELECT * FROM `devices` WHERE `due_date` < ? AND `calibration_object` = 1 AND `defect_status`='0' ORDER BY `due_date`", [waktu[0]], { metadata: true, useArray: true }, function (err, rows) {
        if (err) { res.status(500).send({ message: "Error 500: Internal Server Error" }); return }
        data.u_tot = rows.info.numRows;
        var result = []
        rows.forEach(function (items) {
          result.push({
            id: items[0]
          });
        });
        if (rows.info.numRows < 1) {
          data.l_tot = "All OK"
        } else {
          data.l_tot = result
        }
        res.json(data);
      });
    });
    c.end();
  },
  getDeviceDefectStatus: function (req, res) {
    var query = '';
    const request = ["%" + req.lab + "%"]
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    if (req.id === "0") {
      query = "SELECT * FROM `devices` WHERE `defect_status`=0 AND id LIKE ?";
    } else {
      query = "SELECT * FROM `devices` WHERE `defect_status`!=0 AND id LIKE ?";
    }
    c.query(query, request, { metadata: true, useArray: true }, function (err, rows) {
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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
  getDeviceCalibrationStatus: function (req, res) {
    var waktu = new Date().toISOString().split("T");
    const request = [waktu[0], "%" + req.lab + "%"]
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("SELECT * FROM `devices` WHERE `due_date`<? AND `id` LIKE ? AND `defect_status`='0' AND `calibration_object` = 1", request, { metadata: true, useArray: true }, function (err, rows) {
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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
  getDeviceRegularCheckScheduleAll: function (req, res) {
    c.query("SELECT * FROM `devices` WHERE calibration_object = 1 AND `defect_status`='0'", null, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        const start = new Date(items[6]).valueOf()
        const end = new Date(items[7]).valueOf()
        const test_interval = items[11]
        var num_check = Math.floor((end - start) / (test_interval * 31 * 24 * 60 * 60 * 1000))
        for (var i = 1; i <= num_check; i++) {
          data.push({
            id: items[0],
            name: items[1],
            manufacturer: items[2],
            model: items[3],
            calibration_date: items[6],
            due_date: items[7],
            calibration_method: items[13],
            documentation: items[16],
            regular_check_date: new Date(items[6]).valueOf() + (i * test_interval * 30 * 24 * 60 * 60 * 1000),
            type: "intermediate check"
          });
        }
        data.push({
          id: items[0],
          name: items[1],
          manufacturer: items[2],
          model: items[3],
          calibration_date: items[6],
          due_date: items[7],
          calibration_method: items[13],
          documentation: items[16],
          regular_check_date: items[7],
          type: "calibration"
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
  getDeviceRegularCheckSchedule: function (req, res) {
    const request = ["%" + req.id + "%"]
    c.query("SELECT * FROM `devices` WHERE calibration_object = 1 AND `defect_status`='0' AND `id` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      var data = [];
      rows.forEach(function (items) {
        const start = new Date(items[6]).valueOf()
        const end = new Date(items[7]).valueOf()
        const test_interval = items[11]
        var num_check = Math.floor((end - start) / (test_interval * 31 * 24 * 60 * 60 * 1000))
        for (var i = 1; i <= num_check; i++) {
          data.push({
            id: items[0],
            name: items[1],
            manufacturer: items[2],
            model: items[3],
            calibration_date: items[6],
            due_date: items[7],
            calibration_method: items[13],
            documentation: items[16],
            regular_check_date: new Date(items[6]).valueOf() + (i * test_interval * 30 * 24 * 60 * 60 * 1000),
            type: "intermediate check"
          });
        }
        data.push({
          id: items[0],
          name: items[1],
          manufacturer: items[2],
          model: items[3],
          calibration_date: items[6],
          due_date: items[7],
          calibration_method: items[13],
          documentation: items[16],
          regular_check_date: items[7],
          type: "calibration"
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
  getDeviceSearch: function (req, res) {
    const request = ["%" + req.id + "%", "%" + req.id + "%"]
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("SELECT * FROM `devices` WHERE `id` LIKE ? OR `name` LIKE ?", request, { metadata: true, useArray: true }, function (err, rows) {
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
          defect_status: items[5],
          calibration_date: items[6],
          due_date: items[7],
          calibration_period: items[8],
          supervisor: items[9],
          issue_date: items[10],
          test_interval: items[11],
          calibration_object: items[12],
          calibration_method: items[13],
          manual_file: items[14],
          spec_file: items[15],
          documentation: items[16]
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
    var request = [id, req.name, req.manufacturer, req.model, req.serial_number, req.defect_status, req.calibration_date, req.due_date, req.calibration_period, req.supervisor, req.issue_date, req.test_interval, req.calibration_object, req.calibration_method, req.manual_file, req.spec_file, req.documentation];
    console.log(request)
    // if (request.includes(undefined) || request.includes("")) {
    //   res.send({ message: 'Bad Request: Parameters cannot empty.' });
    //   return
    // }
    c.query("INSERT INTO `devices`(`id`, `name`, `manufacturer`, `model`, `serial_number`, `defect_status`, `calibration_date`, `due_date`, `calibration_period`, `supervisor`, `issue_date`, `test_interval`, `calibration_object`, `calibration_method`, `manual_file`, `spec_file`, `documentation`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", request, { metadata: true, useArray: true }, function (err, rows) {
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
    var request = [req.name, req.manufacturer, req.model, req.serial_number, req.defect_status, req.calibration_date, req.due_date, req.calibration_period, req.supervisor, req.issue_date, req.test_interval, req.calibration_object, req.calibration_method, req.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `name`=?, `manufacturer`=?, `model`=?, `serial_number`=?, `defect_status`=?, `calibration_date`=?, `due_date`=?, `calibration_period`=?, `supervisor`=?, `issue_date`=?, `test_interval`=?, `calibration_object`=?, `calibration_method`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
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
  updateDeviceDocumentation: function (req, res) {
    var request = [req.body.documentation, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `documentation`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Device documentation has updated successfully",
        success: true
      });
    });
    c.end();
  },
  updateDeviceManual: function (req, res) {
    var request = [req.body.manual_file, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `manual_file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Device manual file has updated successfully",
        success: true
      });
    });
    c.end();
  },
  updateDeviceSpecification: function (req, res) {
    var request = [req.body.spec_file, req.params.id];
    if (request.includes(undefined) || request.includes("")) {
      res.send({ message: 'Bad Request: Parameters cannot empty.' });
      return
    }
    c.query("UPDATE `devices` SET `spec_file`=? WHERE `id`=?", request, { metadata: true, useArray: true }, function (err, rows) {
      if (err) {
        res.status(500).send({ message: "Error 500: Internal Server Error" });
        console.log(err);
        return
      }

      res.json({
        affectedRows: rows.info.affectedRows,
        err: null,
        message: "Device specification file has updated successfully",
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

      if (rows.info.numRows < 1) {
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
"use strict"

var spawn = require("child_process").spawn;

class Login {

  constructor(repository) {
    this._repository = repository;
  }

  run() {

    return new Promise((resolve, reject) => {
      let cvs = spawn("cvs", ["-d", this._repository.root, "login"], {
            stdio : ["ignore", "ignore", "pipe"]
          }),
          error = '';

      cvs.stderr.on("data", (data) => {
        error += data;
      });


      cvs.stdout.on("data", (data) => {
        cvs.stdin.write("passwd");
      });

      cvs.on("close", (code) => {

        if (code) {
	  return reject(error);
	}

        return resolve(true);
      });

    });
  }
}

module.exports = Login;

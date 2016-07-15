"use strict"

const spawn = require('child_process').spawn

class Init {

  constructor(repository) {
    this._repository = repository;
  }

  run() {

    return new Promise((resolve, reject) => {

      let cvs = spawn("cvs", ["-d", this._repository.root, "init"]),
          error = '';

      cvs.stderr.on('data', (data) => {
        error += data;
      });

      cvs.on("close", (code) => {

        if (code) {
          return reject(error)
        }

        resolve(true)
      })
    });

  }
}

module.exports = Init;

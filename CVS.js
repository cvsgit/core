"use strict"

var Init = require("./src/Command/init.js"),
    Login = require("./src/Command/login.js");

class Repository {

  construct(root) {
    this._root = root;
  }

  init() {

  }

  login() {

  }

  get root() {
    return this._root;
  }
}

module.exports = Repository;

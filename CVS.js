"use strict"

var Init = require("./src/Command/init.js"),
    Login = require("./src/Command/login.js");

class Repository {

  constructor(root) {
    this._root = root;
  }

  init() {
    var init = new Init(this);
    return init.run();
  }

  login() {

  }

  get root() {
    return this._root;
  }
}

module.exports = Repository;

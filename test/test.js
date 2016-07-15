var expect = require("chai").expect;
var fs = require("fs");

var cvs = require("../CVS");

describe("CVS", function() {

  describe("Init", function() {

    it ("Local", function() {

      var localrep = "/tmp/reptest";

      fs.mkdirSync(localrep)
      expect(fs.readdirSync(localrep)).to.have.length(0)

      var repo = new cvs(localrep);
      repo.init().catch(function(err) {
        throw err;
      })

      var dir = fs.readdirSync(localrep)
      expect(dir).to.have.length(1);
      expect(dir[0]).to.equal("CVSROOT");
    })
  })

});

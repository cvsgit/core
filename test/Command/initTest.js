var expect = require("chai").expect;
var fs = require("fs");
var rmdir = require("rmdir");
var path = require("path");

var cvs = require("../../CVS");

describe("Init", function() {

  beforeEach(function(done) {

    rmdir("test/fixtures/cvs_dir", function() {
      fs.mkdirSync("test/fixtures/cvs_dir");
      return done();
    });
  });

  describe("Local Repository", function() {

    it ("create repository", function(done) {

      var localrep = path.join(process.cwd(), "test/fixtures/cvs_dir");

      expect(fs.readdirSync(localrep)).to.have.length(0)

      var repo = new cvs(":local:" + localrep);

      repo.init().then(function() {

        var dir = fs.readdirSync(localrep)
        expect(dir).to.have.length(1);
        expect(dir[0]).to.equal("CVSROOT");
        return done();

      }).catch(done)

    })
  })

});

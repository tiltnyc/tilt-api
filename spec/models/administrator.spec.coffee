{ mongoose } = require '../spec_helper'
Administrator = mongoose.model('Administrator')

describe 'Administrator', ->
  describe '#save()', ->
    it 'saves without error', (done) ->
      admin = new Administrator(username: admin)
      admin.save(done)

SpecUploader = require('../spec_uploader')
expect = require('chai').expect

before ->
  @loader = new SpecUploader('https://greent.firebaseIO.com/test/items')

it 'can upload info'

ImageUploader = require '../image_upload'
expect = require('chai').expect

before ->
  @reader = new ImageUploader("../decks.coffee")


it 'reads a coffeescript json file', ->
  #assert(uploader)
  reader = new ImageUploader("../decks.coffee")

it 'can compile a brand', ->
  brand =
   comet:
    shred35:
      wb: "17.5"
      width: "9.5"
      thumb: "shred35.tiff"

  compiled =
      name: "shred35"
      brand: "comet"
      wb: "17.5"
      width: "9.5"
      thumb: "shred35.tiff"
  result = @reader.compile_brand(brand)[0]

  expect(result.brand).to.equal("comet")
  expect(result.name).to.equal("shred35")
  expect(compiled).to.deep.equal(result)

it 'can compile models with colors', ->


it 'compiles models into a firebase format', ->

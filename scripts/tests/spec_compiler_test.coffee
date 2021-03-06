SpecCompiler = require '../spec_compiler'
expect = require('chai').expect

before ->
  @compiler = new SpecCompiler("../decks.coffee", "../../skate-images")

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
  result = @compiler.compile_brand(brand)[0]

  #expect(result.brand).to.equal("comet")
  #expect(result.name).to.equal("shred35")
  expect(compiled).to.deep.equal(result)

it 'can compile models with colors', ->
  orig =
  poolking:
    dogstar:
      wb: "16"
      width: "9.5"
      colorways:
        red:
          thumb: "DogStar_Red.jpg"
        blue:
          thumb: "DogStar_Blue.jpg"

  compiled = [
        brand: "poolking"
        name: "dogstar_red"
        wb: "16"
        width: "9.5"
        color: "red"
        thumb: "DogStar_Red.jpg"
      ,
        brand: "poolking"
        name: "dogstar_blue"
        wb: "16"
        width: "9.5"
        color: "blue"
        thumb: "DogStar_Blue.jpg"
    ]
  console.log(@compiler.compile_brand(orig))
  expect(@compiler.compile_brand(orig)).to.deep.equal(compiled)

it 'compiles picture names into picture data', ->


it 'transforms a full spec file', ->



it 'compiles models into a firebase format', ->

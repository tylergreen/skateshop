# run from skateshop directory
# coffee scripts/spec_compiler.coffee

Firebase = require 'Firebase'
fs = require 'fs'
_ = require 'underscore'

deck_colorway = (deck_specs, name, color, images) ->
  copy = _.clone(deck_specs)
  copy.color = color
  copy.name = "#{name}_#{color}"
  _.extend(copy, images)

compile_deck = (brand, name, specs) ->
  specs.brand = brand
  if specs['colorways']
    deck_specs = _.omit(specs, 'colorways')
    (deck_colorway(deck_specs, name, color, images) for color, images of specs.colorways)
  else
    specs.name = name
    specs

class SpecCompiler
  constructor: (@spec_filename, @img_directory, @firebase_url) ->
    @fb_ref = new Firebase(@firebase_url)

  compile_brand: (brand_obj) ->
    brand_name = _.keys(brand_obj)[0]
    decks = brand_obj[brand_name]
    cs = (compile_deck(brand_name, name, specs) for name, specs of decks)
    deck_list = _.flatten(cs, true)

  compile_images: (deck_obj) ->
    filename = "#{@img_directory}/#{deck_obj.thumb}"
    img_data = fs.readFileSync(filename, {encoding: 'base64'})
    deck_obj.thumb = img_data
    deck_obj

  compile: ->
    deck_list = (@compile_brand(brand) for brand in require(@spec_filename))
    deck_list = _.flatten(deck_list, true)
    (@compile_images(deck) for deck in deck_list)

  upload: ->
    @fb_ref.child(i).set(deck) for deck, i in @compile()







#files = fs.readdirSync('../skate-images/')

# images = ({ name: file, data: fs.readFileSync("../skate-images/#{file}", {encoding: 'base64'}) } for file,i in files when file isnt '.DS_Store')

# fb_ref.child(i).set(image) for image, i in images

module.exports = SpecCompiler

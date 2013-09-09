# run rom skateshop directory
# coffee scripts/image_upload.coffee

fs = require 'fs'
Firebase = require 'Firebase'
fb_ref = new Firebase('https://greent.firebaseIO.com/items')
_ = require 'underscore'

# get file in directory
# get file names
# iterate over file names
# get file data
#

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

class ImageUpload
  constructor: (@filename) ->

  compile_brand: (brand_obj) ->
    brand_name = _.keys(brand_obj)[0]
    decks = brand_obj[brand_name]
    cs = (compile_deck(brand_name, name, specs) for name, specs of decks)
    _.flatten(cs, true)

#files = fs.readdirSync('../skate-images/')

# images = ({ name: file, data: fs.readFileSync("../skate-images/#{file}", {encoding: 'base64'}) } for file,i in files when file isnt '.DS_Store')

# fb_ref.child(i).set(image) for image, i in images

module.exports = ImageUpload

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

compile_deck = (brand, name, specs) ->
  specs.brand = brand
  specs.name = name
  specs

class ImageUpload
  constructor: (@filename) ->
    #decks = require(@filename)

  compile_brand: (brand_obj) ->
    brand_name = _.keys(brand_obj)[0]
    decks = brand_obj[brand_name]
    cs = (compile_deck(brand_name, name, specs) for name, specs of decks)
    cs





#files = fs.readdirSync('../skate-images/')

# images = ({ name: file, data: fs.readFileSync("../skate-images/#{file}", {encoding: 'base64'}) } for file,i in files when file isnt '.DS_Store')

# fb_ref.child(i).set(image) for image, i in images

module.exports = ImageUpload
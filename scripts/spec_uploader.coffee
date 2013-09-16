fs = require 'fs'
Firebase = require 'Firebase'

class SpecUploader
  constructor: (firebase_url) ->
    @fb_ref = new Firebase(firebase_url).push()


  write: (data) ->
    @fb_ref.set(data)

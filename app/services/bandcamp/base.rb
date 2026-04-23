module Bandcamp
  class Base < Muffon::Base
    SOURCE_NAME = 'bandcamp'.freeze
    BASE_LINK = 'https://bandcamp.com/api/mobile/22'.freeze
    MODELS_TYPES_DATA = {
      'artist' => 'b',
      'album' => 'a',
      'track' => 't'
    }.freeze
  end
end

module MusicBrainz
  class Base < Muffon::Base
    SOURCE_NAME = 'musicbrainz'.freeze
    BASE_LINK = 'https://musicbrainz.org/ws/2'.freeze

    private

    def params
      { fmt: 'json' }
    end
  end
end

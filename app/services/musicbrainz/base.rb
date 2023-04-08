module MusicBrainz
  class Base < Muffon::Base
    SOURCE_NAME = 'musicbrainz'.freeze
    BASE_LINK =
      'https://musicbrainz.org/ws/2'.freeze

    private

    def params
      { fmt: 'json' }
    end

    def model_name
      self.class::MODEL_NAME
    end

    def artist_data_formatted(artist)
      {
        source: artist_source_data(
          artist
        ),
        name: artist.dig(
          'artist', 'name'
        )
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist.dig(
          'artist', 'id'
        )
      }
    end

    def image_data_formatted(
      album_id,
      album_type = 'release'
    )
      MusicBrainz::Utils::Image.call(
        album_id:,
        album_type:
      )
    end

    alias artist_name artist_names
  end
end

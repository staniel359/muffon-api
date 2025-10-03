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

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data.dig(
          'artist',
          'name'
        )
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data.dig(
          'artist',
          'id'
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

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end

    def label_name_formatted(
      raw_label_data
    )
      raw_label_data['name']
    end

    alias artist_name artists_names
  end
end

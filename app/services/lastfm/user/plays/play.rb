module LastFM
  module User
    class Plays
      class Play < LastFM::User::Plays
        include LastFM::Utils::Track

        def call
          data
        end

        private

        def data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:,
            album: album_data,
            image: image_data,
            created: created_formatted
          }.compact
        end

        def title
          play['name']
        end

        def play
          @args[:play]
        end

        def artist_name
          play.dig(
            'artist', '#text'
          )
        end

        def album_data
          return if album_title.blank?

          {
            source: album_source_data,
            title: album_title
          }
        end

        def album_title
          play.dig(
            'album', '#text'
          )
        end

        def album_source_data
          { name: source_name }
        end

        def image_data
          LastFM::Utils::Image.call(
            image:
          )
        end

        def image
          play.dig(
            'image', -1, '#text'
          )
        end

        def created_formatted
          datetime_formatted(
            raw_created
          )
        end

        def raw_created
          play.dig(
            'date', '#text'
          ).to_datetime
        end
      end
    end
  end
end

module LastFM
  module User
    class Plays
      class Play < LastFM::User::Plays
        def call
          data
        end

        private

        def data
          {
            title:,
            artist: artist_data,
            album: album_data,
            image: image_data,
            created:
          }.compact
        end

        def title
          play['name']
        end

        def play
          @args[:play]
        end

        def artist_data
          { name: artist_name }
        end

        def artist_name
          play.dig(
            'artist', '#text'
          )
        end

        def album_data
          return if album_title.blank?

          { title: album_title }
        end

        def album_title
          @album_title ||= play.dig(
            'album', '#text'
          )
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

        def created
          play.dig(
            'date', '#text'
          ).to_datetime
        end
      end
    end
  end
end

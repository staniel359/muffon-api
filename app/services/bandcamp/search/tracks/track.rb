module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        include Bandcamp::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id:,
            source_id: SOURCE_ID,
            title:,
            bandcamp_slug:,
            bandcamp_model:,
            artists:
          }
        end

        def title
          model_title(track)
        end

        def track
          @args[:track]
        end

        def bandcamp_slug
          model_title_slug(track)
        end

        def bandcamp_model
          model_name(track)
        end

        def artists
          [model_artist_data(track)]
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            audio: audio_data
          }.compact
        end

        def album_data
          return if album_title.blank?

          {
            source_id: 'lastfm',
            title: album_title
          }
        end

        def album_title
          @album_title ||=
            track[:description].match(
              /from the album (.+)/
            ).try(:[], 1)
        end

        def image_data
          image_data_formatted(
            track[:image]
          )
        end

        def audio_data
          { source_id: SOURCE_ID }
        end
      end
    end
  end
end

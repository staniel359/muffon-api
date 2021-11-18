module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        include Muffon::Utils::Track

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
            player_id: player_id,
            source_id: SOURCE_ID,
            title: title,
            bandcamp_slug: bandcamp_slug,
            bandcamp_model: bandcamp_model,
            artist: artist_formatted,
            artists: artists
          }
        end

        def title
          model_title(track)
        end

        def track
          @args[:track]
        end

        def bandcamp_slug
          bandcamp_title_slug(track)
        end

        def bandcamp_model
          bandcamp_model_name(track)
        end

        def artists
          [artist_data_formatted(track)]
        end

        def track_extra_data
          {
            image: image_data,
            audio: audio_data
          }
        end

        def image_data
          image_data_formatted(
            track[:image], 'track'
          )
        end

        def audio_data
          { source_id: SOURCE_ID }
        end
      end
    end
  end
end

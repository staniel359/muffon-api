module Bandcamp
  module Search
    class Tracks
      class Track < Bandcamp::Search::Tracks
        MODEL_NAME = 'track'.freeze

        include Muffon::Utils::Track

        def call
          check_args

          with_query_match(
            title:,
            query_title: @args[:query_title],
            artist_name:,
            query_artist_name: @args[:query_artist_name]
          ) do
            data
          end
        end

        private

        def required_args
          %i[
            track
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data,
            audio: audio_minimal_data
          }.compact
        end

        def track
          @args[:track]
        end

        def album_data
          return if album_title.blank?

          {
            source: album_source_data,
            title: album_title
          }
        end

        def album_title
          track['album_name']
        end

        def album_source_data
          {
            name: source_name,
            id: album_bandcamp_id,
            artist_id: artist_bandcamp_id
          }
        end

        def album_bandcamp_id
          track['album_id']
        end

        def audio_present?
          true
        end

        alias model track
        alias title name
      end
    end
  end
end

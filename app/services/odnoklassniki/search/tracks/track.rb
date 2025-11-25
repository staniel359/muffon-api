module Odnoklassniki
  module Search
    class Tracks
      class Track < Odnoklassniki::Search::Tracks
        include Odnoklassniki::Utils::Track

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
            albums
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
            duration:,
            audio: audio_minimal_data
          }.compact
        end

        def track
          @args[:track]
        end

        def album_data
          return if album_id.blank?

          {
            source: album_source_data,
            title: album['name']
          }
        end

        def album_id
          track['albumId']
        end

        def album_source_data
          {
            name: source_name,
            id: album_id
          }
        end

        def album
          @args[:albums].find do |album_data|
            album_data['id'] == album_id
          end
        end

        def image
          track['imageUrl']
        end
      end
    end
  end
end

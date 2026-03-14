module Spotify
  module User
    class Tracks
      class Track < Spotify::User::Tracks
        include Spotify::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data,
            created: created_formatted,
            audio: audio_minimal_data
          }.compact
        end

        def raw_artists
          raw_track_data['artists']
        end

        def raw_track_data
          @args[:raw_track_data]['track']
        end

        def raw_images
          raw_album_data['images']
        end

        def raw_album_data
          raw_track_data['album']
        end

        def created_formatted
          datetime_formatted(
            raw_created
          )
        end

        def raw_created
          @args[:raw_track_data]['added_at'].to_datetime
        end

        def audio_present?
          true
        end
      end
    end
  end
end

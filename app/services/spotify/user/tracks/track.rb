module Spotify
  module User
    class Tracks
      class Track < Spotify::Base
        include Spotify::Mixins::Track

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
          Muffon::Formatter::Source::User::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: spotify_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_spotify_id,
            image_data:,
            creation_date:,
            is_audio_present: audio_present?,
            is_local: local_track?
          )
        end

        def raw_artists
          raw_track_data['artists'].map do |raw_artist_data|
            {
              name: raw_artist_data['name'],
              source_id: raw_artist_data['id']
            }
          end
        end

        def raw_track_data
          @args[:raw_track_data]['track']
        end

        def images
          raw_album_data['images']
        end

        def raw_album_data
          raw_track_data['album']
        end

        def raw_creation_date
          @args[:raw_track_data]['added_at'].to_datetime
        end

        def audio_present?
          true
        end
      end
    end
  end
end

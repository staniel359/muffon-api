module Spotify
  module Playlist
    class Tracks
      class Track < Spotify::Playlist::Tracks
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
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data,
            duration:,
            created: created_formatted,
            audio: audio_minimal_data
          }.compact_blank
        end

        def raw_track_data
          @args[:raw_track_data].dig(
            'itemV2',
            'data'
          )
        end

        def created_formatted
          datetime_formatted(
            raw_created
          )
        end

        def raw_created
          @args[:raw_track_data].dig(
            'addedAt',
            'isoString'
          ).to_datetime
        end

        def raw_duration
          raw_track_data.dig(
            'trackDuration',
            'totalMilliseconds'
          ) ||
            raw_track_data.dig(
              'localTrackDuration',
              'totalMilliseconds'
            )
        end

        def raw_artists
          super || [raw_artist_data]
        end

        def raw_artist_data
          {
            'profile' => {
              'name' => raw_artist_name
            }
          }
        end

        def raw_artist_name
          raw_track_data['artistName']
        end

        def raw_album_data
          super || { 'name' => raw_album_title }
        end

        def raw_album_title
          @args[:raw_track_data]['albumName']
        end
      end
    end
  end
end

module Spotify
  module Playlist
    class Tracks
      class Track < Spotify::Playlist::Tracks
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
          Muffon::Formatter::Source::Playlist::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: spotify_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_spotify_id,
            image_data:,
            duration:,
            creation_date:,
            is_audio_present: audio_present?,
            is_local: local_track?
          )
        end

        def raw_track_data
          @args[:raw_track_data].dig(
            'itemV2',
            'data'
          )
        end

        def creation_date
          datetime_formatted(
            raw_creation_date
          )
        end

        def raw_creation_date
          @args[:raw_track_data]
            .dig(
              'addedAt',
              'isoString'
            )
            .to_datetime
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
          { name: raw_artist_name }
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

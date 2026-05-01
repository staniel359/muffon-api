module YouTubeMusic
  module Album
    module Tracks
      class Track < YouTubeMusic::Base
        include YouTubeMusic::Mixins::Track

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
          Muffon::Formatter::Source::Album::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: youtube_id,
            title:,
            artists:,
            image_data:,
            album_data:,
            duration:,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def youtube_id
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'navigationEndpoint',
            'watchEndpoint',
            'videoId'
          )
        end

        def title
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'text'
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def raw_raw_artists
          find_raw_artists_data(
            raw_track_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            )
          )
        end

        def album_data
          @args[:album_data]
        end

        def image_data
          album_data[:image]
        end

        def raw_duration
          find_raw_duration(
            raw_track_data.dig(
              'musicResponsiveListItemRenderer',
              'fixedColumns',
              0,
              'musicResponsiveListItemFixedColumnRenderer',
              'text',
              'runs'
            )
          )
        end
      end
    end
  end
end

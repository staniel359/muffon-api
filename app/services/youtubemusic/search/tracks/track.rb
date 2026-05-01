module YouTubeMusic
  module Search
    class Tracks
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
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: youtube_id,
            title:,
            artists:,
            album_title:,
            source_album_id: album_youtube_id,
            image_data:,
            duration:,
            is_audio_present: audio_present?,
            **query_match_args,
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

        def raw_track_data
          @args[:raw_track_data]
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

        def image_url
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'thumbnail',
            'musicThumbnailRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
        end

        def raw_album_data
          find_raw_album_data(
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

        def raw_duration
          find_raw_duration(
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
      end
    end
  end
end

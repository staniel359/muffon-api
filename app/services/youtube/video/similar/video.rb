module YouTube
  module Video
    class Similar
      class Video < YouTube::Base
        include YouTube::Mixins::Video

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_video_data
          ]
        end

        def data
          update_video_record!

          Muffon::Formatter::Source::Video::SimilarVideos::Video.call(
            video_record:,
            **self_args
          )
        end

        def raw_video_data
          @args[:raw_video_data]
        end

        def title
          raw_video_data.dig(
            'playlistPanelVideoRenderer',
            'title',
            'runs',
            0,
            'text'
          )
        end

        def youtube_id
          raw_video_data.dig(
            'playlistPanelVideoRenderer',
            'navigationEndpoint',
            'watchEndpoint',
            'videoId'
          )
        end

        def channel_title
          raw_video_data.dig(
            'playlistPanelVideoRenderer',
            'longBylineText',
            'runs',
            0,
            'text'
          )
        end

        def channel_youtube_id
          raw_video_data.dig(
            'playlistPanelVideoRenderer',
            'longBylineText',
            'runs',
            0,
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
        end

        def image_url
          raw_video_data.dig(
            'playlistPanelVideoRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
        end
      end
    end
  end
end

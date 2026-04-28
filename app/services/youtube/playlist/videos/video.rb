module YouTube
  module Playlist
    class Videos
      class Video < YouTube::Playlist::Base
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
          update_record_data!

          Muffon::Formatter::Source::VideoPlaylist::Videos::Video.call(
            source_original_link:,
            source_name:,
            source_video_id: youtube_id,
            title:,
            channel_title:,
            source_video_channel_id: channel_youtube_id,
            image_data:,
            creation_date:,
            description:,
            description_size: 'extrasmall',
            **self_args
          )
        end

        def raw_video_data
          @args[:raw_video_data]
        end

        def youtube_id
          raw_video_data.dig(
            'snippet',
            'resourceId',
            'videoId'
          )
        end

        def channel_youtube_id
          raw_video_data.dig(
            'snippet',
            'videoOwnerChannelId'
          )
        end

        def channel_title
          raw_video_data.dig(
            'snippet',
            'videoOwnerChannelTitle'
          )
        end

        def description
          string_with_newlines_replaced_by_space(
            super
          )
        end
      end
    end
  end
end

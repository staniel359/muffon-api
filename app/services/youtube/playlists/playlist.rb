module YouTube
  class Playlists
    class Playlist < YouTube::Playlists
      include YouTube::Mixins::VideoPlaylist

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_video_playlist_data
        ]
      end

      def data
        update_record_data!

        Muffon::Formatter::Source::VideoPlaylists::VideoPlaylist.call(
          source_original_link:,
          source_name:,
          source_video_playlist_id: youtube_id,
          title:,
          channel_title:,
          source_video_channel_id: channel_youtube_id,
          image_data:,
          description:,
          description_size: 'extrasmall',
          videos_count:,
          creation_date:,
          **self_args
        )
      end

      def raw_video_playlist_data
        @args[:raw_video_playlist_data]
      end

      def description
        string_with_newlines_replaced_by_space(
          super
        )
      end
    end
  end
end

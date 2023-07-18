module YouTube
  module Channel
    class Playlists < YouTube::Channel::Base
      private

      def channel_data
        channel_base_data
          .merge(channel_playlists_data)
      end

      def channel_playlists_data
        {
          prev_page:,
          next_page:,
          playlists:
        }.compact
      end

      def prev_page
        playlists_data[
          :prev_page
        ]
      end

      def playlists_data
        @playlists_data ||=
          YouTube::Playlists.call(
            channel_id: @args[:channel_id],
            profile_id: @args[:profile_id],
            token: @args[:token],
            limit: @args[:limit],
            page: @args[:page]
          )
      end

      def next_page
        playlists_data[
          :next_page
        ]
      end

      def playlists
        playlists_data[
          :playlists
        ]
      end
    end
  end
end

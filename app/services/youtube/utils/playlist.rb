module YouTube
  module Utils
    module Playlist
      DOMAINS = {
        youtube: 'www',
        youtubemusic: 'music'
      }.freeze

      include Muffon::Utils::VideoPlaylist

      private

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links
        }
      end

      def youtube_id
        playlist['id']
      end

      def original_link
        "https://#{original_link_domain}.youtube.com/playlist?list=#{youtube_id}"
      end

      def original_link_domain
        DOMAINS[
          source_name.to_sym
        ]
      end

      def title
        CGI.unescapeHTML(
          snippet['title']
        )
      end

      def snippet
        playlist['snippet']
      end

      def channel_data
        {
          source: channel_source_data,
          title: channel_title
        }
      end

      def channel_source_data
        {
          name: source_name,
          id: channel_youtube_id
        }.compact
      end

      def channel_youtube_id
        snippet['channelId']
      end

      def channel_title
        CGI.unescapeHTML(
          snippet['channelTitle']
        )
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        snippet.dig(
          'thumbnails',
          'default',
          'url'
        )
      end

      def description
        CGI.unescapeHTML(
          snippet['description']
        )
      end

      def videos_count
        playlist.dig(
          'contentDetails',
          'itemCount'
        )
      end

      def publish_date
        date_formatted(
          raw_publish_date
        )
      end

      def raw_publish_date
        snippet['publishedAt']
      end
    end
  end
end

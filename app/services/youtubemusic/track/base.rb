module YouTubeMusic
  module Track
    class Base < YouTubeMusic::Base
      BASE_LINK =
        'https://music.youtube.com/youtubei/v1/next'.freeze

      include YouTubeMusic::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def not_found?
        raw_track_data.blank?
      end

      def raw_track_data
        @raw_track_data ||=
          response_data.dig(
            'contents',
            'singleColumnMusicWatchNextResultsRenderer',
            'tabbedRenderer',
            'watchNextTabbedResultsRenderer',
            'tabs'
          ).find do |raw_item_data|
            raw_item_data.dig(
              'tabRenderer',
              'title'
            ) == 'Up next'
          end.dig(
            'tabRenderer',
            'content',
            'musicQueueRenderer',
            'content',
            'playlistPanelRenderer',
            'contents',
            0,
            'playlistPanelVideoRenderer'
          )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          'videoId' => @args[:track_id],
          'context' => context_data
        }.to_json
      end

      def data
        { track: track_data }
      end

      alias response post_response
    end
  end
end

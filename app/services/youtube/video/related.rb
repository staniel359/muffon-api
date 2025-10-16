module YouTube
  module Video
    class Related < YouTube::Video::Base
      BASE_LINK =
        'https://music.youtube.com/youtubei/v1/next'.freeze
      COLLECTION_NAME = 'related'.freeze
      SCOPES_PREFIXES = %w[
        RDAMVM
        RDATiXv
      ].freeze

      include Muffon::Utils::Pagination

      private

      def not_found?
        false
      end

      def video_data
        {
          **video_base_data,
          **paginated_data
        }
      end

      def video_base_data
        video_info_data.slice(
          :source,
          :title,
          :channel
        )
      end

      def video_info_data
        @video_info_data ||=
          YouTube::Video::Info.call(
            video_id: @args[:video_id]
          )[:video]
      end

      def next_page
        next_page_computed = page + 1

        return if SCOPES_PREFIXES[next_page_computed - 1].blank?

        next_page_computed
      end

      def total_pages_count
        nil
      end

      def collection_list
        response_data
          .dig(
            'contents',
            'singleColumnMusicWatchNextResultsRenderer',
            'tabbedRenderer',
            'watchNextTabbedResultsRenderer',
            'tabs'
          )
          .find do |raw_item_data|
            raw_item_data.dig(
              'tabRenderer',
              'title'
            ) == 'Up next'
          end
          .dig(
            'tabRenderer',
            'content',
            'musicQueueRenderer',
            'content',
            'playlistPanelRenderer',
            'contents'
          )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          'playlistId' => scope_param,
          'context' => context_data
        }.to_json
      end

      def scope_param
        "#{scope_prefix}#{@args[:video_id]}"
      end

      def scope_prefix
        SCOPES_PREFIXES[page - 1]
      end

      def collection_item_data_formatted(video)
        YouTube::Video::Related::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias response post_response
    end
  end
end

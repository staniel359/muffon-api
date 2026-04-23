module YouTube
  module Video
    class Similar < YouTube::Video::Base
      BASE_LINK =
        'https://music.youtube.com/youtubei/v1/next'.freeze
      SCOPES_PREFIXES = %w[
        RDAMVM
        RDATiXv
      ].freeze

      private

      def not_found?
        false
      end

      def video_data
        {
          **video_base_data,
          **similar_data
        }
      end

      def similar_data
        paginated_data(
          collection_name: 'similar',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def video_base_data
        video_info_data.slice(
          :source,
          :title,
          :channel
        )
      end

      def video_info_data
        YouTube::Video::Info.call(
          video_id: @args[:video_id]
        )[:video]
      end

      def raw_collection
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

      def params
        {
          **super,
          id: @args[:video_id],
          part: 'snippet,statistics'
        }
      end

      def payload
        {
          'playlistId' => scope_param,
          'context' => payload_context_data
        }.to_json
      end

      def scope_param
        "#{scope_prefix}#{@args[:video_id]}"
      end

      def scope_prefix
        SCOPES_PREFIXES[page - 1]
      end

      def page
        super.to_i
      end

      def next_page
        next_page_computed = page + 1

        return if SCOPES_PREFIXES[next_page_computed - 1].blank?

        next_page_computed
      end

      def collection_item_data_formatted(
        raw_video_data
      )
        YouTube::Video::Similar::Video.call(
          raw_video_data:,
          **self_args
        )
      end

      alias response post_response
    end
  end
end

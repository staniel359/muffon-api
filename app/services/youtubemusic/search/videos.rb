module YouTubeMusic
  module Search
    class Videos < YouTubeMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'videos',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def scope_params
        YouTubeMusic::Utils::Search::ScopeParams.call(
          query: @args[:query],
          scope: 'videos'
        )
      end

      def collection_item_data_formatted(
        raw_video_data
      )
        YouTubeMusic::Search::Videos::Video.call(
          raw_video_data:,
          **self_args
        )
      end
    end
  end
end

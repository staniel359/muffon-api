module YouTubeMusic
  module Search
    class Artists < YouTubeMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
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
          scope: 'artists'
        )
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        YouTubeMusic::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end

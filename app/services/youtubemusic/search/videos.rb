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
        YouTubeMusic::Search::ScopeParams.call(
          query: @args[:query],
          scope: 'videos'
        )
      end

      def collection_item_data_formatted(video)
        YouTubeMusic::Search::Videos::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

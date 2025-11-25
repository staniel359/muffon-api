module YouTubeMusic
  module Search
    class Albums < YouTubeMusic::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
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
          scope: 'albums'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        YouTubeMusic::Search::Albums::Album.call(
          raw_album_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

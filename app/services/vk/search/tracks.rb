module VK
  module Search
    class Tracks < VK::Search::Base
      API_METHOD = 'audio.search'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def raw_collection
        super.reject do |raw_track_data|
          raw_track_data['title'].blank?
        end
      end

      def collection_item_data_formatted(track)
        VK::Search::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

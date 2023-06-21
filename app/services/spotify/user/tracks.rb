module Spotify
  module User
    class Tracks < Spotify::User::Base
      COLLECTION_NAME = 'tracks'.freeze

      include Spotify::Utils::Pagination

      private

      def link
        "#{super}/tracks"
      end

      def user_data
        tracks_data
          .merge(paginated_data)
      end

      def tracks_data
        {
          total_items:
            total_items_count
        }
      end

      def total_items_count
        response_data['total']
      end

      def collection_list
        response_data['items']
      end

      def collection_item_data_formatted(track)
        Spotify::User::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

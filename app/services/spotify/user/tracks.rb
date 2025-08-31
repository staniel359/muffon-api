module Spotify
  module User
    class Tracks < Spotify::User::Base
      COLLECTION_NAME = 'tracks'.freeze

      include Spotify::Utils::Pagination

      private

      def user_data
        {
          total_items: total_items_count,
          **paginated_data
        }
      end

      def total_items_count
        user['total']
      end

      def link
        "#{super}/tracks"
      end

      def collection_list
        user['items']
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

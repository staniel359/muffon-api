module Spotify
  module User
    class Tracks < Spotify::User::Base
      private

      def user_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          is_with_items_count: true
        )
      end

      def raw_collection
        user['items']
      end

      def link
        "#{super}/tracks"
      end

      def params
        {
          **super,
          limit:,
          offset:
        }
      end

      def items_count
        user['total']
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Spotify::User::Tracks::Track.call(
          raw_track_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

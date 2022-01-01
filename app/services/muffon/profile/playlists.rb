module Muffon
  module Profile
    class Playlists < Muffon::Profile::Base
      COLLECTION_NAME = 'playlists'.freeze
      include Muffon::Utils::Pagination
      include Muffon::Utils::Track

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: nickname }
      end

      def total_items_count
        playlists.size
      end

      def playlists
        @playlists ||= profile.playlists
      end

      def collection_list
        playlists
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(playlist)
        Muffon::Profile::Playlists::Playlist.call(
          playlist:,
          track_id:
        )
      end

      def track_id
        find_track.id if find_track?
      end

      def find_track?
        [
          @args[:track_title],
          @args[:artist_name]
        ].all?(&:present?)
      end

      def title
        @args[:track_title]
      end

      def artist_name
        @args[:artist_name]
      end
    end
  end
end

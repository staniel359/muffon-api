module Muffon
  module Profile
    class Playlists < Muffon::Profile::Base
      COLLECTION_NAME = 'playlists'.freeze
      DEFAULT_ORDER = 'created_desc'.freeze

      include Muffon::Utils::Pagination
      include Muffon::Utils::Track
      include Muffon::Utils::Album

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: }
      end

      def total_items_count
        @total_items_count ||= playlists.count
      end

      def playlists
        @playlists ||= playlists_conditional
      end

      def playlists_conditional
        if valid_profile? || creator?
          profile_playlists
        else
          profile_playlists.public
        end
      end

      def profile_playlists
        profile.playlists
      end

      def collection_list
        playlists
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(playlist)
        Muffon::Profile::Playlists::Playlist.call(
          playlist:,
          track_id:,
          album_id:
        )
      end

      def track_id
        return unless model?('track')

        find_track.id
      end

      def model?(type)
        @args[:model]
          &.strip
          &.downcase == type
      end

      def title
        @args[:track_title]
      end

      def artist_name
        @args[:artist_name]
      end

      def album_id
        return unless model?('album')

        find_album.id
      end
    end
  end
end

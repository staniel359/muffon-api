module Muffon
  module Profile
    class Playlists < Muffon::Profile::Base
      DEFAULT_ORDER = 'created_desc'.freeze

      include Muffon::Utils::Track
      include Muffon::Utils::Album

      private

      def profile_data
        {
          **super,
          **playlists_data
        }
      end

      def playlists_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        playlists
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def playlists
        @playlists ||=
          if valid_profile? || creator?
            profile.playlists
          else
            profile
              .playlists
              .public
          end
      end

      def items_count
        playlists.count
      end

      def collection_item_data_formatted(playlist)
        Muffon::Profile::Playlists::Playlist.call(
          playlist:,
          track_id:,
          album_id:
        )
      end

      def track_id
        return unless model == 'track'

        find_track.id
      end

      def model
        return if @args[:model].blank?

        @args[:model]
          .strip
          .downcase
      end

      def title
        @args[:track_title]
      end

      def artist_name
        @args[:artist_name]
      end

      def album_id
        return unless model == 'album'

        find_album.id
      end
    end
  end
end

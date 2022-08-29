module LastFM
  module Artist
    class Profiles < LastFM::Artist::Base
      COLLECTION_NAME = 'profiles'.freeze
      include Muffon::Utils::Pagination

      private

      def total_items_count
        profiles.size
      end

      def profiles
        @profiles ||= find_artist.profiles
      end

      def collection_list
        profiles
          .library_tracks_count_desc_ordered
          .created_asc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id: @args[:profile_id]
        )
      end

      alias artist_data paginated_data
    end
  end
end

module LastFM
  module Artist
    class Profiles < LastFM::Artist::Base
      COLLECTION_NAME = 'profiles'.freeze

      include Muffon::Utils::Pagination

      private

      def total_items_count
        @total_items_count ||= profiles.count
      end

      def profiles
        @profiles ||= find_artist.profiles
      end

      def collection_list
        profiles
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias artist_data paginated_data
    end
  end
end

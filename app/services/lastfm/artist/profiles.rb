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
        @profiles ||= profiles_conditional
      end

      def profiles_conditional
        if creator?
          find_artist.profiles
        else
          find_artist
            .profiles
            .public
        end
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

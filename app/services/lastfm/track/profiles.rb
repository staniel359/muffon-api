module LastFM
  module Track
    class Profiles < LastFM::Track::Base
      private

      def track_data
        paginated_data(
          collection_name: 'profiles',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        profiles
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def profiles
        @profiles ||=
          if creator?
            find_track
              .profiles
              .not_deleted
          else
            find_track
              .profiles
              .not_deleted
              .public
          end
      end

      def items_count
        profiles.count
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

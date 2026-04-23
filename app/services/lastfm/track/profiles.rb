module LastFM
  module Track
    class Profiles < LastFM::Track::Info
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
            track_record
              .profiles
              .not_deleted
          else
            track_record
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

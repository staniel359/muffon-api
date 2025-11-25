module LastFM
  module Album
    class Profiles < LastFM::Album::Base
      private

      def album_data
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
            find_album
              .profiles
              .not_deleted
          else
            find_album
              .profiles
              .public
              .not_deleted
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

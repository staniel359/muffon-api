module Muffon
  module Profile
    class Followers < Muffon::Profile::Relationships::Base
      private

      def profile_data
        {
          **super,
          **followers_data
        }
      end

      def followers_data
        paginated_data(
          collection_name: 'followers',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        followers
          .with_relationship_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .with_relations
      end

      def followers
        @followers ||=
          if creator?
            profile_record
              .follower_profiles
              .not_deleted
          else
            profile_record
              .follower_profiles
              .public
              .not_deleted
          end
      end

      def items_count
        followers.count
      end

      def collection_item_data_formatted(
        profile_record
      )
        Muffon::Formatter::Profiles::Profile.call(
          profile_record:,
          other_profile_id: @args[:other_profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

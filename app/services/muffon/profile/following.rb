module Muffon
  module Profile
    class Following < Muffon::Profile::Relationships::Base
      private

      def profile_data
        {
          **super,
          **following_data
        }
      end

      def following_data
        paginated_data(
          collection_name: 'following',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        following
          .with_relationship_created_at
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def following
        @following ||=
          if creator?
            profile
              .following_profiles
              .not_deleted
          else
            profile
              .following_profiles
              .public
              .not_deleted
          end
      end

      def items_count
        following.count
      end

      def collection_item_data_formatted(profile)
        Muffon::Profiles::Profile.call(
          profile:,
          other_profile_id:
            @args[:other_profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

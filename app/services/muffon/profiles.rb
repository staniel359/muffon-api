module Muffon
  class Profiles < Muffon::Base
    DEFAULT_ORDER = 'created_desc'.freeze

    def call
      data
    end

    private

    def data
      { profiles: profiles_data }
    end

    def profiles_data
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
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
    end

    def profiles
      @profiles ||=
        if creator?
          ::Profile.not_deleted
        else
          ::Profile
            .public
            .not_deleted
        end.then do |profiles|
          if @args[:online]
            profiles.online
          else
            profiles
          end
        end
    end

    def items_count
      profiles.count
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

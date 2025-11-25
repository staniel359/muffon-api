module Muffon
  class Communities < Muffon::Base
    DEFAULT_ORDER = 'created_desc'.freeze

    def call
      data
    end

    private

    def data
      { communities: communities_data }
    end

    def communities_data
      paginated_data(
        collection_name: 'communities',
        raw_collection:,
        page:,
        limit:,
        items_count:
      )
    end

    def raw_collection
      communities
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
    end

    def communities
      ::Community
    end

    def items_count
      communities.count
    end

    def collection_item_data_formatted(community)
      Muffon::Communities::Community.call(
        community:,
        profile_id: @args[:profile_id],
        token: @args[:token]
      )
    end
  end
end

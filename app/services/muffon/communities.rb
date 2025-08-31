module Muffon
  class Communities < Muffon::Base
    COLLECTION_NAME = 'communities'.freeze
    DEFAULT_ORDER = 'created_desc'.freeze

    include Muffon::Utils::Pagination

    def call
      data
    end

    private

    def data
      { communities: paginated_data }
    end

    def total_items_count
      @total_items_count ||= ::Community.count
    end

    def collection_list
      ::Community
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
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

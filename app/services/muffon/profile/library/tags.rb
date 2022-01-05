module Muffon
  module Profile
    module Library
      class Tags < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'tags'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          tags.size
        end

        def tags
          @tags ||= profile.tags
        end

        def collection_list
          tags[offset, limit]
        end

        def collection_item_data_formatted(tag)
          Muffon::Profile::Library::Tags::Tag.call(
            tag: tag
          )
        end

        alias library_data paginated_data
      end
    end
  end
end

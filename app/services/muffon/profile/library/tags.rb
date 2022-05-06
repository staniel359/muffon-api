module Muffon
  module Profile
    module Library
      class Tags < Muffon::Profile::Library::Base
        COLLECTION_NAME = 'tags'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          library_tags.size
        end

        def library_tags
          @library_tags ||= profile.library_tags
        end

        def collection_list
          library_tags[offset, limit] || []
        end

        def collection_item_data_formatted(tag)
          Muffon::Profile::Library::Tags::Tag.call(
            tag:
          )
        end

        alias library_data paginated_data
      end
    end
  end
end

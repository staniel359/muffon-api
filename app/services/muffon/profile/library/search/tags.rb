module Muffon
  module Profile
    module Library
      module Search
        class Tags < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'tags'.freeze

          private

          def total_items_count
            @total_items_count ||= library_tags.size
          end

          def library_tags
            @library_tags ||=
              profile.library_tags.select do |t|
                t[:id].in?(matched_tag_ids)
              end
          end

          def matched_tag_ids
            @matched_tag_ids ||=
              matched_tags.pluck(:id)
          end

          def matched_tags
            ::Tag.where(
              'name_downcase LIKE ?',
              query_formatted
            )
          end

          def collection_list
            library_tags_formatted(
              library_tags[offset, limit] || []
            )
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
end

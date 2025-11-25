module Muffon
  module Profile
    module Library
      module Search
        class Tags < Muffon::Profile::Library::Search::Base
          DEFAULT_ORDER = 'library_count_desc'.freeze

          private

          def library_data
            {
              **tags_data
            }
          end

          def tags_data
            paginated_data(
              collection_name: 'tags',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            tags
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
          end

          def tags
            @tags ||=
              profile
              .library_tags
              .where(
                'name_downcase LIKE ?',
                query_formatted
              )
          end

          def items_count
            tags.size
          end

          def collection_item_data_formatted(tag)
            Muffon::Profile::Library::Tags::Tag.call(
              tag:
            )
          end
        end
      end
    end
  end
end

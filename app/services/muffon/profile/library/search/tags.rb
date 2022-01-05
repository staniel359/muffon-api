module Muffon
  module Profile
    module Library
      module Search
        class Tags < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'tags'.freeze

          private

          def total_items_count
            tags.size
          end

          def tags
            @tags ||=
              profile.tags.select do |t|
                t[0].in?(matched_tag_ids)
              end
          end

          def matched_tag_ids
            @matched_tag_ids ||=
              matched_tags.pluck(:id)
          end

          def matched_tags
            ::Tag.where(
              'LOWER(name) LIKE ?',
              "%#{@args[:query].downcase}%"
            )
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
end

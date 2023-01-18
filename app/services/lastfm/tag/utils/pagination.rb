module LastFM
  module Tag
    module Utils
      module Pagination
        TOTAL_LIMIT = 1_000

        include Muffon::Utils::Pagination

        private

        def no_data?
          raw_collection_list.blank?
        end

        def raw_collection_list
          tag[model_name]
        end

        def tag
          response_data[
            collection_name
          ]
        end

        def params
          super.merge(
            pagination_params
          )
        end

        def pagination_params
          { limit: total_limit }
        end

        def model_name
          self.class::MODEL_NAME
        end

        def tag_data
          tag_base_data
            .merge(paginated_data)
        end

        def tag_base_data
          { name: }
        end

        def name
          tag.dig(
            '@attr', 'tag'
          )
        end

        def collection_count
          raw_collection_list.size
        end

        def collection_list
          collection_paginated(
            raw_collection_list
          )
        end
      end
    end
  end
end

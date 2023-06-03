module LastFM
  module Tag
    module Utils
      module Pagination
        include Muffon::Utils::Pagination

        private

        def no_data?
          collection_list.blank?
        end

        def collection_list
          tag[model_name].last(limit)
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
          tag.dig(
            '@attr', 'total'
          ).to_i
        end
      end
    end
  end
end

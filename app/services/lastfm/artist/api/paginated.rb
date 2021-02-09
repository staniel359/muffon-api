module LastFM
  module Artist
    module API
      class Paginated < LastFM::Artist::API::Base
        include LastFM::API::Paginated

        private

        def service_info
          {
            api_method: "artist.getTop#{collection_name.capitalize}",
            response_data_node: "top#{collection_name}"
          }
        end

        def params
          super.merge(pagination_params)
        end

        def artist_data
          {
            name: extra_data['artist'],
            page: page,
            total_pages: total_pages,
            collection_name.to_sym => collection_data
          }
        end

        def collection_list
          response_data[model_name]
        end
      end
    end
  end
end

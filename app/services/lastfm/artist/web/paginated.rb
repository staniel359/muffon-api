module LastFM
  module Artist
    module Web
      class Paginated < LastFM::Artist::Web::Base
        include LastFM::Web::Paginated

        private

        def link
          "#{artist_link}/+#{collection_name}"
        end

        def params
          super.merge(pagination_params)
        end

        def artist_data
          {
            name: name,
            page: page,
            total_pages: total_pages,
            collection_name.to_sym => collection_data
          }
        end

        def name
          response_data.css('.header-new-title').text
        end
      end
    end
  end
end

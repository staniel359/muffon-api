module LastFM
  module Tag
    module Web
      class Base < LastFM::Web::Base
        include LastFM::Web::Paginated

        private

        def primary_args
          [@args.tag]
        end

        def base_link
          "https://www.last.fm/tag/#{tag_name}"
        end

        def link
          "#{base_link}/#{collection_name}"
        end

        def tag_name
          format_param(@args.tag)
        end

        def params
          super.merge(pagination_params)
        end

        def data
          { tag: tag_data }
        end

        def tag_data
          {
            name: name,
            page: page,
            total_pages: total_pages,
            collection_name.to_sym => collection_data
          }
        end

        def name
          response_data.css('title').text.match(
            /Top (.+) #{collection_name}/
          )[1]
        end

        def collection_data
          return [] if page > total_pages

          send(collection_name)
        end
      end
    end
  end
end

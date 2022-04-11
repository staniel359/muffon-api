module LastFM
  module Tag
    module Web
      class Base < LastFM::Web::Base
        include LastFM::Utils::Web::Pagination

        private

        def primary_args
          [@args[:tag]]
        end

        def collection_list
          @collection_list ||= send(
            "#{collection_name}_list"
          )
        end

        def link
          "#{base_link}/#{collection_name}"
        end

        def base_link
          "https://www.last.fm/tag/#{tag_name}"
        end

        def tag_name
          param_formatted(
            @args[:tag]
          )
        end

        def params
          super.merge(
            pagination_params
          )
        end

        def data
          { tag: tag_data }
        end
      end
    end
  end
end

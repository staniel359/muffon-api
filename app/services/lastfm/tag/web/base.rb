module LastFM
  module Tag
    module Web
      class Base < LastFM::Tag::Base
        include LastFM::Utils::Web::Proxy
        include LastFM::Utils::Web::Pagination

        private

        def collection_list
          send(
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
            @args[:tag_name]
          )
        end

        def params
          super.merge(
            pagination_params
          )
        end
      end
    end
  end
end

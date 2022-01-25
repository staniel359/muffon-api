module LastFM
  module Tag
    module Utils
      module Pagination
        private

        def tag_data
          tag_base_data
            .merge(paginated_data)
        end

        def tag_base_data
          { name: }
        end

        def name
          raw_name.match(
            /(.+) music/
          )[1]
        end

        def raw_name
          response_data.css(
            '.header-title a'
          )[0].text
        end
      end
    end
  end
end

module LastFM
  module Tag
    module Utils
      module Pagination
        private

        def tag_data
          { name: name }.merge(
            paginated_data
          )
        end

        def name
          raw_name.match(/(.+) music/)[1]
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

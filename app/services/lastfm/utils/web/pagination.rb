module LastFM
  module Utils
    module Web
      module Pagination
        private

        def params
          {
            **super,
            page:
          }
        end

        def pages_count
          if last_page.present?
            last_page
              .text
              .strip
              .to_i
          else
            1
          end
        end

        def last_page
          response_data.css(
            '.pagination-page'
          )[-1]
        end
      end
    end
  end
end

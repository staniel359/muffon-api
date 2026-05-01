module LastFM
  module Mixins
    module Web
      module Pagination
        private

        def request_params
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

module LastFM
  module Utils
    module Web
      module Pagination
        include LastFM::Utils::Pagination

        private

        def pagination_params
          { page: }
        end

        def total_pages_count
          return 1 if last_page.blank?

          last_page.text.strip.to_i
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

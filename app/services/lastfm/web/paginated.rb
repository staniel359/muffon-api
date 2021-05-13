module LastFM
  module Web
    module Paginated
      include Muffon::Utils::Paginated

      private

      def pagination_params
        { page: @args.page }.compact
      end

      def total_pages
        return 1 if last_page.blank?

        last_page.text.strip.to_i
      end

      def last_page
        response_data.css('.pagination-page').last
      end
    end
  end
end

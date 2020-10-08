module LastFM
  module Top
    class Base < LastFM::API
      private

      def data
        { top: top_data }
      end

      def page
        parsed_response.dig('@attr', 'page').to_i
      end
    end
  end
end

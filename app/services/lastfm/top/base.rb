module LastFM
  module Top
    class Base < LastFM::API
      private

      def primary_args
        []
      end

      def data
        { top: top_data }
      end

      def page
        response_data.dig('@attr', 'page').to_i
      end
    end
  end
end

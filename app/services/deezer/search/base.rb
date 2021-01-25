module Deezer
  module Search
    class Base < Deezer::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data['data'].blank?
      end

      def link
        "#{base_link}/search/#{model_name}"
      end

      def params
        { q: @args.query }
      end

      def data
        { search: paginated_data }
      end

      def images_data(data, model)
        Deezer::Utils::Images.call(data: data, model: model)
      end
    end
  end
end

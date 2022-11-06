module API
  module Bandcamp
    class LabelsController < API::BaseController
      def artists; end

      def albums; end

      private

      def artists_data
        ::Bandcamp::Label::Artists.call(
          params.slice(
            *%i[label_id profile_id token page limit]
          )
        )
      end

      def albums_data
        ::Bandcamp::Label::Albums.call(
          params.slice(
            *%i[label_id profile_id token page limit]
          )
        )
      end
    end
  end
end

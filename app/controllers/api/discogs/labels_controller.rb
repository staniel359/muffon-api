module API
  module Discogs
    class LabelsController < API::BaseController
      def info; end

      def description; end

      def albums; end

      private

      def info_data
        ::Discogs::Label::Info.call(
          params.slice(
            *%i[
              label_id
            ]
          )
        )
      end

      def description_data
        ::Discogs::Label::Description.call(
          params.slice(
            *%i[
              label_id
            ]
          )
        )
      end

      def albums_data
        ::Discogs::Label::Albums.call(
          params.slice(
            *%i[
              label_id
              page
              limit
            ]
          )
        )
      end
    end
  end
end

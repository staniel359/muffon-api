module API
  module Genius
    class AnnotationsController < API::BaseController
      def info; end

      private

      def info_data
        ::Genius::Annotation::Info.call(
          params.slice(
            *%i[annotation_id]
          )
        )
      end
    end
  end
end

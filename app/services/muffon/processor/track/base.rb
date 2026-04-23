module Muffon
  module Processor
    module Track
      class Base < Muffon::Base
        include Muffon::Mixins::Track

        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            artist_name
            track_title
          ]
        end

        def artist_name
          @args[:artist_name]
        end

        def title
          @args[:track_title]
        end
      end
    end
  end
end

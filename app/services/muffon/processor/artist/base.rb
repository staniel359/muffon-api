module Muffon
  module Processor
    module Artist
      class Base < Muffon::Base
        include Muffon::Mixins::Artist

        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            artist_name
          ]
        end

        def name
          @args[:artist_name]
        end
      end
    end
  end
end

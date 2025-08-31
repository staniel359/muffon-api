module Muffon
  module Processor
    module Artist
      class Base < Muffon::Base
        include Muffon::Utils::Artist

        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            name
          ]
        end

        def name
          @args[:name]
        end
      end
    end
  end
end

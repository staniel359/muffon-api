module Muffon
  module Processor
    module Album
      class Base < Muffon::Base
        include Muffon::Utils::Album

        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            artist_name
            album_title
          ]
        end

        def artist_name
          @args[:artist_name]
        end

        def title
          @args[:album_title]
        end
      end
    end
  end
end

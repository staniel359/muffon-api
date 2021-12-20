module Muffon
  module Processor
    module Album
      class Base < Muffon::Base
        include Muffon::Utils::Album

        private

        def primary_args
          [
            @args[:title],
            @args[:artist_name]
          ]
        end

        def title
          @args[:title]
        end

        def artist_name
          @args[:artist_name]
        end
      end
    end
  end
end

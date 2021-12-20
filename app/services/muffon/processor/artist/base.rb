module Muffon
  module Processor
    module Artist
      class Base < Muffon::Base
        include Muffon::Utils::Artist

        private

        def primary_args
          [@args[:name]]
        end

        def name
          @args[:name]
        end
      end
    end
  end
end

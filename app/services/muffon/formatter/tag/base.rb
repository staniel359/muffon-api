module Muffon
  module Formatter
    module Tag
      class Base < Muffon::Formatter::Base
        private

        def name
          @args[:name]
        end

        def taggings_count
          @args[:taggings_count]
        end

        def taggers_count
          @args[:taggers_count]
        end
      end
    end
  end
end

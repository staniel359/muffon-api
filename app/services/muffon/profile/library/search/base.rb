module Muffon
  module Profile
    module Library
      module Search
        class Base < Muffon::Profile::Library::Base
          private

          def required_args
            super + %i[
              query
            ]
          end

          def query_formatted
            "%#{@args[:query].downcase}%"
          end
        end
      end
    end
  end
end

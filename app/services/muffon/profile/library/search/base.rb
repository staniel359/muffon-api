module Muffon
  module Profile
    module Library
      module Search
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Pagination

          private

          def primary_args
            [
              @args.profile_id,
              @args.query
            ]
          end
        end
      end
    end
  end
end

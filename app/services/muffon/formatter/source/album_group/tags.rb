module Muffon
  module Formatter
    module Source
      module AlbumGroup
        class Tags < Muffon::Formatter::Source::AlbumGroup::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              tags
            ]
          end

          def data
            { tags: }
          end
        end
      end
    end
  end
end

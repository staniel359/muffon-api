module Muffon
  module Formatter
    module Source
      module Search
        module Artists
          class Artist < Muffon::Formatter::Source::Artist::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                source_original_link
                source_name
                source_artist_id
                name
                image_data
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                name:,
                image: image_data,
                listeners_count:
              }.compact
            end
          end
        end
      end
    end
  end
end

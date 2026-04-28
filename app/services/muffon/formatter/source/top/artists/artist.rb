module Muffon
  module Formatter
    module Source
      module Top
        module Artists
          class Artist < Muffon::Formatter::Source::Artist::Base
            def call
              check_args

              data
            end

            private

            def required_args
              if @args[:is_minimal]
                %i[
                  name
                ]
              else
                %i[
                  source_original_link
                  source_name
                  source_artist_id
                  name
                  image_data
                ]
              end
            end

            def data
              if @args[:is_minimal]
                artist_minimal_data
              else
                artist_full_data
              end
            end

            def artist_minimal_data
              { name: }
            end

            def artist_full_data
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

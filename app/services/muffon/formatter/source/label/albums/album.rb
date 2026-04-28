module Muffon
  module Formatter
    module Source
      module Label
        module Albums
          class Album < Muffon::Formatter::Source::Album::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                source_original_link
                source_name
                source_album_id
                title
                artists
                image_data
                release_date
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                title:,
                artist: artist_data,
                artists:,
                image: image_data,
                release_date:,
                listeners_count:
              }.compact
            end
          end
        end
      end
    end
  end
end

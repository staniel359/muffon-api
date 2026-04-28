module Muffon
  module Formatter
    module Source
      module User
        module Favorites
          module Tracks
            class Track < Muffon::Formatter::Source::Track::Base
              def call
                check_args

                data
              end

              private

              def required_args
                %i[
                  source_original_link
                  source_name
                  source_track_id
                  title
                  artists
                  creation_date
                ]
              end

              def data
                {
                  source: source_data,
                  title:,
                  artist: artist_data,
                  artists:,
                  created: creation_date
                }.compact
              end
            end
          end
        end
      end
    end
  end
end

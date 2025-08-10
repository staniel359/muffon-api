module Muffon
  module Profile
    module Library
      module Artist
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Artist
          include Muffon::Utils::Source::Artist

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_id]
            ]
          end

          def no_data?
            super || library_artist.blank?
          end

          def library_artist
            if instance_variable_defined?(
              :@library_artist
            )
              @library_artist
            else
              @library_artist =
                library_artists.find_by(
                  id: @args[:library_id]
                )
            end
          end

          def library_data
            { artist: artist_data }
          end

          def artist_base_data
            {
              source: source_data,
              library: library_artist_data,
              name:
            }.compact
          end
        end
      end
    end
  end
end

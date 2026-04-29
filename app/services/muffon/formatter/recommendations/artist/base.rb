module Muffon
  module Formatter
    module Recommendations
      module Artist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Artist

          private

          def artist_record
            @artist_record ||=
              recommendation_artist_record.artist
          end

          def recommendation_artist_record
            @args[:recommendation_artist_record]
          end

          def source_data
            artist_record.source_data
          end

          def id
            recommendation_artist_record.id
          end

          def name
            artist_record.name
          end

          def image_data
            artist_record.image_data
          end

          def artists_count
            recommendation_artist_record.artists_count
          end

          def library_artists_formatted
            library_artists.map do |library_artist|
              library_artist_formatted(
                library_artist
              )
            end
          end

          def library_artists
            recommendation_artist_record
              .library_artists
              .library_tracks_count_desc_ordered
              .limit(5)
              .associated
          end

          def library_artist_formatted(
            library_artist_record
          )
            Muffon::Formatter::Library::Artists::Artist.call(
              library_artist_record:,
              is_minimal: true,
              **self_args
            )
          end

          def profiles_count
            artist_record.profiles_count
          end

          def listeners_count
            artist_record.listeners_count
          end
        end
      end
    end
  end
end

module Muffon
  module Profile
    module Recommendations
      class Artists
        class Artist < Muffon::Profile::Recommendations::Artists
          include Muffon::Utils::Artist
          include Muffon::Utils::Source::Artist

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              recommendation
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id: recommendation.id,
              name:,
              image: artist.image_data,
              artists_count: recommendation.artists_count,
              artists: library_artists_formatted,
              profiles_count: artist.profiles_count,
              listeners_count: artist.listeners_count
            }.compact
          end

          def recommendation
            @args[:recommendation]
          end

          def name
            artist.name
          end

          def artist
            @artist ||= recommendation.artist
          end

          def library_artists_formatted
            library_artists.map do |library_artist|
              library_artist_formatted(
                library_artist
              )
            end
          end

          def library_artists
            recommendation
              .library_artists
              .associated
              .library_tracks_count_desc_ordered
              .limit(5)
          end

          def library_artist_formatted(
            library_artist
          )
            Muffon::Profile::Library::Artists::Artist.call(
              library_artist:,
              token: @args[:token],
              is_minimal: true
            )
          end
        end
      end
    end
  end
end

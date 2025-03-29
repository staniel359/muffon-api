module Muffon
  module Profile
    module Recommendations
      class Artists
        class Artist < Muffon::Profile::Recommendations::Artists
          include Muffon::Utils::Artist
          include Muffon::Utils::Source::Artist

          def call
            data
          end

          private

          def data
            self_data
              .merge(recommendation_data)
          end

          def recommendation_data
            {
              source: source_data,
              id: recommendation.id,
              name:,
              image: image_data,
              artists_count:,
              artists: library_artists_formatted,
              profiles_count:,
              listeners_count:
            }.compact
          end

          def recommendation
            @args[:recommendation]
          end

          def name
            artist.name
          end

          def artist
            @artist ||=
              recommendation.artist
          end

          def image_data
            artist.image_data
          end

          def artists_count
            recommendation
              .library_artist_ids
              .size
          end

          def library_artists_formatted
            library_artists.map do |a|
              library_artist_formatted(a)
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
              minimal: true
            )
          end

          def listeners_count
            artist.listeners_count
          end
        end
      end
    end
  end
end

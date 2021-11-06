module Muffon
  module Profile
    class Recommendations
      class Recommendation < Muffon::Profile::Recommendations
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(recommendation_data)
        end

        def recommendation_data
          {
            id: id,
            name: name,
            image: image_data,
            profile_artists_count: profile_artists_count,
            profile_artists: profile_artists_formatted
          }
        end

        def id
          recommendation.id
        end

        def recommendation
          @recommendation ||= @args.recommendation
        end

        def name
          recommendation
            .artist
            .name
        end

        def image_data
          recommendation
            .artist
            .image_data
        end

        def profile_artists_count
          recommendation
            .profile_artist_ids
            .size
        end

        def profile_artists_formatted
          profile_artists_associated.map do |a|
            profile_artist_formatted(a)
          end
        end

        def profile_artists_associated
          recommendation
            .profile_artists
            .limit(5)
            .includes(:artist)
        end

        def profile_artist_formatted(artist)
          Muffon::Profile::Recommendations::Recommendation::Artist.call(
            artist: artist,
            profile_id: @args.profile_id
          )
        end
      end
    end
  end
end

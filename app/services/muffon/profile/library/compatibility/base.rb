module Muffon
  module Profile
    module Library
      module Compatibility
        class Base < Muffon::Base
          include Muffon::Utils::Pagination

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:other_profile_id]
            ]
          end

          def no_data?
            profile.blank? ||
              other_profile.blank?
          end

          def data
            { compatibility: compatibility_data }
          end

          def common_artist_ids
            @common_artist_ids ||=
              artist_ids(@args[:profile_id]) &
              artist_ids(@args[:other_profile_id])
          end

          def artist_ids(profile_id)
            profile_artists(profile_id).pluck(
              :artist_id
            )
          end

          def profile_artists(profile_id)
            ::ProfileArtist.where(
              profile_id:
            )
          end

          def artists_count
            @artists_count ||=
              common_artist_ids.size
          end

          def common_album_ids
            @common_album_ids ||=
              album_ids(@args[:profile_id]) &
              album_ids(@args[:other_profile_id])
          end

          def album_ids(profile_id)
            profile_albums(profile_id).pluck(
              :album_id
            )
          end

          def profile_albums(profile_id)
            ::ProfileAlbum.where(
              profile_id:
            )
          end

          def albums_count
            @albums_count ||=
              common_album_ids.size
          end

          def common_track_ids
            @common_track_ids ||=
              track_ids(@args[:profile_id]) &
              track_ids(@args[:other_profile_id])
          end

          def track_ids(profile_id)
            profile_tracks(profile_id).pluck(
              :track_id
            )
          end

          def profile_tracks(profile_id)
            ::ProfileTrack.where(
              profile_id:
            )
          end

          def tracks_count
            @tracks_count ||=
              common_track_ids.size
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end

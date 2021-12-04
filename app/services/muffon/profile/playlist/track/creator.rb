module Muffon
  module Profile
    module Playlist
      module Track
        class Creator < Muffon::Profile::Playlist::Base
          include Muffon::Utils::Track

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:playlist_id],
              @args[:title],
              @args[:artist_name]
            ]
          end

          def data
            return forbidden if wrong_profile?

            process_playlist_track

            return errors_data if errors?

            { playlist_track_id: playlist_track.id }
          end

          def process_playlist_track
            playlist_track.tap do |track|
              track.artist_id = find_artist.id
              track.album_id = find_album&.id
              track.image_url = @args[:image_url]
              track.save
            end
          end

          def playlist_track
            @playlist_track ||= playlist.playlist_tracks.where(
              track_id: find_track.id
            ).first_or_initialize
          end

          def title
            @args[:title]
          end

          def artist_name
            @args[:artist_name]
          end

          def album_title
            @args[:album_title]
          end

          def errors?
            playlist_track.errors.any?
          end

          def errors
            playlist_track.errors_formatted
          end
        end
      end
    end
  end
end

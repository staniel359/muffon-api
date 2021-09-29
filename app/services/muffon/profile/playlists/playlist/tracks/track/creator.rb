module Muffon
  module Profile
    class Playlists
      class Playlist
        class Tracks
          class Track
            class Creator < Muffon::Profile::Playlists::Playlist::Tracks::Track
              include Muffon::Utils::Track

              private

              def primary_args
                [
                  @args.profile_id,
                  @args.token,
                  @args.playlist_id,
                  @args.title
                ]
              end

              def data
                return forbidden if wrong_profile?

                playlist_track

                return errors_data if errors?

                process_image
              end

              def playlist_track
                @playlist_track ||= playlist.playlist_tracks.create(
                  name: @args.name
                )
              end

              def create_params
                {
                  track_id: find_track.id,
                  artist_id: find_artist.id,
                  album_id: find_album&.id
                }
              end

              def title
                @args.title
              end

              def artist_name
                @args.artist
              end

              def errors?
                playlist_track.errors.any?
              end

              def errors
                playlist_track.errors.map do |e|
                  { e.attribute => e.type }
                end
              end
            end
          end
        end
      end
    end
  end
end

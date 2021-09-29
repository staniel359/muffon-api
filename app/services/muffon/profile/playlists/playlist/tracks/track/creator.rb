module Muffon
  module Profile
    class Playlists
      class Playlist
        class Tracks
          class Track
            class Creator < Muffon::Profile::Playlists::Playlist::Base
              include Muffon::Utils::Track

              private

              def primary_args
                [
                  @args.profile_id,
                  @args.token,
                  @args.playlist_id,
                  @args.title,
                  @args.artist
                ]
              end

              def data
                return forbidden if wrong_profile?

                playlist_track

                return errors_data if errors?

                process_image

                { playlist_track_id: playlist_track.id }
              end

              def playlist_track
                @playlist_track ||= playlist.playlist_tracks.create(
                  create_params
                )
              end

              def create_params
                {
                  track_id: find_track.id,
                  artist_id: find_artist.id,
                  album_id: find_album&.id,
                  image_url: @args.image_url
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

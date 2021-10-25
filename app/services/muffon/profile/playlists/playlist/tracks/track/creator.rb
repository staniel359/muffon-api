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
                  @args.track_id
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
                  track.artist_id = find_track.artist_id
                  track.album_id = find_album&.id
                  track.image_url = @args.image_url
                  track.save
                end
              end

              def playlist_track
                @playlist_track ||= playlist.playlist_tracks.where(
                  track_id: @args.track_id
                ).first_or_initialize
              end

              def find_track
                @find_track ||= ::Track.find_by(
                  id: @args.track_id
                )
              end

              def find_album
                return if @args.album.blank?

                ::Album.with_artist_title(
                  find_track.artist_id, @args.album
                )
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

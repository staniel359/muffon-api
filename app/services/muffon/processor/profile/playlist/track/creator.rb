module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Creator < Muffon::Processor::Profile::Playlist::Track::Base
            include Muffon::Utils::Track

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist]
              ]
            end

            def process_playlist_track
              playlist_track.update(
                update_params
              )

              return playlist_track.errors_data if
                  playlist_track.errors?

              process_image

              {
                playlist: playlist_data,
                playlist_track: playlist_track_data
              }
            end

            def playlist_track
              @playlist_track ||=
                playlist
                .playlist_tracks
                .where(
                  track_id: find_track.id
                ).first_or_initialize
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist]
            end

            def update_params
              {
                artist_id: find_artist.id,
                album_id: find_album&.id,
                source_data: @args[:source],
                audio_data: @args[:audio],
                album_source_data:
                  @args[:album_source]
              }
            end

            def album_title
              @args[:album]
            end

            def process_image
              playlist_track.process_image(
                @args[:image]
              )
            end

            def playlist_track_data
              { id: playlist_track.id }
            end
          end
        end
      end
    end
  end
end

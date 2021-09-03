module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track < Muffon::Profile::Bookmarks::Tracks
          def call
            data
          end

          private

          def data
            {
              id: id,
              player_id: player_id,
              title: title,
              artist: artist_data,
              album: album_data,
              image: image_data
            }.compact
          end

          def id
            bookmark_track.id
          end

          def bookmark_track
            @bookmark_track ||= @args.track
          end

          def player_id
            bookmark_track
              .track
              .player_id
          end

          def title
            bookmark_track
              .track
              .title
          end

          def artist_data
            { name: artist_name }
          end

          def artist_name
            bookmark_track
              .track
              .artist
              .name
          end

          def album_data
            return if bookmark_track_album.blank?

            { title: album_title }
          end

          def bookmark_track_album
            @bookmark_track_album ||=
              bookmark_track.album
          end

          def album_title
            bookmark_track_album.title
          end

          def image_data
            LastFM::Utils::Image.call(
              model: 'track',
              image: bookmark_track.image_url
            )
          end
        end
      end
    end
  end
end

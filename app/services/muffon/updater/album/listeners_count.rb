module Muffon
  module Updater
    module Album
      class ListenersCount < Muffon::Base
        def call
          return if not_all_args?

          update_album_listeners_count
        end

        private

        def not_all_args?
          [title, artist_name].any?(&:blank?)
        end

        def title
          @title ||= @args.album[:title]
        end

        def artist_name
          @artist_name ||= @args.album.dig(
            :artist, :name
          )
        end

        def update_album_listeners_count
          album.update(
            listeners_count: listeners_count
          )
        end

        def album
          ::Album.with_artist_title(
            artist_name, title
          )
        end

        def listeners_count
          @args.album[:listeners_count]
        end
      end
    end
  end
end

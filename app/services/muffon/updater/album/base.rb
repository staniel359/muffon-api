module Muffon
  module Updater
    module Album
      class Base < Muffon::Base
        def call
          return if no_album? || not_all_args?

          update_album
        end

        private

        def no_album?
          @args.album.blank?
        end

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

        def album
          ::Album.with_artist_title(
            artist_name, title
          )
        end
      end
    end
  end
end

module Muffon
  module Updater
    module Artist
      class Base < Muffon::Base
        def call
          return if no_artist? || not_all_args?

          update_artist
        end

        private

        def no_artist?
          @args.artist.blank?
        end

        def not_all_args?
          artist_name.blank?
        end

        def artist_name
          @artist_name ||= @args.artist[:name]
        end

        def artist
          ::Artist.with_name(artist_name)
        end
      end
    end
  end
end

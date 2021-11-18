module Muffon
  module Updater
    module Album
      class Base < Muffon::Base
        include Muffon::Utils::Album

        def call
          return if no_album? || not_all_args?

          update_album
        end

        private

        def no_album?
          album.blank?
        end

        def album
          @args[:album]
        end

        def not_all_args?
          [
            title,
            artist_name
          ].any?(&:blank?)
        end

        def title
          album[:title]
        end

        def artist_name
          album.dig(
            :artist, :name
          )
        end
      end
    end
  end
end

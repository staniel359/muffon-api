module Muffon
  module Updater
    module Artist
      class Base < Muffon::Base
        include Muffon::Utils::Artist

        def call
          return if no_artist? || not_all_args?

          update_artist
        end

        private

        def no_artist?
          artist.blank?
        end

        def artist
          @args[:artist]
        end

        def not_all_args?
          name.blank?
        end

        def name
          artist[:name]
        end
      end
    end
  end
end

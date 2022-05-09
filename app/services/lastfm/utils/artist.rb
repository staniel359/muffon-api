module LastFM
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end
    end
  end
end

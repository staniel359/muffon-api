module YandexMusic
  module Artist
    class Info < YandexMusic::Artist::Base
      include YandexMusic::Mixins::Artist

      private

      def raw_artist_data
        response_data['artist']
      end

      def request_url
        "#{super}/info"
      end
    end
  end
end

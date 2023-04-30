module YandexMusic
  module Track
    class Links < YandexMusic::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end

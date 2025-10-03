module YandexMusic
  module Track
    class Links < YandexMusic::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end

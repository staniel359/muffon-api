module Bandcamp
  module Utils
    module Search
      private

      def name
        model['name']
      end

      def artist_name
        model['band_name']
      end

      def source_data
        {
          name: source_name,
          id: bandcamp_id,
          artist_id: artist_bandcamp_id,
          model: model_name
        }.compact
      end

      def bandcamp_id
        model['id']
      end

      def artist_bandcamp_id
        return if model_name == 'artist'

        model['band_id']
      end

      def artist_data
        {
          source: artist_source_data,
          name: artist_name
        }
      end

      def artist_source_data
        {
          name: source_name,
          id: artist_bandcamp_id
        }
      end

      def image_data
        image_data_formatted(
          image(
            model
          )
        )
      end
    end
  end
end

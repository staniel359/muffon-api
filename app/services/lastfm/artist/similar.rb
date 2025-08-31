module LastFM
  module Artist
    class Similar < LastFM::Artist::Base
      API_METHOD = 'artist.getSimilar'.freeze
      COLLECTION_NAME = 'similar'.freeze
      TOTAL_LIMIT = 200
      WEB_PAGES_COUNT = 20

      include LastFM::Artist::Utils::Pagination

      private

      def not_found?
        super ||
          name.blank?
      end

      def artist
        response_data[
          'similarartists'
        ]
      end

      def params
        {
          **super,
          artist:
            @args[:artist_name],
          limit: TOTAL_LIMIT
        }
      end

      def data
        { artist: artist_data }
      end

      def name
        artist.dig(
          '@attr',
          'artist'
        )
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end

      def raw_collection_list
        @raw_collection_list ||=
          original_raw_collection_list.presence ||
          web_raw_collection_list
      end

      def original_raw_collection_list
        artist['artist']
      end

      def web_raw_collection_list
        Parallel.map(
          1..WEB_PAGES_COUNT,
          in_threads: WEB_PAGES_COUNT
        ) do |page|
          web_page_raw_collection_list(page)
        end.flatten.uniq
      end

      def web_page_raw_collection_list(page)
        LastFM::Artist::Web::Similar.call(
          artist_name:
            @args[:artist_name],
          page:
        ).dig(
          :artist, :similar
        ) || []
      end

      def total_items_count
        @total_items_count ||=
          raw_collection_list.size
      end

      def collection_item_data_formatted(artist)
        LastFM::Artist::Similar::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end

      # alias link similar_artists_link
    end
  end
end

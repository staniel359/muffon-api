module LastFM
  module Top
    class Albums < LastFM::Top::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze

      def call
        super
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def collection_item_data_formatted(album)
        LastFM::Top::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

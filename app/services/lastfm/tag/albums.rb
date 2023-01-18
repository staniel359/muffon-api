module LastFM
  module Tag
    class Albums < LastFM::Tag::Base
      API_METHOD = 'tag.getTopAlbums'.freeze
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze

      include LastFM::Tag::Utils::Pagination

      private

      def collection_item_data_formatted(album)
        LastFM::Tag::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end

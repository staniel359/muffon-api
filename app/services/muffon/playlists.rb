module Muffon
  class Playlists < Muffon::Base
    DEFAULT_ORDER = 'created_desc'.freeze

    def call
      data
    end

    private

    def data
      { playlists: playlists_data }
    end

    def playlists_data
      paginated_data(
        collection_name: 'playlists',
        raw_collection:,
        page:,
        limit:,
        items_count:
      )
    end

    def raw_collection
      playlists
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
    end

    def playlists
      @playlists ||=
        if creator?
          ::Playlist
        else
          ::Playlist
            .by_public_profile
            .public
        end
    end

    def items_count
      playlists.count
    end

    def collection_item_data_formatted(playlist)
      Muffon::Profile::Playlists::Playlist.call(
        playlist:
      )
    end
  end
end

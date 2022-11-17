module Muffon
  class Playlists < Muffon::Base
    COLLECTION_NAME = 'playlists'.freeze
    DEFAULT_ORDER = 'created_desc'.freeze

    include Muffon::Utils::Pagination

    private

    def data
      { playlists: paginated_data }
    end

    def total_items_count
      @total_items_count ||= playlists.count
    end

    def playlists
      @playlists ||= playlists_conditional
    end

    def playlists_conditional
      if creator?
        ::Playlist
      else
        ::Playlist
          .by_public_profile
          .public
      end
    end

    def collection_list
      playlists
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
    end

    def collection_item_data_formatted(playlist)
      Muffon::Profile::Playlists::Playlist.call(
        playlist:
      )
    end
  end
end

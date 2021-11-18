module Muffon
  module Updater
    module Artist
      class Tags < Muffon::Updater::Artist::Base
        def call
          return if @args[:artist_id].blank?
          return if tags_list.blank?

          update_artist
        end

        private

        def tags_list
          @tags_list ||= artist_data.dig(
            :artist, :tags
          )
        end

        def artist_data
          LastFM::Artist::Tags.call(
            artist: find_artist.name
          )
        end

        def find_artist
          @find_artist ||= ::Artist.find_by(
            id: @args[:artist_id]
          )
        end

        def update_artist
          find_artist.update(
            tag_ids: tag_ids
          )
        end

        def tag_ids
          tag_names.map do |name|
            tag_id(name)
          end
        end

        def tag_names
          tags_list.pluck(:name)
        end

        def tag_id(name)
          ::Tag.with_name(name).id
        end
      end
    end
  end
end

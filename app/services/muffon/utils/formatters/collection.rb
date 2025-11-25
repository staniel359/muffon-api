module Muffon
  module Utils
    module Formatters
      module Collection
        private

        def artists
          @artists ||=
            raw_artists.map do |raw_artist_data|
              artist_data_formatted(
                raw_artist_data
              )
            end
        end

        def albums
          @albums ||=
            raw_albums.map do |raw_album_data|
              album_data_formatted(
                raw_album_data
              )
            end
        end

        def tracks
          @tracks ||=
            raw_tracks.map do |raw_track_data|
              track_data_formatted(
                raw_track_data
              )
            end
        end

        def tags
          @tags ||=
            raw_tags.map do |raw_tag_data|
              tag_data_formatted(
                raw_tag_data
              )
            end
        end

        def tag_data_formatted(
          raw_tag_data
        )
          { name: tag_name_formatted(raw_tag_data) }
        end

        def labels
          raw_labels
            .map do |raw_label_data|
              label_data_formatted(
                raw_label_data
              )
            end
            .uniq
        end

        def label_data_formatted(
          raw_label_data
        )
          label_name_formatted(
            raw_label_data
          )
        end

        def images
          @images ||=
            raw_images.map do |raw_image_data|
              image_data_formatted(
                raw_image_data
              )
            end
        end

        def library_tags_formatted(
          library_tags
        )
          tags =
            Tag.where(
              id: library_tags.pluck(:id)
            )

          library_tags.map do |library_tag_data|
            format_library_tag(
              library_tag_data,
              tags
            )
          end
        end

        def format_library_tag(
          library_tag_data,
          tags
        )
          tag =
            tags.find do |tag|
              tag.id == library_tag_data[:id]
            end

          library_tag_data[:name] = tag.name

          library_tag_data
        end
      end
    end
  end
end

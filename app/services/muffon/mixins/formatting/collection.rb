module Muffon
  module Mixins
    module Formatting
      module Collection
        private

        def artists
          raw_artists.map do |raw_artist_data|
            artist_data_formatted(
              raw_artist_data
            )
          end
        end

        def artist_data_formatted(
          raw_artist_data
        )
          {
            source: artist_source_data(
              raw_artist_data
            ),
            name: raw_artist_data[:name]
          }
        end

        def artist_source_data(
          raw_artist_data
        )
          {
            name: source_name,
            id: raw_artist_data[:source_id],
            slug: raw_artist_data[:source_slug]
          }.compact
        end

        def albums
          raw_albums.map do |raw_album_data|
            album_data_formatted(
              raw_album_data
            )
          end
        end

        def tracks
          raw_tracks
            .map do |raw_track_data|
              track_data_formatted(
                raw_track_data
              )
            end
            .compact
        end

        def tags
          raw_tags.map do |raw_tag_data|
            tag_data_formatted(
              raw_tag_data
            )
          end
        end

        def tag_data_formatted(
          raw_tag_data
        )
          {
            name: tag_name_formatted(
              raw_tag_data
            )
          }
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
          raw_images.map do |raw_image_data|
            image_data_formatted(
              raw_image_data
            )
          end
        end
      end
    end
  end
end

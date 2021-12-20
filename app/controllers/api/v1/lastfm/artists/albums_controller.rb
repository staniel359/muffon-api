module API
  module V1
    module LastFM
      module Artists
        class AlbumsController < ArtistsController
          def info
            render_data_with_status
          end

          def description
            render_data_with_status
          end

          def tags
            render_data_with_status
          end

          def listeners_count
            update_album_listeners_count

            render_data_with_status
          end

          private

          def info_data
            ::LastFM::Album::Info.call(
              params.slice(
                *%i[artist album profile_id]
              )
            )
          end

          def description_data
            ::LastFM::Album::Description.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def tags_data
            ::LastFM::Album::Tags.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def listeners_count_data
            ::LastFM::Album::ListenersCount.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def update_album_listeners_count
            ::Muffon::Processor::Album::ListenersCount::Updater.call(
              title: album_data[:title],
              artist_name: album_data.dig(
                :artist, :name
              ),
              listeners_count:
                album_data[:listeners_count]
            )
          end

          def album_data
            data[:album] || {}
          end
        end
      end
    end
  end
end

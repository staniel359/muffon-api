module VK
  module Utils
    module Audio
      class Decrypter < VK::Base
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:link]]
        end

        def no_data?
          playlist_data.blank?
        end

        def playlist_data
          @playlist_data ||=
            VK::Utils::Audio::Playlist.call(
              link: @args[:link]
            )
        end

        def data
          fragments_data.sort.map(
            &:second
          ).join
        end

        def fragments_data
          Parallel.map_with_index(
            fragments_paths,
            in_threads: threads_count
          ) do |path, index|
            fragment_data(
              index, path
            )
          end
        end

        def fragments_paths
          playlist_data[:fragments_paths]
        end

        def threads_count
          fragments_paths.size
        end

        def fragment_data(index, path)
          VK::Utils::Audio::Decrypter::Fragment.call(
            index:,
            link: fragment_link(path),
            cipher:
          )
        end

        def fragment_link(path)
          "#{base_link}#{path}"
        end

        def base_link
          playlist_data[:base_link]
        end

        def cipher
          @cipher ||=
            VK::Utils::Audio::Cipher.call(
              key:
            )
        end

        def key
          playlist_data[:key]
        end
      end
    end
  end
end

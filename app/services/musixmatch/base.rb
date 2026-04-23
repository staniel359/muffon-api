module MusixMatch
  class Base < Muffon::Base
    SOURCE_NAME = 'musixmatch'.freeze
    BASE_LINK = 'https://www.musixmatch.com'.freeze

    include Muffon::Mixins::GlobalStorage

    private

    def base_link
      "#{BASE_LINK}/_next/data/#{musixmatch_link_build_id}/en"
    end

    def musixmatch_link_build_id
      return musixmatch_test_link_build_id if test?

      @musixmatch_link_build_id ||=
        get_global_value(
          'musixmatch:link_build_id',
          refresh_class_name:
            'MusixMatch::Utils::LinkBuildId',
          is_refresh: refresh_link_build_id?
        )
    end

    def musixmatch_test_link_build_id
      credentials.dig(
        :musixmatch,
        :test_link_build_id
      )
    end

    def refresh_link_build_id?
      !!@args[:is_refresh_link_build_id]
    end

    def cookies
      credentials.dig(
        :musixmatch,
        :cookies
      )
    end

    def handle_not_found_error(
      error
    )
      is_wrong_link_build_id =
        JSON.parse(
          error.response_body
        ).dig(
          'pageProps',
          'data',
          'footer',
          'error'
        )

      unless is_wrong_link_build_id && !refresh_link_build_id?
        raise not_found_error
      end

      self.class.call(
        **@args,
        is_refresh_link_build_id: true
      )
    end
  end
end

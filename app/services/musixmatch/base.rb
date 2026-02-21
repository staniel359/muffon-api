module MusixMatch
  class Base < Muffon::Base
    SOURCE_NAME = 'musixmatch'.freeze
    BASE_LINK = 'https://www.musixmatch.com'.freeze

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
      'fNde2hbCe1brBnYf2PEOi'
    end

    def refresh_link_build_id?
      !!@args[:is_refresh_link_build_id]
    end

    # rubocop:disable Layout/LineLength
    def cookies
      {
        'captcha_id' => '7BZeFfgQrSH+XcFcC5mQRvbayt6n0aEoNzHrZm1A+2Bmj0+N94wWuHq0yqnKVWz8S0kkCRT/3BrvKgC20yerK8aLC7ZX6insElVPANb5aYWqwNehnSVoU81p78PMymWm',
        'musixmatchUserToken' => '{"tokens":{"mxm-account-v1.0":"26020903eefc78d53a9bbb0e65c34ed5dca95bc38552b730b418","mxm-com-v1.0":"26028615715593ed3cf85f9b3d1200b382447d596decb48a5e92","web-desktop-app-v1.0":"2602ad52220853349441e9d902d96fa3cfa39c061f488d28bc9e","musixmatch-podcasts-v2.0":"2602c74a4d396719ef1456e96a92466392e366c4940728f7cdfb","mxm-pro-web-v1.0":"2602622328dbf8447e6bdfc573f7963fe994e45c91b436104952","musixmatch-publishers-v2.0":"26024c39407eeaff359f500c698146e46c21e719fe7bfad58732","mxm-experiments-unstable-v1.0":"2602fd973ef88a551eb74f9b8e7a9845f6fb5896451127b335c5","mxm-experiments-v1.0":"2602733b87a3bef600a6596978d74941e3f7311b09cda4014ab4"},"version":1}',
        'mxm_bab' => 'AA'
      }
    end
    # rubocop:enable Layout/LineLength

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

    def image_data_formatted(
      image
    )
      MusixMatch::Utils::Image.call(
        image:
      )
    end
  end
end

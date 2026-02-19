module MusixMatch
  class Base < Muffon::Base
    SOURCE_NAME = 'musixmatch'.freeze
    BASE_LINK =
      'https://www.musixmatch.com/_next/data/fNde2hbCe1brBnYf2PEOi/en'.freeze

    private

    # rubocop:disable Layout/LineLength
    def cookies
      {
        'intercom-device-id-d2v13u5s' => 'd7dd3f43-316b-42b5-88b2-e685df396f8e',
        'intercom-id-d2v13u5s' => 'ffc75a4f-9abf-4918-b6fa-32aca84ea840',
        'musixmatchUserGuid' => '653db7b8-9a2b-4897-8953-36998a59af13',
        'musixmatchUserToken' => '{"tokens":{"mxm-account-v1.0":"25129347d67a55256dcc8e639d620967119d348f18e13c56642a","mxm-com-v1.0":"2512e1a3845c7648239553a447d0129bdc76b1b1850e16eca8a5","web-desktop-app-v1.0":"2512d0ac75039ad0513817059a4395f1adcac0409524772eeedb","musixmatch-podcasts-v2.0":"2512a8435520ba8df404ff92d3520eb4710512e65b62959de0e1","mxm-pro-web-v1.0":"25122645c8705bb79c8abec1a8a53dbb37085434ce0deed685d0","musixmatch-publishers-v2.0":"25128f44f99620959462be12cd1bff7a76038212915a7c31d51d"},"version":1}',
        'mxm_bab' => 'BA',
        'ph_phc_TXdpocbGVeZVm5VJmAsHTMrCofBQu3e0kN8HGMNGTVW_posthog' => '{"distinct_id":"01954923-3065-743d-af55-bd8c8582fcda","$sesid":[1754515585756,"0198813f-fd05-7862-90c9-26703272827d",1754515111173]}',
        'translate_lang' => '{"key":"en","name":"English"}'
      }
    end
    # rubocop:enable Layout/LineLength

    def image_data_formatted(
      image
    )
      MusixMatch::Utils::Image.call(
        image:
      )
    end
  end
end

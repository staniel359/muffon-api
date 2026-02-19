module MusixMatch
  class Base < Muffon::Base
    SOURCE_NAME = 'musixmatch'.freeze

    private

    def headers
      {
        **super,
        'Cookie' => cookie
      }
    end

    # rubocop:disable Layout/LineLength
    def cookie
      'mxm_bab=BA; translate_lang=%7B%22key%22%3A%22en%22%2C%22name%22%3A%22English%22%7D; musixmatchUserGuid=653db7b8-9a2b-4897-8953-36998a59af13; musixmatchUserToken=230812796cdefe19f917d094c40d94621d8fb6c3ab397f97840ae3; ph_phc_TXdpocbGVeZVm5VJmAsHTMrCofBQu3e0kN8HGMNGTVW_posthog=%7B%22distinct_id%22%3A%2201954923-3065-743d-af55-bd8c8582fcda%22%2C%22%24sesid%22%3A%5B1754515585756%2C%220198813f-fd05-7862-90c9-26703272827d%22%2C1754515111173%5D%7D; intercom-id-d2v13u5s=ffc75a4f-9abf-4918-b6fa-32aca84ea840; interco…cc8e639d620967119d348f18e13c56642a%22%2C%22mxm-com-v1.0%22%3A%222512e1a3845c7648239553a447d0129bdc76b1b1850e16eca8a5%22%2C%22web-desktop-app-v1.0%22%3A%222512d0ac75039ad0513817059a4395f1adcac0409524772eeedb%22%2C%22musixmatch-podcasts-v2.0%22%3A%222512a8435520ba8df404ff92d3520eb4710512e65b62959de0e1%22%2C%22mxm-pro-web-v1.0%22%3A%2225122645c8705bb79c8abec1a8a53dbb37085434ce0deed685d0%22%2C%22musixmatch-publishers-v2.0%22%3A%2225128f44f99620959462be12cd1bff7a76038212915a7c31d51d%22%7D%2C%22version%22%3A1%7D'
    end
    # rubocop:enable Layout/LineLength

    def image_data_formatted(image)
      MusixMatch::Utils::Image.call(
        image:
      )
    end
  end
end

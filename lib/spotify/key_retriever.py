from pywidevine.cdm import Cdm
from pywidevine.device import Device
from pywidevine.pssh import PSSH

import argparse, requests, sys, os

parser = argparse.ArgumentParser()

parser.add_argument('--pssh')
parser.add_argument('--token')

args = parser.parse_args()

key = ''

license_url = 'https://gew1-spclient.spotify.com/widevine-license/v1/audio/license'

widevine_file_path = os.getcwd() + '/lib/widevine.wvd'

device = Device.load(widevine_file_path)

cdm = Cdm.from_device(device)

session_id = cdm.open()

pssh = PSSH(args.pssh)

challenge = cdm.get_license_challenge(session_id, pssh)

license_headers = {
  'Authorization': f'Bearer {args.token}'
}

license = requests.post(
  license_url,
  headers = license_headers,
  data = challenge
)

license.raise_for_status()

if license:
  cdm.parse_license(
    session_id,
    license.content
  )

  for i in cdm.get_keys(session_id):
    if i.type == 'CONTENT':
      key = i.key.hex()

cdm.close(session_id)

sys.stdout.write(key)

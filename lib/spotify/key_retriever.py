from pywidevine.device import Device
from pywidevine.cdm import Cdm
from pywidevine.pssh import PSSH

import argparse, requests, sys, os

parser = argparse.ArgumentParser()

parser.add_argument('--pssh')
parser.add_argument('--token')
parser.add_argument('--client_token')
parser.add_argument('--user_agent')

args = parser.parse_args()

license_url = 'https://gew1-spclient.spotify.com/widevine-license/v1/audio/license'

license_headers = {
  'Authorization': f'Bearer {args.token}',
  'Client-Token': f'{args.client_token}',
  'User-Agent': f'{args.user_agent}',
  'Host': 'gew1-spclient.spotify.com',
  'Origin': 'https://open.spotify.com',
  'Referer': 'https://open.spotify.com/'
}

widevine_file_path = os.getcwd() + '/lib/widevine.wvd'

device = Device.load(widevine_file_path)

cdm = Cdm.from_device(device)

session_id = cdm.open()

pssh = PSSH(args.pssh)

challenge = cdm.get_license_challenge(
  session_id = session_id,
  pssh = pssh
)

license = requests.post(
  license_url,
  headers = license_headers,
  data = challenge
)

license.raise_for_status()

key = ''

if license:
  cdm.parse_license(
    session_id = session_id,
    license_message = license.content
  )

  for key_data in cdm.get_keys(
    session_id = session_id
  ):
    if key_data.type == 'CONTENT':
      key = key_data.key.hex()

cdm.close(session_id)

sys.stdout.write(key)

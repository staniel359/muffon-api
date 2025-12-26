from pywidevine.remotecdm import RemoteCdm
from pywidevine.pssh import PSSH

import argparse, requests, sys, os

import json

widevine_file_path = os.getcwd() + '/lib/widevine.json'

with open(widevine_file_path) as file:
  widevine_data = json.load(file)

parser = argparse.ArgumentParser()

parser.add_argument(
  '--pssh'
)

parser.add_argument(
  '--token'
)

parser.add_argument(
  '--client-token'
)

args = parser.parse_args()

key = ''

license_url = 'https://gew1-spclient.spotify.com/widevine-license/v1/audio/license'

cdm = RemoteCdm(
  device_type = widevine_data['device_type'],
  system_id = widevine_data['system_id'],
  security_level = widevine_data['security_level'],
  host = widevine_data['host'],
  secret = widevine_data['secret'],
  device_name = widevine_data['device_name']
)

session_id = cdm.open()

pssh = PSSH(
  args.pssh
)

challenge = cdm.get_license_challenge(
  session_id = session_id,
  pssh = pssh
)

license_headers = {
  'Authorization': f'Bearer {args.token}',
  'Client-Token': f'{args.client_token}'
}

license = requests.post(
  license_url,
  headers = license_headers,
  data = challenge
)

license.raise_for_status()

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

cdm.close(
  session_id
)

sys.stdout.write(
  key
)

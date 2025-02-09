from pywidevine.cdm import Cdm
from pywidevine.device import Device
from pywidevine.pssh import PSSH

import argparse, requests, sys, os, json, base64

parser = argparse.ArgumentParser()

parser.add_argument('--pssh')
parser.add_argument('--token')
parser.add_argument('--device_id')
parser.add_argument('--device_type_id')
parser.add_argument('--user_agent')

args = parser.parse_args()

key = ''

license_url = 'https://music.amazon.co.uk/EU/api/dmls/'

license_headers = {
  'Content-Type': 'application/json',
  'X-Amz-Target': 'com.amazon.digitalmusiclocator.DigitalMusicLocatorServiceExternal.getLicenseForPlaybackV2',
  'Content-Encoding': 'amz-1.0',
  'Authorization': f'Bearer {args.token}',
  'User-Agent': args.user_agent
}

widevine_file_path = os.getcwd() + '/lib/widevine.wvd'

device = Device.load(widevine_file_path)

cdm = Cdm.from_device(device)

session_id = cdm.open()

pssh = PSSH(args.pssh)

lisense_challenge = cdm.get_license_challenge(session_id, pssh)

license_challenge_string = base64.b64encode(lisense_challenge).decode('ascii')

license_data = {
  'DrmType': 'WIDEVINE',
  'licenseChallenge': license_challenge_string,
  'deviceToken': {
    'deviceId': args.device_id,
    'deviceTypeId': args.device_type_id
  },
  'appInfo':{
    'musicAgent': 'Maestro/1.0 WebCP/1.0.15759.0 (872f-910b-WebC-4615-1cf31)'
  }
}

license_response = requests.post(
  license_url,
  headers = license_headers,
  data = json.dumps(license_data)
)

license_response.raise_for_status()

if license_response:
  license = json.loads(license_response.content)['license']

  cdm.parse_license(
    session_id,
    license
  )

  for i in cdm.get_keys(session_id):
    if i.type == 'CONTENT':
      key = i.key.hex()

cdm.close(session_id)

sys.stdout.write(key)

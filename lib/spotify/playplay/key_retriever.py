import argparse, requests, sys

from playplay_pb2 import (
  PlayPlayLicenseRequest,
  PlayPlayLicenseResponse,
  Interactivity,
  AUDIO_TRACK
)

from re_unplayplay import (
  get_token,
  decrypt_and_bind_key
)

playplay_token = get_token()

parser = argparse.ArgumentParser()

parser.add_argument('--file_id')
parser.add_argument('--token')

args = parser.parse_args()

license_request = PlayPlayLicenseRequest(
  version=2,
  token=playplay_token,
  interactivity=Interactivity.INTERACTIVE,
  content_type=AUDIO_TRACK
)

license_response = requests.post(
  url=f"https://gew4-spclient.spotify.com/playplay/v1/key/{args.file_id}",
  headers={
    "Authorization": f"Bearer {args.token}"
  },
  data=license_request.SerializeToString()
)

license_response.raise_for_status()

playplay_license_response = PlayPlayLicenseResponse()

playplay_license_response.ParseFromString(
  license_response.content
)

obfuscated_key = playplay_license_response.obfuscated_key

key = decrypt_and_bind_key(
  obfuscated_key,
  args.file_id
)

sys.stdout.write(
  key.hex()
)

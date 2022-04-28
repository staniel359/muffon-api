import sys
import os

sys.path.append('../librespot-python')
sys.path.append('/root/librespot-python')

from librespot.core import Session
from librespot.metadata import TrackId
from librespot.audio.decoders import AudioQuality, VorbisOnlyAudioQuality

email = sys.argv[1]
password = sys.argv[2]
session = Session.Builder().user_pass(
  email, password
).create()

track_id = sys.argv[3]
track_id_object = TrackId.from_base62(
  track_id
)
quality = VorbisOnlyAudioQuality(
  AudioQuality.HIGH
)
stream = session.content_feeder().load(
  track_id_object, quality, False, None
)

folder_path = 'files/audio/spotify'
folder_public_path = 'public/%s' % folder_path

if not os.path.exists(folder_public_path):
  os.makedirs(folder_public_path)

file_public_name = '%s/%s.mp3' % (folder_public_path, track_id)
file = open(file_public_name, 'wb')

audio_binary = stream.input_stream.stream().read()

file.write(audio_binary)
file.close()

file_name = '%s/%s.mp3' % (folder_path, track_id)

sys.stdout.write(file_name)

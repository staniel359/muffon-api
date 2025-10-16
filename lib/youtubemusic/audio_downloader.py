from pytubefix import YouTube

import argparse

parser = argparse.ArgumentParser()

parser.add_argument('--video_id')
parser.add_argument('--output_path')
parser.add_argument('--file_name')

args = parser.parse_args()

video = YouTube(
  'https://www.youtube.com/watch?v=' + args.video_id
)

audio_stream = video.streams.get_audio_only()

audio_stream.download(
  output_path=args.output_path,
  filename=args.file_name
)

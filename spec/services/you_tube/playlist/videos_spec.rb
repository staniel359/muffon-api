RSpec.describe YouTube::Playlist::Videos do
  subject { described_class }

  describe 'successful processing' do
    context 'when playlist present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/playlist/videos/success'
        ) do
          subject.call(
            playlist_id: 'UUZBXFjbyp1gezLRsDbG2hKQ',
            page: 'EAAaBlBUOkNBVQ',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(youtube_playlist_videos_data) }
    end
  end

  describe 'no processing' do
    context 'when no playlist_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong playlist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/playlist/videos/wrong_id'
        ) do
          subject.call(
            playlist_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end

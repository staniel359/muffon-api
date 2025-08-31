RSpec.describe YouTube::Playlist::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when playlist present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/playlist/info/success'
        ) do
          subject.call(
            playlist_id: 'PLUh4W61bt_K78wGbr6lUgPb5gjine4I6G'
          )
        end
      end

      it { expect(output).to eq(youtube_playlist_info_data) }
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
          'services/youtube/playlist/info/wrong_id'
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

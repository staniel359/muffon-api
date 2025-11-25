RSpec.describe YouTube::Channel::Videos do
  subject { described_class }

  describe 'successful processing' do
    context 'when channel present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/channel/videos/success'
        ) do
          subject.call(
            channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ',
            page: 'EAAaBlBUOkNBVQ',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(youtube_channel_videos_data) }
    end
  end

  describe 'no processing' do
    context 'when no channel_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong channel_id' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/channel/videos/wrong_id'
        ) do
          subject.call(
            channel_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end

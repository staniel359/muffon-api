RSpec.describe YouTube::Playlists do
  subject { described_class }

  describe 'successful processing' do
    context 'when channel_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/playlists/success'
        ) do
          subject.call(
            channel_id: 'UCGJdzJQ3R1BpahSvcFq23HA',
            page: 'CAUQAA',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(youtube_playlists_data) }
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
          'services/youtube/playlists/wrong_id'
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

RSpec.describe YouTube::Channel::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when channel present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtube/channel/info/success'
        ) do
          subject.call(
            channel_id: 'UC7kI8WjpCfFoMSNDuRh_4lA',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(youtube_channel_info_data) }
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
          'services/youtube/channel/info/wrong_id'
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

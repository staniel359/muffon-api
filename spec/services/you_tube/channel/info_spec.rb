RSpec.describe YouTube::Channel::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when channel present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/channel/info/success' do
          subject.call(channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Channel.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no channel_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong channel_id' do
      let(:output) do
        VCR.use_cassette 'services/youtube/channel/info/wrong_id' do
          subject.call(channel_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

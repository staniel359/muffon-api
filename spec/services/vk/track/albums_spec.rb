RSpec.describe VK::Track::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/albums/success' do
          subject.call(track_id: '138779021_456239923', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/albums/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

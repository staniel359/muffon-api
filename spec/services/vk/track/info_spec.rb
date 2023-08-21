RSpec.describe VK::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/success' do
          subject.call(track_id: '-2001472560_55472560', profile_id: 1, with_audio: true)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.info_data) }
    end

    context 'when track with no album' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/success_no_album' do
          subject.call(track_id: '-400921_90392497', profile_id: 1, with_audio: true)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.info_no_album_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

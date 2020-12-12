require 'rails_helper'

RSpec.describe VK::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:track_id) do
        '371745467_456356977_2c172e57fa47bb373b_9efa0eab8ba5f239f6'
      end
      let(:output) do
        VCR.use_cassette 'vk/track/info/success' do
          subject.call(track_id: track_id)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'vk/track/info/wrong_id' do
          subject.call(track_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

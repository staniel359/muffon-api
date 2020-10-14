require 'rails_helper'

RSpec.describe VK::Utils::Remixsid do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args given' do
      let(:output) do
        VCR.use_cassette 'vk/utils/remixsid/success' do
          subject.call
        end
      end

      it { expect(output).to eq(Helpers::VK::Utils.remixsid_data) }
    end
  end
end

require 'rails_helper'

RSpec.describe VK::Remixsid do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args given' do
      let(:output) do
        VCR.use_cassette 'vk/remixsid/success' do
          subject.call
        end
      end

      it { expect(output).to eq(Helpers::VK.remixsid) }
    end
  end
end

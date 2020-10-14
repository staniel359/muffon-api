require 'rails_helper'

RSpec.describe VK::Utils::Decoder do
  subject { described_class }

  describe 'successful processing' do
    context 'when link given' do
      let(:output) do
        subject.call(link: Helpers::VK::Utils.encoded_data)
      end

      it { expect(output).to eq(Helpers::VK::Utils.decoded_data) }
    end
  end

  describe 'no processing' do
    context 'when no link given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) { subject.call(link: 'www.example.com') }

      it { expect(output).to eq('') }
    end
  end
end

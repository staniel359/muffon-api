require 'rails_helper'

RSpec.describe Deezer::Utils::Tokens::Track do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette 'deezer/utils/tokens/track/success' do
          subject.call(track_id: '11221319')
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils::Tokens.track_data) }
    end
  end

  describe 'unsuccessful processing' do
    context 'when no track_id given' do
      let(:output) do
        VCR.use_cassette 'deezer/utils/tokens/track/no_id' do
          subject.call
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils::Tokens.track_no_data) }
    end
  end
end

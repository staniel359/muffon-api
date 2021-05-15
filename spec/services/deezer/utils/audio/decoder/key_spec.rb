require 'rails_helper'

RSpec.describe Deezer::Utils::Audio::Decoder::Key do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) { subject.call(track_id: '11221319') }

      it { expect(output).to eq("05=cdo\u007F7h|p089:<") }
    end
  end

  describe 'unsuccessful processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq('') }
    end
  end
end

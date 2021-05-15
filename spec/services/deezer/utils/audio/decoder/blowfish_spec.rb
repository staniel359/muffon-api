require 'rails_helper'

RSpec.describe Deezer::Utils::Audio::Decoder::Blowfish do
  subject { described_class.new(track_id: '11221319') }

  describe 'successful processing' do
    context 'when string given' do
      let(:output) { subject.decrypt("\xAAnF:\"\xC5J~") }

      it { expect(output).to eq('testtest') }
    end
  end

  describe 'unsuccessful processing' do
    context 'when no string given' do
      let(:output) { subject.decrypt }

      it { expect(output).to eq('') }
    end
  end
end

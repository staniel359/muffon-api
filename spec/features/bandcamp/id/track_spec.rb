require 'rails_helper'

RSpec.describe Bandcamp::Id::Track do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/track/success' do
          subject.call(artist: 'wildnothingct', track: 'letting-go')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Id.track_data) }
    end
  end

  describe 'no processing' do
    context 'when no track' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette 'bandcamp/id/track/wrong_title' do
          subject.call(
            artist: 'wildnothingct',
            track: Helpers::Base::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

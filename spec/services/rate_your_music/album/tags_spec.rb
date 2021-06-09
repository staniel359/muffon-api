require 'rails_helper'

RSpec.describe RateYourMusic::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album given' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/tags/success' do
          subject.call(album: 'release/album/sparks/in-outer-space/')
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Album.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no album given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/tags/wrong_id' do
          subject.call(album: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

require 'rails_helper'

RSpec.describe Bandcamp::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present with album' do
      let(:output) do
        VCR.use_cassette 'bandcamp/track/info/success_album' do
          subject.call(artist: 'wildnothingct', track: 'letting-go')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.info_album_data) }
    end

    context 'when track present with description' do
      let(:output) do
        VCR.use_cassette 'bandcamp/track/info/success_description' do
          subject.call(artist: 'wildnothingct', track: 'blue-wings')
        end
      end

      it do
        expect(output).to eq(Helpers::Bandcamp::Track.info_description_data)
      end
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette 'bandcamp/track/info/wrong_track' do
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

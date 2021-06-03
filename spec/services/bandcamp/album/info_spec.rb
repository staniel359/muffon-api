require 'rails_helper'

RSpec.describe Bandcamp::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/album/info/success' do
          subject.call(artist_id: '2228040235', album_id: '452973411')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/album/info/wrong_album' do
          subject.call(artist_id: '2228040235', album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end

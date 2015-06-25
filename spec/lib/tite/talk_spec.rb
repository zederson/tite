require 'spec_helper'

describe Tite::Talk do
  describe 'urls' do
    let(:url) { 'www.github.com/zederson/%{lang}/teste=' }

    before do
      Tite::Configuration.load RecursiveOpenStruct.new(tite: { engine: url, lang: 'pt-BR' })
    end

    context '#url' do
      subject { Tite::Talk.new.url }
      it { is_expected.to eql 'www.github.com/zederson/pt-BR/teste=' }
    end

    context '#create_url' do
      subject { Tite::Talk.new.create_url text }
      let(:text) { 'ola' }

      it { is_expected.to eql 'www.github.com/zederson/pt-BR/teste=ola' }
    end
  end

  describe '#to' do
    subject { Tite::Talk.new }
    let(:url) { 'https://github.com/zederson/q=' }
    let(:text) { 'Ola Ederson de Lima' }

    context 'create file with mp3' do
      let(:request) { OpenStruct.new(body: 'Ederson') }

      before do
        allow(subject).to receive(:url).and_return(url)
        expect(Tite::Client).to receive(:get).with(subject.create_url(text)).and_return(request)
        expect(Tite::Util).to receive(:save_file).with('Ederson').and_return('file')
      end

      it do
        expect(subject.to(text)).to eql 'file'
      end
    end
  end
end

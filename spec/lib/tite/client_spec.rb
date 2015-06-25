require 'spec_helper'

describe Tite::Client do

  let(:client) do
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(url) { |env| [200, {}, 'ederson'] }
    end

    f = Faraday.new do |builder|
      builder.adapter :test, stubs do |stub|
      end
    end
    f
  end

  context '.escape' do
    let(:url) { 'http://translate.google.com/translate_tts?tl=pt-BR&q=Ola ederson' }
    subject { Tite::Client.escape url }

    it { is_expected.to eql 'http://translate.google.com/translate_tts?tl=pt-BR&q=Ola%20ederson' }
  end

  context '.get' do
    let(:get_url) { 'http://translate.google.com/translate_tts?tl=pt-BR&q=Ola ederson' }
    let(:url) { 'http://translate.google.com/translate_tts?tl=pt-BR&q=Ola%20ederson' }

    subject { Tite::Client.get(get_url).body }

    before { allow(Faraday).to receive(:new).and_return(client) }

    it { is_expected.to eql 'ederson' }
  end
end

require 'spec_helper'

describe Tite::Configuration do
  subject { Tite::Configuration }

  describe '.load' do
    subject { Tite::Configuration.config.lang }

    it { expect(subject).to eql 'pt-BR' }
  end

  describe '.load_file' do
    before { Tite::Configuration.load_file 'spec/tite.yml' }
    subject { Tite::Configuration.config.lang }

    it { expect(subject).to eql 'pt-BR' }
  end

  describe '.configure' do
    it { expect(Tite::Configuration).to respond_to(:configure) }
  end
end

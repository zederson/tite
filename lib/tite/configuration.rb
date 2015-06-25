module Tite
  class Configuration
    class << self
      attr_accessor :config

      def config
        @config || default
      end
    end

    def self.load(configuration)
      self.config = configuration.tite
    end

    def self.load_file(file)
      self.config = RecursiveOpenStruct.new(YAML.load_file(file)).tite
    end

    def self.default
      url = 'http://translate.google.com/translate_tts?tl=%{lang}&q='
      path = '/tmp'
      configs = { tite: { lang: 'pt-BR', engine: url, temp: path } }
      load RecursiveOpenStruct.new(configs)
    end

    def self.logger
      @@logger ||= begin
        if defined?(Rails) && Rails.logger
          Rails.logger
        else
          Logger.new('/dev/null')
        end
      end
    end

    def self.logger=(logger)
      @@logger = logger
    end

    def self.configure(&block)
      block.call(self)
    end
  end
end

module Tite
  class Talk

    def to(text)
      content = Tite::Client.get(create_url(text)).body
      Tite::Util.save_file content
    end

    def url
      config.engine % { lang: config.lang }
    end

    def create_url(text)
      "#{url}#{text}"
    end

    private

    def config
      Tite::Configuration.config
    end
  end
end

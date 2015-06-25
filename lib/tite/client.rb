module Tite
  class Client

    def self.get(url)
      conn.get escape(url)
    end

    def self.escape(url)
      URI.escape url
    end

    private

    def self.conn
      Faraday.new do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end

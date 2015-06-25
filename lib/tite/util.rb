module Tite
  class Util

    def self.save_file(content)
      file = create_file_name
      write_file file, content
      file
    end

    def self.write_file(path, content)
      File.open(path, 'wb') { |fo| fo.write content }
    end

    def self.prepare_path
      path = "#{config.temp}/tite"
      FileUtils.mkdir_p path unless File.exists? path
      path
    end

    def self.create_file_name
      path = prepare_path
      file_name = "tite_#{Time.now.to_i}_.mp3"
      "#{path}/#{file_name}"
    end

    def self.config
      Tite::Configuration.config
    end
  end
end

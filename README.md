# Tite

Using google translate to create mp3 file with text

## Installation

Add this line to your application's Gemfile:

    gem 'tite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tite

## Usage
```
  path_file = Tite::Talk.new.to 'Ola ederson'
  => "/tmp/tite/tite_1435200186_.mp3"
```

## Configure
Add in your initializer
```
  Tite::Configuration.configure do |conf|
    conf.config.temp = '/Users/user/Downloads'
    conf.config.lang = 'en'
  end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

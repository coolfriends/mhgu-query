# mhgu-query

Perform simple and advanced queries on MHGU data.

## Installation
Download this repo and install

    $ git clone https://github.com/coolfriends/mhgu-query.git
    $ bundle install

## Usage
WIP: Build the JSON db. Right now it just prints how many weapon sets it found :)

    $ bundle exec bin/create_db

Start the server

    $ bundle exec puma config.ru -p 3000

## Development
Setup [RVM](https://rvm.io/) and install a new Ruby version (>= 2.3).
I'm using ruby-2.6.0-preview2.

Download the repository

    $ git clone https://github.com/coolfriends/mhgu-query.git

Make a new feature branch

    $ git checkout -b my-cool-feature

Make your changes and test

    $ bundle exec rake

Make your changes and commit them

    $ git commit -am "Wow I really did it"

Push your changes to your feature branch

    $ git push origin my-cool-feature


Then make your pull request in GitHub.
[See this for more information](https://yangsu.github.io/pull-request-tutorial/)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

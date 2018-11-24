# mhgu-query

Perform simple and advanced queries on MHGU data.

## Installation
Download this repo and install

    $ git clone https://github.com/coolfriends/mhgu-query.git
    $ bundle install

## Usage
Start the server

    $ bundle exec puma config.ru -p 3000
    
### GET /api/v1/weapons
A route for obtaining data about MHGU weapons
#### Examples
Get all weapons

    http://localhost:3000/api/v1/weapons
    
Get all Great Swords

    http://localhost:3000/api/v1/weapons?wtype=Great Sword

Get all Great Swords and Hunting Horns with the Poison or Fire element

    http://localhost:3000/api/v1/weapons?wtype=Great Sword,Hunting Horn&element=Poison,Fire

### GET /api/v1/weapons/meta
A route for obtaining meta level data about MHGU weapons including query parameters and the fields for a Weapon.

#### Examples
Get the meta data

    http://localhost:3000/api/v1/weapons/meta

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
    
Run the tests

    $ rspec
    
Enter DB console session

    $ bundle exec bin/db_console
    [1] pry(main)> Weapon.count
    => 10877

Then make your pull request in GitHub.
[See this for more information](https://yangsu.github.io/pull-request-tutorial/)

## Acknowledgments
Thanks to JoeLago for the MHGU Database pulled from https://github.com/JoeLago/MHGUDB-iOS

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

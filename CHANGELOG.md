# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Fixed
- Ran migration and script on database to add item columns to weapons table
- Include missing attributes on the /api/v1/weapons endpoint
### Added
- User can provide the final parameter to the weapons endpoint to restrict results to final weapon versions only e.g. /api/v1/weapons?element=Fire&final=1
- Added badges for build status, maintainability, and test coverage
- Created a migration and a script to seed the data from items table into the weapons table
- Advanced URL querying e.g. /api/v1/weapons?element=Fire,Water&wtype=Hunting Horn,Great Sword
- Implementation of the /api/v1/weapons/meta endpoint with metadata about the weapon model.
- Basic URL querying for an element or weapon type on the /api/v1/weapons endpoint, 
e.g. /api/v1/weapons?wtype=Hunting Horn or /api/v1/weapons?element=Fire

[Unreleased]: https://github.com/coolfriends/mhgu-query/compare/HEAD


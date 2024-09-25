# Contributing to tailwindcss-ruby

This doc is a brief introduction on modifying and maintaining this gem.

## Updating to the latest upstream tailwindcss version

Update `lib/tailwindcss/ruby/upstream.rb` with the upstream version.

Run `bundle exec rake clobber` then `bundle exec rake download` to ensure the tailwindcss binaries can be downloaded, and that you have the correct versions on local disk.

## Cutting a release of tailwindcss-ruby

- bump the version
  - [ ] update `lib/tailwindcss/ruby/version.rb`
  - [ ] update `CHANGELOG.md`
  - [ ] commit and create a git tag
- build the native gems:
  - [ ] `bundle exec rake clobber` if needed to clean up possibly-old tailwindcss executables
  - [ ] `bundle exec rake package`
- push
  - [ ] `for g in pkg/*.gem ; do gem push $g ; done`
  - [ ] `git push && git push --tags`
- announce
  - [ ] create a release at https://github.com/flavorjones/tailwindcss-ruby/releases

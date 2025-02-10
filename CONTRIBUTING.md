# Contributing to tailwindcss-ruby

This doc is a brief introduction on modifying and maintaining this gem.

## Updating to the latest upstream tailwindcss version

Please don't submit PRs to the maintainer with an upstream bump.

- [ ] run `bin/bump-upstream`
- [ ] push the branch, create a PR

## Cutting a release of tailwindcss-ruby

- if it's just bumping the upstream:
  - [ ] follow the steps above
  - [ ] when the PR is green, merge the PR
  - [ ] create a git tag (after updating local `main`)
- else if the gem is being changed in some other way:
  - [ ] update `lib/tailwindcss/ruby/version.rb`
  - [ ] update `CHANGELOG.md`
  - [ ] `git commit`
  - [ ] `git tag`
- build the native gems:
  - [ ] `bundle exec rake clobber` (if needed to clean up old tailwindcss executables)
  - [ ] `bundle exec rake package`
- push source and gems:
  - [ ] `for g in pkg/*.gem ; do gem push $g ; done`
  - [ ] `git push && git push --tags`
- announce
  - [ ] create a release at https://github.com/flavorjones/tailwindcss-ruby/releases

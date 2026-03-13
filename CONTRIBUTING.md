# Contributing to tailwindcss-ruby

This doc is a brief introduction on modifying and maintaining this gem.

## Updating to the latest upstream tailwindcss version

We have a Github Actions workflow that runs once a day to check for new upstream versions, and will
create a new pull request with the bump. You only need to review and merged it!

If you really need to do it manually, you can use the `bin/bump-upstream` script, however, we may
not be keeping that up to date, and you should double-check everything.

## Cutting a release of tailwindcss-ruby

- Prep work
  - [ ] update `lib/tailwindcss/ruby/version.rb` if necessary
  - [ ] update `CHANGELOG.md` if necessary
  - [ ] `git commit`
  - [ ] `git tag`
  - [ ] `git push && git push --tags`
- Automated release with Github Actions workflow 
  - [ ] go to https://github.com/flavorjones/tailwindcss-ruby/actions/workflows/release.yml
  - [ ] run the workflow, passing in the git tag as input
- Manual release
  - [ ] `bundle exec rake clobber` (if needed to clean up old tailwindcss executables)
  - [ ] `bundle exec rake package`
  - [ ] `for g in pkg/*.gem ; do gem push $g ; done`
- Announce
  - [ ] create a release at https://github.com/flavorjones/tailwindcss-ruby/releases (this should be automated, too)

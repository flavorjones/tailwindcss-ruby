# Tailwindcss::Ruby

A self-contained `tailwindcss` executable, wrapped up in a ruby gem. That's it. Nothing else.

If you're looking to leverage tailwindcss in your Rails project, please see https://github.com/rails/tailwindcss-rails for integration that is supported by the Rails team.


## Installation

This gem wraps [the standalone executable version](https://tailwindcss.com/blog/standalone-cli) of the Tailwind CSS v3 framework. These executables are platform specific, so there are actually separate underlying gems per platform, but the correct gem will automatically be picked for your platform.

Supported platforms are:

- arm64-darwin (macos-arm64)
- x64-mingw32 (windows-x64)
- x64-mingw-ucr (windows-x64)
- x86_64-darwin (macos-x64)
- x86_64-linux (linux-x64)
- aarch64-linux (linux-arm64)
- arm-linux (linux-armv7)

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add tailwindcss-ruby
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install tailwindcss-ruby
```

### Using a local installation of `tailwindcss`

<!-- note that this section's title is deeplinked from an error message, do not change -->

If you are not able to use the vendored standalone executables (for example, if you're on an unsupported platform), you can use a [local installation](https://tailwindcss.com/docs/installation) of the `tailwindcss` executable by setting an environment variable named `TAILWINDCSS_INSTALL_DIR` to the directory path containing the executable.

For example, if you've installed `tailwindcss` so that the executable is found at `/path/to/node_modules/bin/tailwindcss`, then you should set your environment variable like so:

``` sh
TAILWINDCSS_INSTALL_DIR=/path/to/node_modules/bin
```

or, for relative paths like `./node_modules/.bin/tailwindcss`:

``` sh
TAILWINDCSS_INSTALL_DIR=node_modules/.bin
```


## Versioning

This gem will always have the same version number as the underlying TailwindCSS release. For example, the gem with version v3.4.13 will package upstream TailwindCSS v3.4.13.

If there ever needs to be multiple releases for the same version of TailwindCSS, the version will contain an additional digit. For example, if we re-released TailwindCSS v3.4.13, it might be shipped in gem version v3.4.13.1 or v3.4.13.2.


## Usage

### Ruby

The gem makes available `Tailwindcss::Ruby.executable` which is the path to the vendored standalone executable.

``` ruby
require "tailwindcss/ruby"
Tailwindcss::Ruby.executable
# => "/path/to/installs/ruby/3.3.5/lib/ruby/gems/3.3.0/gems/tailwindcss-ruby-0.1.0-x86_64-linux/exe/x86_64-linux/tailwindcss"
```


### Command line

This gem provides an executable `tailwindcss` shim that will run the vendored standalone executable.

``` bash
# where is the shim?
$ bundle exec which tailwindcss
/path/to/installs/ruby/3.3/bin/tailwindcss

# run the actual executable through the shim
$ bundle exec tailwindcss --help
["/path/to/installs/ruby/3.3.5/lib/ruby/gems/3.3.0/gems/tailwindcss-ruby-0.1.0-x86_64-linux/exe/x86_64-linux/tailwindcss", "--help"]

tailwindcss v3.4.3

Usage:
   tailwindcss [--input input.css] [--output output.css] [--watch] [options...]
   tailwindcss init [--full] [--postcss] [options...]

Commands:
   init [options]

Options:
   -i, --input              Input file
   -o, --output             Output file
   -w, --watch              Watch for changes and rebuild as needed
   -p, --poll               Use polling instead of filesystem events when watching
       --content            Content paths to use for removing unused classes
       --postcss            Load custom PostCSS configuration
   -m, --minify             Minify the output
   -c, --config             Path to a custom config file
       --no-autoprefixer    Disable autoprefixer
   -h, --help               Display usage information
```


## Troubleshooting

### `ERROR: Cannot find the tailwindcss executable` for supported platform

Some users are reporting this error even when running on one of the supported native platforms:

- arm64-darwin
- x64-mingw32
- x64-mingw-ucrt
- x86_64-darwin
- x86_64-linux
- aarch64-linux

#### Check Bundler PLATFORMS

A possible cause of this is that Bundler has not been told to include native gems for your current platform. Please check your `Gemfile.lock` file to see whether your native platform is included in the `PLATFORMS` section. If necessary, run:

``` sh
bundle lock --add-platform <platform-name>
```

and re-bundle.


#### Check BUNDLE_FORCE_RUBY_PLATFORM

Another common cause of this is that bundler is configured to always use the "ruby" platform via the
`BUNDLE_FORCE_RUBY_PLATFORM` config parameter being set to `true`. Please remove this configuration:

``` sh
bundle config unset force_ruby_platform
# or
bundle config set --local force_ruby_platform false
```

and re-bundle.

See https://bundler.io/man/bundle-config.1.html for more information.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/flavorjones/tailwindcss-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/flavorjones/tailwindcss-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Tailwind CSS is [released under the MIT License](https://github.com/tailwindlabs/tailwindcss/blob/next/LICENSE).

## Code of Conduct

Everyone interacting in the Tailwindcss::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/flavorjones/tailwindcss-ruby/blob/main/CODE_OF_CONDUCT.md).

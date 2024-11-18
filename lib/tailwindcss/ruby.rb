# frozen_string_literal: true

require_relative "ruby/version"
require_relative "ruby/upstream"

module Tailwindcss
  module Ruby
    DEFAULT_DIR = File.expand_path(File.join(__dir__, "..", "..", "exe"))
    GEM_NAME = "tailwindcss-ruby"

    # raised when the host platform is not supported by upstream tailwindcss's binary releases
    class UnsupportedPlatformException < StandardError
    end

    # raised when the tailwindcss executable could not be found where we expected it to be
    class ExecutableNotFoundException < StandardError
    end

    # raised when TAILWINDCSS_INSTALL_DIR does not exist
    class DirectoryNotFoundException < StandardError
    end

    class << self
      def platform
        [:cpu, :os].map { |m| Gem::Platform.local.send(m) }.join("-")
      end

      def executable(exe_path: DEFAULT_DIR)
        tailwindcss_install_dir = ENV["TAILWINDCSS_INSTALL_DIR"]
        if tailwindcss_install_dir
          if File.directory?(tailwindcss_install_dir)
            warn "NOTE: using TAILWINDCSS_INSTALL_DIR to find tailwindcss executable: #{tailwindcss_install_dir}"
            exe_path = tailwindcss_install_dir
            exe_file = File.expand_path(File.join(tailwindcss_install_dir, "tailwindcss"))
          else
            raise DirectoryNotFoundException, <<~MESSAGE
              TAILWINDCSS_INSTALL_DIR is set to #{tailwindcss_install_dir}, but that directory does not exist.
            MESSAGE
          end
        else
          if Tailwindcss::Ruby::Upstream::NATIVE_PLATFORMS.keys.none? { |p| Gem::Platform.match_gem?(Gem::Platform.new(p), GEM_NAME) }
            raise UnsupportedPlatformException, <<~MESSAGE
              #{GEM_NAME} does not support the #{platform} platform
              See https://github.com/flavorjones/tailwindcss-ruby#using-a-local-installation-of-tailwindcss
              for more details.
            MESSAGE
          end

          exe_file = Dir.glob(File.expand_path(File.join(exe_path, "*", "tailwindcss"))).find do |f|
            Gem::Platform.match_gem?(Gem::Platform.new(File.basename(File.dirname(f))), GEM_NAME)
          end
        end

        if exe_file.nil? || !File.exist?(exe_file)
          raise ExecutableNotFoundException, <<~MESSAGE
            Cannot find the tailwindcss executable for #{platform} in #{exe_path}

            If you're using bundler, please make sure you're on the latest bundler version:

                gem install bundler
                bundle update --bundler

            Then make sure your lock file includes this platform by running:

                bundle lock --add-platform #{platform}
                bundle install

            See `bundle lock --help` output for details.

            If you're still seeing this message after taking those steps, try running
            `bundle config` and ensure `force_ruby_platform` isn't set to `true`. See
            https://github.com/flavorjones/tailwindcss-ruby#check-bundle_force_ruby_platform
            for more details.
          MESSAGE
        end

        exe_file
      end
    end
  end
end

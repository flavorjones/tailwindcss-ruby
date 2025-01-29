module Tailwindcss
  module Ruby
    module Upstream
      VERSION = "v4.0.1"

      # rubygems platform name => upstream release filename
      NATIVE_PLATFORMS = {
        "arm64-darwin" => "tailwindcss-macos-arm64",
        "x64-mingw32" => "tailwindcss-windows-x64.exe",
        "x64-mingw-ucrt" => "tailwindcss-windows-x64.exe",
        "x86_64-darwin" => "tailwindcss-macos-x64",
        "x86_64-linux-gnu" => "tailwindcss-linux-x64",
        "x86_64-linux-musl" => "tailwindcss-linux-x64-musl",
        "aarch64-linux-gnu" => "tailwindcss-linux-arm64",
        "aarch64-linux-musl" => "tailwindcss-linux-arm64-musl",
      }
    end
  end
end

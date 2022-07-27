# bench mark between d8 and jsc
bench-d8-jsc:
  hyperfine --shell=none --warmup=100 "/usr/local/Cellar/v8/10.2.154.4/bin/d8 /Users/linux_china/WebstormProjects/js-engine-benchmark/demo.js" "/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Helpers/jsc /Users/linux_china/WebstormProjects/js-engine-benchmark/demo-jsc.js"

# benchmark between bun, deno and node
bench-bun-deno-node:
  hyperfine --shell=none --warmup=100 "/Users/linux_china/.bun/bin/bun /Users/linux_china/WebstormProjects/js-engine-benchmark/demo.js" "/Users/linux_china/bin/deno run /Users/linux_china/WebstormProjects/js-engine-benchmark/demo.js" "/usr/local/Cellar/node@16/16.16.0/bin/node /Users/linux_china/WebstormProjects/js-engine-benchmark/demo.js"

# benchmark between zig, cpp and rust
bench-zig-cpp-rust:
  hyperfine --shell=none --warmup=100 "/Users/linux_china/WebstormProjects/js-engine-benchmark/main-zig" "/Users/linux_china/WebstormProjects/js-engine-benchmark/main-cpp" "/Users/linux_china/WebstormProjects/js-engine-benchmark/main-rs"

# build Zig, Cpp and Rust apps
build:
   zig build-exe -O ReleaseFast --name main-zig main.zig
   clang++ -o main-cpp -O3 main.cpp
   rustc -O -o main-rs main.rs

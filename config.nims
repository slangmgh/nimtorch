when defined wasm:
  echo "Injecting wasm options"

  --cc:clang
  --os:linux
  --cpu:i386
  --define:emscripten
  --clang.exe:"/usr/lib/emscripten/emcc"
  --clang.cpp.exe:"/usr/lib/emscripten/emcc"
  --clang.linkerexe:"/usr/lib/emscripten/emcc"
  --clang.cpp.linkerexe:"/usr/lib/emscripten/emcc"

  when defined release:
    --clang.options.always:"-std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.options.linker:"-s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.cpp.options.always:"-std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.cpp.options.linker:"-s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -O3 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
  else:
    --clang.options.always:"-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.options.linker:"-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.cpp.options.always:"-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -std=c++14 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"
    --clang.cpp.options.linker:"-g2 -O1 -s DEMANGLE_SUPPORT=1 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -s BINARYEN_MEM_MAX=2147418112 -s EXTRA_EXPORTED_RUNTIME_METHODS=\"['intArrayFromString', 'ALLOC_NORMAL', 'allocate']\" -s SINGLE_FILE=1 -s WASM=1 -s BINARYEN_ASYNC_COMPILATION=0 -s DISABLE_EXCEPTION_CATCHING=0"

task torch, "Custom ntorch build":
  setCommand "cpp"
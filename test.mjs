import { createRequire } from "node:module";
const require = createRequire(import.meta.url);
const native = require("./zig-out/lib/build/macos-aarch64-none/example.node");
// const native = require("./zig-out/lib/build/macos-x86_64-none/example.node");

console.log("1 + 2 =", native.add(1, 2));

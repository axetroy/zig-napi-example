const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addSharedLibrary(.{
        .name = "example",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .strip = true,
    });

    // Link the C library
    // lib.linkLibC();
    // lib.linkLibCpp();

    // Use weak-linkage
    lib.linker_allow_shlib_undefined = true;

    // Add napigen
    const napigen = b.dependency("napigen", .{});
    lib.root_module.addImport("napigen", napigen.module("napigen"));

    // Build the lib
    b.installArtifact(lib);

    // Determine output directory based on target OS, architecture, and ABI
    const target_dir = std.fmt.allocPrint(
        b.allocator,
        "build/{s}-{s}-{s}",
        .{
            @tagName(target.result.os.tag),
            @tagName(target.result.cpu.arch),
            @tagName(target.result.abi),
        },
    ) catch unreachable;

    // Copy the result to a *.node file in the target-specific directory
    const output_path = std.fs.path.join(b.allocator, &.{ target_dir, "example.node" }) catch unreachable;
    const copy_node_step = b.addInstallLibFile(lib.getEmittedBin(), output_path);
    b.getInstallStep().dependOn(&copy_node_step.step);
}

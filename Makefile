.DEFAULT:
build:
	@zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-windows-gnu
	@zig build -Doptimize=ReleaseSafe -Dtarget=aarch64-windows-gnu
	@zig build -Doptimize=ReleaseSafe -Dtarget=aarch64-macos-none
	@zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-macos-none
	@zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-linux-musl
	@zig build -Doptimize=ReleaseSafe -Dtarget=aarch64-linux-musl
	@zig build -Doptimize=ReleaseSafe -Dtarget=mips64el-linux-muslabi64
	@zig build -Doptimize=ReleaseSafe -Dtarget=loongarch64-linux-musl
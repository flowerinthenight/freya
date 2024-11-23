const std = @import("std");
const log = std.log;
const print = std.debug.print;
const Server = std.net.StreamServer;
const c = @cImport({
    @cInclude("bindings.h");
});

// To test: cat testdata/simple.arrow | ./zig-out/bin/freya
fn ffi() void {
    print("{d}\n", .{c.ffi()});
}

pub fn sock() !void {
    const socket = "/tmp/freya-freyr-notify.sock";
    std.fs.deleteFileAbsolute(socket) catch {};
    const addr = try std.net.Address.initUnix(socket);
    var server = try addr.listen(.{});
    defer server.deinit();

    log.info("listening on {s}", .{socket});

    var buff: [500]u8 = undefined;
    while (true) {
        const conn = try server.accept();
        const n = try conn.stream.read(&buff);
        log.info("read: n={d}, {s}", .{ n, buff });
    }
}

pub fn main() !void {
    if (false) ffi();
    if (true) try sock();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

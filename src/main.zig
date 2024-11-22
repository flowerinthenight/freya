const std = @import("std");
const log = std.log;
const print = std.debug.print;
const Server = std.net.StreamServer;
const c = @cImport({
    @cInclude("bindings.h");
});

fn ffi() void {
    print("{d}\n", .{c.ffi()});
}

pub fn sock() !void {
    const path = "/tmp/hedged-notify.sock";
    const addr = try std.net.Address.initUnix(path);
    var server = try addr.listen(.{});
    defer server.deinit();

    var buff: [500]u8 = undefined;
    while (true) {
        log.info("waiting for connections...", .{});
        const conn = try server.accept();
        const bytes = try conn.stream.read(&buff);
        log.info("read: {any}, {s}", .{ bytes, buff });
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

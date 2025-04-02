const std = @import("std");
const napigen = @import("napigen");
// const sqlite = @import("sqlite");

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

// export fn initSQLite() !void {
//     var db = try sqlite.Db.init(.{
//         .mode = sqlite.Db.Mode{ .File = "/home/vincent/mydata.db" },
//         .open_flags = .{
//             .write = true,
//             .create = true,
//         },
//         .threading_mode = .MultiThread,
//     });

//     try db.exec("CREATE TABLE IF NOT EXISTS employees(id integer primary key, name text, age integer, salary integer)", .{}, .{});

//     const query =
//         \\SELECT id, name, age, salary FROM employees WHERE age > ? AND age < ?
//     ;

//     var stmt = try db.prepare(query);
//     defer stmt.finalize();
// }

comptime {
    napigen.defineModule(initModule);
}

fn initModule(js: *napigen.JsContext, exports: napigen.napi_value) anyerror!napigen.napi_value {
    try js.setNamedProperty(exports, "add", try js.createFunction(add));
    // try js.setNamedProperty(exports, "initSQLite", try js.createFunction(initSQLite));

    return exports;
}

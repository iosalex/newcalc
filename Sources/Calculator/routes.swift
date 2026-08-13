
import Vapor

// Что отправляет форма
struct AddForm: Content {
    var a: String
    var b: String
}

// Что передаётся в шаблон
struct CalcContext: Content {
    var a: String
    var b: String
    var result: String
}

func routes(_ app: Application) throws {

    app.get { req async throws -> View in
        try await req.view.render(
            "index",
            CalcContext(a: "", b: "", result: "")
        )
    }

    app.post("add") { req async throws -> View in
        let form = try req.content.decode(AddForm.self)

        let x = Int(form.a) ?? 0
        let y = Int(form.b) ?? 0
        let sum = x + y

        return try await req.view.render(
            "index",
            CalcContext(
                a: form.a,
                b: form.b,
                result: String(sum)
            )
        )
    }

    app.post("clear") { req async throws -> View in
        try await req.view.render(
            "index",
            CalcContext(a: "", b: "", result: "")
        )
    }
}

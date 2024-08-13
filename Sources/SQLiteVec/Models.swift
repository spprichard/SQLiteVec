import CSQLiteVec
import Foundation

struct SQLiteVecError: Error {
    let code: Int32

    init(code: Int32) {
        self.code = code
    }
}

extension SQLiteVecError {
    static let successCodes: Set = [SQLITE_OK, SQLITE_ROW, SQLITE_DONE]

    static func check(_ code: Int32) throws {
        if successCodes.contains(code) {
            return
        }
        throw SQLiteVecError(code: code)
    }
}

extension Data {
    var bytes: [UInt8] {
        [UInt8](self)
    }
}

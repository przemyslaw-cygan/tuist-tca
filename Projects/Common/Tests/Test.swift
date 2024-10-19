import Testing

@testable import Common

@Suite("Common Tests")
struct CommonTests {
    @Test func testHelloWorld() throws {
        #expect(Common.helloWorld() == "Hello World!")
    }
}

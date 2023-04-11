//
//  ResolverExtTests.swift
//  ResolverExtTests
//
//  Created by macmini on 2023/4/11.
//

import XCTest
@testable import ResolverExt
@testable import Resolver

final class ResolverExtTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExample() throws {
        let demo = DemoModule()
        demo.install()
        
        let foo:Foo = Resolver.resolve(Foo.self, name: nil, args: nil)
       assert(1 == foo.foo())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

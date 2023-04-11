//
//  DemoModule.swift
//  ResolverExtTests
//
//  Created by macmini on 2023/4/11.
//

import Foundation
@testable import ResolverExt
@testable import Resolver

protocol Foo {
    func foo() -> Int
}

struct FooImpl :Foo {
    func foo() -> Int {
        1
    }
}

public class DemoModule: BaseModule {
    
    @Provides<Foo>(provider: { FooImpl() })
    private var provideFoo:Installer<Foo>
    
    public override func installer() -> Installers {
        return Installers { r in
            self.provideFoo.install(container: r)
        }
    }
    
}

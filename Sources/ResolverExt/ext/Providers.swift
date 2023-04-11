//
//  Providers.swift
//  ResolverExt
//
//  Created by leobert on 2023/4/11.
//

import Foundation
import Resolver


public class Installer<T> {
    private let scope: ResolverScope
    
    private let provider: ResolverFactory<T>
    
    private let name: Resolver.Name?
    
    public init(name: Resolver.Name? = nil, scope: ResolverScope = Resolver.defaultScope, provider: @escaping ResolverFactory<T>) {
        self.name = name
        self.scope = scope
        self.provider = provider
    }
    
    public func install(container:Resolver) {
        container.register(name: name, factory: provider)
            .scope(scope)
    }
}

public class Installers {
    
    let all: (Resolver)->Void
    
    init(all: @escaping (Resolver) -> Void) {
        self.all = all
    }
    
    public func install(container:Resolver) {
        all(container)
    }
}

@propertyWrapper public struct Provides<T> {
    private var installer: Installer<T>
    
    public init(name: Resolver.Name? = nil, scope: ResolverScope = Resolver.defaultScope, provider: @escaping ResolverFactory<T>) {
        self.installer = Installer(name:name,scope: scope, provider: provider)
    }
    
    public var wrappedValue: Installer<T> {
        get { return installer }
        mutating set {
            installer = newValue
        }
    }
    
    public var projectedValue: Provides<T> {
        get { return self }
        mutating set { self = newValue }
    }
}

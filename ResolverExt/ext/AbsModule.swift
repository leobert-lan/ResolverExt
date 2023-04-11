//
//  AbsModule.swift
//  ResolverExt
//
//  Created by macmini on 2023/4/11.
//

import Foundation
import Resolver

public protocol IModule {
    func installIn() -> Resolver
    
    func installer() -> Installers
    
    func install()
}

public class BaseModule {
    
    public func installIn() -> Resolver {
        Resolver.main
    }
    
    public func installer() -> Installers {
        return Installers { Resolver in
            
        }
    }
    
    public func install() {
        installer().install(container: installIn())
    }
    
}

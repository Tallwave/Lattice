//: Playground - noun: a place where people can play

import UIKit

class Foo {
    func sayHi() {
        print("say: \(text())")
    }
    
    private func text() -> String {
        return "hi"
    }
}

class Bar : Foo {
    override func text() -> String {
        return "\(super.text()) bye"
    }
}

let f = Bar()
f.sayHi()

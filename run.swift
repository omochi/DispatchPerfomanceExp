#!/usr/bin/swift sh
import Scripting // @omochi

func main() throws {
    let command = "swiftc"
    let args = [
        "-emit-sil",
//        "-Xllvm", "-sil-print-all",
        "-Xllvm", "-sil-print-around=closure-specialize",
        "-O",
        "test.swift"
    ]
    try system(command: command,
               args: args)
}

try! main()

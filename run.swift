#!/usr/bin/swift sh
import Scripting // @omochi

func main() throws {
    let command = "swift"
    let args = [
//        "-emit-ir",
//        "-Xllvm", "-sil-print-all",
//        "-Xllvm", "-sil-print-around=closure-specialize",
//        "-Xfrontend", "-disable-llvm-optzns",
        "-O",
        "test.swift"
    ]
    try system(command: command,
               args: args)
}

try! main()

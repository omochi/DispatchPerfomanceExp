import Foundation

protocol CounterProtocol {
    var value: Int { get }
    func inc()
}

protocol CounterClassProtocol : AnyObject {
    var value: Int { get }
    func inc()
}

class Counter : CounterProtocol, CounterClassProtocol {
    var value: Int = 0
    func inc() {
        value += 1
    }
}

class ProviderE {
    let _counter = Counter()
    var counter: CounterProtocol {
        return _counter
    }
}

class ProviderCE {
    let _counter = Counter()
    var counter: CounterClassProtocol {
        return _counter
    }
}

@inline(never)
func measure(_ f: () -> Void) {
    let t0 = Date()
    f()
    let t1 = Date()
    let dt = t1.timeIntervalSince(t0)
    print(dt)
}

let N = 500_000_000 * 10

@inline(never)
func testE() {
    let provider = ProviderE()
    measure {
        for _ in 0..<N {
            provider.counter.inc()
        }
    }
    print(provider.counter.value)
}

@inline(never)
func testCE() {
    let provider = ProviderCE()
    measure {
        for _ in 0..<N {
            provider.counter.inc()
        }
    }
    print(provider.counter.value)
}

func main() {
    testE()
    testCE()
    testE()
    testCE()
    testE()
    testCE()
    testE()
    testCE()
}

main()

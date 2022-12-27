# Type Erasure in Swift
Or rather Swift protocol generics


## Protocols and Generics
- https://medium.com/swift2go/mastering-generics-with-protocols-the-specification-pattern-5e2e303af4ca
- We could not use protocols with associated value as types before and ran quite often into errors while working with them
	- ❌ Protocol can only be used as a generic constraint because it has Self or associatedType requirements
	- ❌ Cannot specialize protocol type
- We are not able to specify a dependency as a protocol with associated value
- Protocols with associated value cannot be used as parameters for functions (without generic constraints)
- Protocols with associated value cannot be used as properties of types (without generic constraints)
- Directly using types implementing protocols as dependencies

## How to Type Erasure
- https://www.donnywals.com/understanding-type-erasure-in-swift/
- Good examples are AnyCancellable, AnyPublisher or AnyCollection
- Helps us hide implementation details, we return erasure type instead of the specific type
- It might be tempting to use protocol instead but we cannot use constraints on the returned type
- We can try using `some` but we inherently lose information about the associated types
- We cannot store property of given protocol with associated values, we can only constrain it in initializer. So we do not store it, we only store function references into closures and call them where appropriate.

## Opaque Types (some)
- https://swiftsenpai.com/swift/understanding-some-and-any/
- https://www.donnywals.com/whats-the-difference-between-any-and-some-in-swift-5-7/
- Opaque types are unexpectadly not accessible from the outside, they only expose the protocol's properties & functions
- We can create an opaque type using keyword `some` for example `some APIEndpoint`, we lose the information about the associated type
- Opaque types is resolved by the compiler and cannot be changed, that means the same type must be returned from a fuction in all scenarios
- This does not allow us to store different types conforming to same protocol within collections
- Opaque type cannot be used as return value of protocol's function either, because it cannot be resolved during compilation

## Existential Types (any)
- https://www.avanderlee.com/swift/existential-any/
- https://www.donnywals.com/what-is-the-any-keyword-in-swift/
- The `any` keyword simply annotates that a given type is a so-called existential
- In short, an existential means “any type, but conforming to protocol X.”
- Compiler has no information on the type of the object or the object itself, the only thing it knows it conforms to protocol
- The existential is wrapped within a box that compiler will open up in runtime peek inside and find the object
- Importantly the existentials are pretty expensive because there is no prior information on how big the object will be. Therefore dynamic dispatch has to be used instead of faster static dispatch
- We've been using existentials for a long time without knowing and from Swift 6 the compiler will force us to use `any` in those cases
- This might mean the Swift team wants us to use concrete types rather than existentials where possible
- We can also utilize `some` to keep the static dispacth while maintaining flexibility
- From available information `any` should be avoided where possible and reached for as a last resort

> Despite these significant and often undesirable implications, existential types have a minimal spelling. Syntactically, the cost of using one is hidden, and the similar spelling to generic constraints has caused many programmers to confuse existential types with generics. In reality, the need for the dynamism they provided is relatively rare compared to the need for generics, but the language makes existential types too easy to reach for, especially by mistake. The cost of using existential types should not be hidden, and programmers should explicitly opt into these semantics.
>
> https://github.com/apple/swift-evolution/blob/main/proposals/0335-existential-any.md

## Primary associated types
- https://www.donnywals.com/what-are-primary-associated-types-in-swift-5-7/
- Exposes one associated type for specialization
- Allows us to choose Element of Collection for example to be able to access its Elements as correct objects
- Still needs the use of `some` or `any` when used as parameter or property
- Reduces the necessity to use generics just for access to underlying associated type (for example on Collection)


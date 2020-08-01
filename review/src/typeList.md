## Type List Recommendation Outline
  - Explain that a type list is an implementation of a [Constraint](##constraint).

  - Present reasoning for Type List replacement
  
### Constraint
  - Explain what a constraint is:

    - A [Constraint](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#defining-constraints) is a [meta-type](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#using-a-constraint) assigned to a [Type Parameter](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#type-parameters).  It defines a, potentially composite, [interface](#interface) consisting of one or more go [Interface Types](https://golang.org/ref/spec#Interface_types) and/or [Operators](https://golang.org/ref/spec#Operators).

- Explain how it's used:

  - A Constraint ensures that [Type Arguments](#type-arguments) offer at least all the behaviors defined by its interface.

#### Constraint Implementation
Describes various categories of Constraint implementations offered by go.

- [Type List Category](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#type-lists-in-constraints)
    - Explain meaning.
        -  Defines a Constraint by aggregating 
        -  Defines an interface produced from the set intersection of each element (type).   the common (interfaces) for each type in the list.  This the elements of this interface are used to encode the body of the generic code.   
      - Explain motivation for feature.
    - [Type List in Interface Category](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#type-lists-in-interface-types)
      - Explain what does this mean.
        - Mixes the go Interface Type with the new Type List language element resulting in a new category of go Interface Type that can only (currently) be used when defining the meta-type of a Type Parameter. 
        - When Type List included in Interface, it becomes a Constraint Interface.
      - Explain motivation for feature.
    - Interface Category - The standard go [Interface Type](https://golang.org/ref/spec#Interface_types)

  - Removal Reasoning Summary level
    - Improve language Simplicity.
    - Software Principles.
    - Language Issues
    
### Improve language Simplicity.
-  Type List Constraints
    - An equivalent interface definition can replace type list. 
    - [Rebuttal](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#why-not-use-methods-instead-of-type-lists)
-  Type List Interface
    
    Specifying 
    
    Type list as constraint represents intersection of all common operators (interfaces) for each type in list.  Therefore, a change to a single type can break the interface.

### Language Issues
- Can't currently extend a go Interface.
- If an element of a Type in a Type List evolves to eliminate an interface/operation that's currently used in the generic code, the next compilation will fail. *Does compiler generate helpful message to identify the problematic list element(s)?*


### Terms

#### interface
 -  A surface of interaction provided by an abstraction to other one(s).  A surfaces consists of invocation sites where each site elicits a specific behavior offered by the abstraction.  An invocation site should expose the minimum amount of coupling points (concepts) to initiate the invocation in order to hide the behavior's implementation from the site of interaction.
 
#### Type Argument
  -  An instance of a [Type Parameter](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md#type-parameters) specified when instantiating a generic function or type.

### References
[Go Generics Proposal July 2020
](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md)
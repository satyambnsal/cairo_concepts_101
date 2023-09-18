


Cairo is a language built around a linear type system that allows us to statically ensure that in every Cairo program, a value is used exactly once. This linear type system helps preventing runtime errors by ensuring that operations that could cause such errors, such as writing twice to a memory cell, are detected at compile time. This is achieved by implementing an ownership system and forbidding copying and dropping values by default. 



Cairo is at its core a non-deterministic Turing-complete programming language, very different from any other popular language in existence, which as a consequence means that dictionaries are implemented very differently as well.

- Dictionary squash happens automatically via the `Felt252Dict<T>` implementation of the `Destruct<T>` trait. This call occured just before the **balance** dictionary went out of scope.

## Dictionaries of Complex Types

One restriction of `Felt252Dict<T>` is the trait `Felt252DictValue<T>`. this trait defines the **zero_default** method which is the one that gets called when a value doesn't exist in the dictionary. this is implemented by all data types except for complex ones such as arrays and structs. This means that making a dictionary of complex types is not a straightforward task because you would need to write a couple of traits in order to make the data type a valid dictionary value type. To compensate for this, the language introduces the `Nullable` type.


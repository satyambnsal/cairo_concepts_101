Purpose of this project is to explore the building blocks of cairo programming language. 


# Useful Commands

Create a new project named `hello_world`
```
scarb new hello_world
```

Build
```
scarb build
```
Execute
```
scarb cairo-run
```
Run Tests
```
scarb cairo-test
```


# Concepts

## What is Cairo ?

Cairo is a programming language designed for a virtual CPU of the same name. 


# Debug help
If you get an error `Error: program requires gas counter, please provide `--available-gas` argument`, run program with
```
scarb build && scarb cairo-run --available-gas=1000000
```
Mostly, You will get this error if you are using loops.

# Open Questions & Task
- [ ] Explore cairo cpu architecture
- [ ] How to print results in decimal using `print()` method
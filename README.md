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
Single command to build and execute
```
scarb build && scarb cairo-run --available-gas=20
00000
```



# Concepts

## What is Cairo ?

Cairo is a programming language that is used for creating 2D graphics. It is an open-source language that is designed to be fast, efficient, and easy to use. Here are some key features of Cairo:

Vector graphics: Cairo is a vector graphics library, which means that it can create graphics that are scalable without losing quality.

Cross-platform: Cairo can be used on a variety of platforms, including Linux, Windows, and macOS.

Multiple output formats: Cairo can output graphics in a variety of formats, including PDF, SVG, and PNG.

Easy to use: Cairo has a simple API that makes it easy to create graphics.

High performance: Cairo is designed to be fast and efficient, making it ideal for creating graphics in real-time applications.

Extensible: Cairo can be extended with plugins and modules to add new functionality.


# Debug help
If you get an error `Error: program requires gas counter, please provide `--available-gas` argument`, run program with
```
scarb build && scarb cairo-run --available-gas=1000000
```
Mostly, You will get this error if you are using loops.

# Open Questions & Task
- [ ] Explore cairo cpu architecture
- [ ] How to print results in decimal using `print()` method

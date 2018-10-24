Extension of basic golag image

### What's more?

- Clang 6
- dep

### Why?
In this container you can use [memory sanitizer](https://github.com/google/sanitizers/wiki/MemorySanitizer), regardless of the platform

Example:
```
go run -v -msan main.go
```
```
go test -msan
```
# Tweaking Hue, Saturation and Lighness of a picture in browser
## 4 approaches to solve the same task

### 1. Simple Java
- Pros: simplest version
- Cons: blocking main thread

### 2. Web worker
- Pros: non-blocking
- Cons: Little bit slower, due to sending picture data back and forth

### 3. Web assembly
- Pros: much faster
- Cons: Still sending picture data back and forth

### 4. Web assemly, but with shared memory
- Pros: fastest version
- Cons: A little bit tricky to setup. I didn't understand why I can't declare new array if I use shared memory. I need to dive deeper.

### 5. Web assembly with shared memory in web worker
- Do it yourself =)

## Summary
Use WebAssembly (and AssemblyScript in particular) for heavy computations in browser.

###### Process vs thread
--------
# What's the difference between processes and threads?

* A process lives in its own walled garden within the computer of memory. They
  can only communicate through inter-process channels such as pipes or files.

* Threads operate within the same program and share heap memory, but each have
  their own callstack and have their own registers (generally run on different
  cores, but not always). If there's a GIL then may use the same core. May
  mutate shared resources.

**TODO: Read the section on databases and the section on threads and locks.**

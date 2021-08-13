---
sidebar_position: 2
---

# Functions

- Use *lowerCamelCase* for function with meaningful Names. Use consistent verbs for concept. Function will usually create, read, update or delete something.
  ```jsx
  // Do
  function getUsers(firstName, lastName) {
    return `${firstName} ${lastName}`;
  }

  // Avoid
  function name(firstName, lastName) {
    return `${firstName} ${lastName}`;
  }
  ```
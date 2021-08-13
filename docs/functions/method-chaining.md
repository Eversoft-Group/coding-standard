---
sidebar_position: 3
---

# Method Chaining

- One method per line should be used if you want to chain methods. <br/>
  You should also indent those methods so it's easier to tell they are part of the same chain
  ```jsx
  // do
  User
    .findOne({ name: ‘foo’ })
    .populate(‘bar’)
    .exec(function(err, user) {
      return true;
  });

  // avoid
  User.findOne({ name: 'foo' })
  .populate('bar')
  .exec(function(err, user) {
    return true;
  });

  // avoid
  User.findOne({ name: 'foo' }).populate('bar')
  .exec(function(err, user) {
    return true;
  });
  ```
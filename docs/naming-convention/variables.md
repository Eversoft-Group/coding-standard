---
sidebar_position: 1
---

# Variables

- Use *lowerCamelCase* when declaring variables as well as Meaningful Names
  ```jsx
  // Do
  const firstName = 'Freddie';

  // Avoid
  const first_name = 'Freddie';
  ```

- Use UPPERCASE for Constants
  Capitalized const values SNAKE UPPER CASE
  ```jsx
  // Do
  const SECONDS_IN_A_DAY = 86400;
  const PI = 3.14

  // Avoid
  const seconds_in_a_day = 86400;
  const pi = 3.14
  ```

- Object/Array creation <br/>
  use trailing commas and push short declaration on a single line. Only quote keys when your interpreter complains:
  ```jsx
  // Do
  var pets = ['Dog', 'Cat'];
  
  var dog = {
    breed: 'Husky',
    barks: true,
  };

  // Avoid
  var pets = [
    'Dog', 'Cat'
  ];
  var dog = {breed: 'Husky'
    , barks: true
    };
  ```
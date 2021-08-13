---
sidebar_position: 1
---

# Write Small Functions

- Keep your functions short or Avoid large functions. A good function fits on a slide that the people in the last row of a big room can comfortable read.

- Avoid Deep nesting
  ```jsx
  const myArray = [ [ [ 'value' ] ] ];

  // Do
  const retrieveValue = (element) => {
    if(Array.isArray(element)) {
      return retrieveValue(element[0]);
    }
    return element;
  }
  retrieveValue(myArray);
  
  // Avoid
  myArray.forEach((array1) => {
    array1.forEach((array2) => {
      array2.forEach((element) => {
        console.log(element);
      })
    })
  });
  ```

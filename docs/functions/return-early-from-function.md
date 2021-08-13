---
sidebar_position: 2
---

# Return Early From Function

- To avoid deep nesting of if-statements, always return a function's value as early as possible.
  ```jsx
  // Do
  function isPercentage(val) {
    if (val < 0) {
      return false;
    }  if (val > 100) {
      return false;
    }  return true;
  }
  
  // Avoid
  function isPercentage(val) {
    if (val >= 0) {
      if (val < 100) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
  ```

- Or for this particular example it may also be okay to shorten things even further.
  ```jsx
  function isPercentage(val) {
    var isInRange = (val >= 0 && val <= 100);
    return isInRange;
  }
  ```
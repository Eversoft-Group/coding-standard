---
sidebar_position: 2
---

# Coding Standard

- 2 spaces for indentation <br/>
  Use 2 spaces for indenting your code and swear an oath to never mix tabs and spaces — a special kind of hell awaits otherwise.

- Use semicolons `;`

- 80 characters per line. <br/>
  Limit your lines to 80 characters.

- Use single quotes unless writing JSON string. This helps to seperate your objects's stsrings from normal strings.
  ```jsx
  // Do
  const name = 'Tiger';

  // Avoid
  const name = "Tiger";
  ```

- Declare one variable per var statement
  ```jsx
  // Do
  const keys = ['foo', 'bar'];
  const values = [23, 24];
  const object = {};

  // Avoid
  const keys = ['foo', 'bar'];
  values = [23, 24];
  object = {};
  key;
  ```

- Prefer `const` over `let`. Ditch the var <br/>
  Using `const` means that once a variable is assigned, it cannot be reassigned. Preferring `const` will help you to not be tempted to use the same variable for different uses, and make your code clearer. If a variable needs to be reassigned, in a for loop, for example, use `let` to declare it. Another important aspect of `let` is that a variable declared using it is only available in the block scope in which it was defined. `var` is function scoped, not block-scoped, and shouldn't be used in `ES6` now that you have `const` and `let` at your disposal.

- opening braces go on the same line.<br/>
  The openting curly braces of a code should be on the same line as the opening statement. Also, notice the use of white space before and after the condition statement.
  ```jsx
  // Do
  if (true) {
    console.log('ha ha ha');
  } else if (false) {
    console.log('again ha ha ha');
  } else {
    console.log('finally ha ha ha');
  }

  // Avoid
  if (true)
  {
    console.log('ha ha ha');
  }
  else if (false)
  {
    console.log('again ha ha ha');
  }
  else
  {
    console.log('finally ha ha ha');
  }
  ```

- Use the triple `===` equality operator over the weaker abstract equality operator `==`. `==` will compare two variables after converting them to a common type. There is no type conversion in `===`, and both variables must be of the same type to be equal. <br/>
  Otherwise: Unequal variables might return true when compared with the == operator
  ```jsx title="code example"
  "" == "0"; // false
  0 == ""; // true
  0 == "0"; // true

  false == "false"; // false
  false == "0"; // true

  false == undefined; // false
  false == null; // false
  null == undefined; // true
  ```
  All statements above will return false if used with `===`
  ```jsx
  // Do
  var age = 0;
  if (age !== '') {
    console.log('winning');
  }

  // Avoid
  var age = 0;
  if (age == '') {
    console.log('losing');
  }
  ```

- Avoid one-letter variable names
  ```jsx
  // Do
  const query = "something";
  
  // Avoid
  const q = "something";
  ```

- Use descriptive conditions
  ```jsx
    // Do
  var isValidPassword = password.length >= 4 && /^(?=.*\d).{4,}$/.test(password);
  if (isValidPassword) {
    console.log('winning');
  }

  // Avoid
  var isValidPassword = password.length >= 4 && /^(?=.*\d).{4,}$/.test(password);
  if (isValidPassword) {
    console.log('winning');
  }
  ```
  
- Make booleans that well in if-then statements
  ```jsx
  // Do
  let fruits = {};
  if(fruits.isApple){
    // something
  } 

  // Avoid
  let fruits = {};
  if(fruits.apple){
    // something
  }
  ```

- Avoid code repetition
  ```jsx
  // Do
  const getUser = (user) => {
    const { name, userName, email, password } = user; 
  }

  // Avoid
  const getUser = (user) => {
    const name = user.name;
    const userName = user.userName;
    const email = user.email;
    const password = user.password;
  }
  ```

- Require modules first, not inside functions<br/>
  Require modules at the beginning of each file, before and outside of any functions. This simple best practice will not only help you easily and quickly tell the dependencies of a file right at the top but also avoids a couple of potential problems

  **Otherwise:** Requires are run synchronously by Node.js. If they are called from within a function, it may block other requests from being handled at a more critical time. Also, if a required module or any of its dependencies throw an error and crash the server, it is best to find out about it as soon as possible, which might not be the case if that module is required from within a function

- Require modules by folders, as opposed to the files directly
  When developing a module/library in a folder, place an index.js file that exposes the module's internals so every consumer will pass through it. This serves as an 'interface' to your module and eases future changes without breaking the contract

  **Otherwise:** Changing the internal structure of files or the signature may break the interface with clients
  ```javascript
  // Do
  module.exports.SMSProvider = require("./SMSProvider");
  module.exports.SMSNumberResolver = require("./SMSNumberResolver");

  // Avoid
  module.exports.SMSProvider = require("./SMSProvider/SMSProvider.js");
  module.exports.SMSNumberResolver = require("./SMSNumberResolver/SMSNumberResolver.js");
  ```


- Use Async Await, avoid callbacks <br/>
  Node 8 LTS now has full support for Async-await. This is a new way of dealing with asynchronous code which supersedes callbacks and promises. Async-await is non-blocking, and it makes asynchronous code look synchronous. The best gift you can give to your code is using async-await which provides a much more compact and familiar code syntax like try-catch

  **Otherwise:** Handling async errors in callback style are probably the fastest way to hell - this style forces to check errors all over, deal with awkward code nesting, and makes it difficult to reason about the code flow

- Use arrow function expressions (`=>`)<br/>
  Though it's recommended to use async-await and avoid function parameters when dealing with older APIs that accept promises or callbacks - arrow functions make the code structure more compact and keep the lexical context of the root function (i.e. `this`)

  **Otherwise:** Longer code (in ES5 functions) is more prone to bugs and cumbersome to read
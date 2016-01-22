# alphabet-diamond-coffee
A TW Shokunin Coding Challenge


## The Challenge
Write a program which draws a diamond of the form illustrated below. The letter which is to appear at the widest point of the figure (E in the example) is to be specified as input data (CLI arg, keyboard read-in, etc).

```
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A
```

Inputs are `[a-zA-Z]` (e.g. letters only, upper or lower case). Output is upper case only.

##### Edge cases:
* If you input "a" or "A", then he output is simply "A".
* If the input is invalid, then the output is "INVALID INPUT".
* If you read from keyboard input you may ask the user for a new input.

## Requirements
* Nodejs and NPM (recommend installing via [NVM](https://github.com/creationix/nvm))

## Running the app

#### Setup

  ```bash
    npm install
  ```

#### Unit tests

  ```bash
    npm test
  ```

#### Running

  ```bash
    npm start <letter>
  ```

  Where `<letter>` is the input letter (without `<` `>`)

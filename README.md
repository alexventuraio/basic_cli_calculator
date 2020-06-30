# Basic CLI Calculator

The application tries to simulate the basic operations on a calculator like **add**, **subtract**, **multiply** and **divide** on the command line.

### Install

This program runs on Ruby entirely, so, first you need to make sure you have it already installed on your machine. Sometimes in MacOS X and some Linux distributions already have Ruby installed out of the box. If thats not your case you can [follow the official documentation](https://www.ruby-lang.org/en/documentation/installation/) and install it yourself.

To verify if you have a valid Ruby installed run this command on your terminal:
```sh
ruby -v
```
You will get something like this:
```sh
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin18]
```
Any version of Ruby should work but it is recommended to install the latest one which righ now is `2.7.1`.

### Usage

To run the application, first, in your terminal run the following command to clone this repo:

```sh
$ git clone https://github.com/alexventuraio/basic_cli_calculator.git
```

Then access the folder with:

```sh
$ cd basic_calculator/
```

Now, run the entry point of the app with the next command:

```sh
$ ruby main.rb
```

At this point you will be able to see the Calculator mask in your terminal. 🎉🎉🎉

The values shown as buttons are the only values that are accepted:
| Name  | Code |
| ----- | ---- |
| 0..9 | Numbers from 0 tot 9 |
| +,-,*,/ | Supported operations |
| = | To get the running total |
| c | To clear memory out |
| q | To exit from the application |

It is important that you enter values kind of the same that you do in a real calculator, one value at a time and pres ENTER between each selected key.

- For example: to calculate `3 + 2 - 4 = 1` you must type:
  ```
  3 ... enter
  + ... enter
  2 ... enter
  - ... enter
  4 ... enter
  = ... enter
  ```

- Also you can enter negative numbers in one shot like this: `3 * (-1) = -3`
  ```
  3 ... enter
  * ... enter
  -1 ... enter
  = ... enter
  ```

- You can enter numbers in one shot or type one by one, for example, to enter `3245`:
  ```
  3245 ... enter
  
  // ----- or -----
  
  3 ... enter
  2 ... enter
  4 ... enter
  5 ... enter
  ```
- Be awere that you are not allow to enter values like this: `44-1`, you will get an error message.

### Test suite

First, you need to make sure you have [RSpec](https://relishapp.com/rspec/docs/gettingstarted) installed. As mentioned before, once you have `ruby` installed in your system, installing `RSpec` is pretty straightforward. Just run the following command inside the root folder of the application:

```sh
$ gem install rspec
```

Once your have `RSpec` in your system, you just have to execute the following command to run the entire test suite:

```sh
$ rspec
```

# robot-test-automation-sauce-demo
### 🛠 Automated testing for Swag Labs web with test cases and bug reports using robot framework

📢 The tests are designed to cover various scenarios on the Sauce Demo website (https://www.saucedemo.com).

## Table of Contents

- [Introduction](#introduction)
- [Scope](#scope)
- [Features](#features)
- [Tools and Technologies Used](#tools-and-technologies-used)
- [Test Cases](#test-cases)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Test automation is the process of using software tools and frameworks to automate test execution, compare actual outcomes to expected outcomes, and generate test reports. This helps to increase efficiency, accuracy, and repeatability of testing processes, as well as reducing the time and costs associated with manual testing. <br><br>In here we are going to test SWAG Labs (Sauce Demo - https://www.saucedemo.com). We are going to use robot framework with Selenium for the automation.
## Scope

The project covers the following areas of the Sause Demo website:

- Login page for all accepted users and error scenarios.
- Product page, including sorting features and product detailed view.
- Your cart page for all accepted users.

## Features

- Utilizes robot framework to write tests in a human-readable format.
- Uses Selenium for interacting with web elements and performing automated actions.
- Includes a wide range of test cases covering login, product features, cart functionality, and more.
- Provides easy-to-understand bug reports and test outcomes.


## Tools and Technologies Used

This test automation project for Swag Labs utilizes a variety of tools and technologies to streamline the testing process and ensure efficient and accurate results.

- **Python**: The primary programming language used for writing the test automation code.

- **Robot framework**: A Behavior-Driven Development (BDD) tool that allows writing test scenarios in a human-readable format.

- **Selenium**: A popular open-source framework for automating web browser interactions and testing.

- **DataDriver**: The DataDriver implementation for utlising Excel and CSV files for test automation.


These technologies are combined to create an effective testing framework that automates test cases, performs comparisons between expected and actual outcomes, and generates detailed test reports.


## Test Cases
| Feature        | As a [role]          | I want [feature]         | So that [benefit]       |
|----------------|----------------------|--------------------------|-------------------------|
| Login credential | As a registered user           | User want to log in         | So that user can access the webshopping|
| Logout | As an user after login      | User want to logout   | So that user can exist the system |
| Product display arrangments in webpage| As a logedin user      | I want to arrange product catergoies | So that user can can view products either in alphbetical order or price order |
| Shopping cart| As a logedin user      | Add items to shopping cart | So that user can order items |
| Shopping cart| As a loged out user      | access saved shopping cart | So that user can continue shopping |




## Installation
Use the dockerfile.test to create the container. The docker file uses headless chrome and headless firefox. 

## Usage
```
docker build -t test -f dockerfile.test .
docker run --rm -it -v ${PWD}/Output:/tarobot/Output test ./commands.sh 

```

## Contributing

Contributions to this project are welcome! If you identify any issues or wish to enhance the existing test suite, please feel free to create pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

# CMA Developer Code Test

Hello there! Thank you for allowing me the opportunity show you just a "smidge" of what I can do. I decided to build this app in Flutter since it allows me to quickly produce something for iOS/Android/Web in the time allotted.

I am just as comfortable however, building the same app in ReactJS or React Native. The project goal, audience, and accessability ultimately decide what distribution platform is best. For example, I would not use Flutter for an app designed mostly for web browser consumption, just as I would not use ReactJS for a mostly native application.

## Prerequisites

### Tested Development Environment

`macOS 10.15.5`  
`Xcode 11.7`  
`iOS Simulator iPhone 11 Pro (13.7)`  
`Google Chrome Browser`

### Node

`node@12.18.0`  
`npm@6.14.4`  
https://nodejs.org/en/

`yarn@1.21.1`  
https://classic.yarnpkg.com/en/docs/install#mac-stable

### Python

This project was built using `venv` virtual environment and Python 3.8.5.
https://www.python.org/downloads/

Setup `pip` and `venv` as defined here:  
https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#installing-packages-using-pip-and-virtual-environments

Then install the requirements:

```bash
pip install -r requirements.txt
```

The python script is set to use `#!./venv/bin/python` so you should NOT need to run `source env/bin/activate`.

### Flutter

This app is built with Google's Flutter UI and Dart runtime. You can find information on how to install here:  
https://flutter.dev/docs/get-started/install

## Quick Start

I tried to make this as simple as possible to run.

You will need to launch an instance of the `iPhone 11 Pro` simulator first. If you do not have access to that specific simulator you have change the corresponding `run:ios` npm script in `package.json` to another available simulator.

See available devices by running `flutter devices`.

Ready, Set, Go!

```bash
git clone https://github.com/danielmahon/developer-code-test.git
cd developer-code-test
yarn install
yarn start
```

## Manual Start

If for some reason the `yarn start` command fails (I did not have time to test on multiple environments) you can run the commands manually and modify accordingly:

```bash
# Convert SQlite Database with Python
source env/bin/activate
python python/main.py

# Copy exported JSON to Flutter app
cpy db/cma-artworks.json flutter_app/assets

# Move to Flutter app
cd flutter_app

# Build Flutter generated files
flutter pub run build_runner build --delete-conflicting-outputs

# Run Flutter app in iOS simulator
flutter run --debug -d 'iPhone 11 Pro'

# Run Flutter app in Google Chrome
flutter run --debug -d 'Chrome'

```

# Project Requirements

## Part 1: Data Transformation

A 5-table SQLite database has been provided. The database contains a table of 100 artworks, a table of creators, a table of departments, and 2 linking tables containing the relationships between artworks, departments, and creators.

Using python, write a script that extracts the data from the tables and writes them into a JSON representation. Each object should contain all the information relevant to an artwork. Write the resulting data to a file.

## Part 2: Front-End Data Presentation

Using the web or mobile framework of your choice, create a simple app that ingests the JSON file from Part 1 and displays all the information in a clear interface. Feel free to be creative and keep in mind that each artwork record will have a lot of data, so displaying all the data, all at once, will not result in a “clear interface”. Also provided is a folder of artwork images that are referenced in the artwork data. The images are named by the accession number of the artwork (a unique identifier assigned to an artwork when it is acquired by a musuem). These images should also be incorporated into the final app.

## Completion and Submission

Completed work should include all code to arrive at the solution, plus all code, assets, and resources required to run the final result of part 2.

PLEASE INCLUDE a detailed README containing instructions for running the project locally.

All completed work should be pushed to a public repo on GitHub.

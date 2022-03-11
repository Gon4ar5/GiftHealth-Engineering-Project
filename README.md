# GiftHealth Engineering Project

## Task

- A description of what needed to be done can be found here: https://gist.github.com/schneiderderek/a9c0a8b29bcd51f43c9fc198c6c13ece

## Install, run and testing

### Requirements:

- rvm or rbenv
- ruby 2.7.2
- bundler version 2.3.7

### Usage

#### Running the tests:

```
$ rspec
```

#### Running the script:

```
$ ruby main.rb test_data/test1.txt
```

## Folders

### App Folder

#### Models Folder:

- `action.rb` - The action model stores the patient, drug, and event
- `drug.rb`
- `event.rb`
- `patient.rb`

#### Services Folder:

- `event_processor.rb` - A module that processes input data according to conditions.
- `main.rb` - It is a class with one method, within which 3 main actions of the script take place, reading a file, processing data and output to the console.
- `parses.rb` - Represents a class for reading a file received as an input

#### Presenters Folder:

- `console_presenter.rb` - Represents a class for outputting information to the console.

### Spec Folder:

#### Model Folder:

- Unit tests for models.

#### Services Folder:

- Unit tests for services.

#### Presenters Folder:

- Unit tests for presenters.

### Test_data Folder:

- test1.txt - the file with the test data.

## Github

- https://github.com/Gon4ar5/GiftHealth-Engineering-Project

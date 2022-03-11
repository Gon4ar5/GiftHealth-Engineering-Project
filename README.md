# GiftHealth Engineering Project

## Install, run and testing

### Requirements:

- rvm or rbenv
- ruby 3.0.3
- bundler version 2.2.32

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

- action.rb - The action model stores the patient, drug, and event
- drug.rb
- event.rb
- patient.rb

#### Services Folder:

- event_processor.rb - It is a module that contains all the necessary methods for my script to work.
- main.rb - It is a class with one method, within which 3 main actions of the script take place, reading a file, processing data and output to the console.
- parses.rb - Represents a class for reading a file received as input

#### Presenters Folder:

- console_presenter.rb - Represents a class for outputting information to the console.

### Spec Folder:

#### Model Folder:

- Unit tests for models.

#### Services Folder:

- Unit tests for services.

#### Presenters Folder:

- Unit tests for presenters.

### Test_data Folder:

- test1.txt - the file with the test data.

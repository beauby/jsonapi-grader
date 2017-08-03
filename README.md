# jsonapi-grader

Test suite to ensure libraries' compliance to the jsonapi.org spec.

## Installation

```
$ gem install jsonapi-grader
```

## Serialization libraries

In order to prove compliance of your serialization library, create in a directory
of your choice an executable file for each [scenario](scenarii/). This executable
must print the same JSON output as the scenario's.

For an example compliance implementation, see [jsonapi-rb](https://github.com/jsonapi-rb/jsonapi-rb/pull/3/files).

Then simply run the `jsonapi-grader` binary and provide it as an argument the directory
with your compliance executables:

```
$ jsonapi-grader serialization ./compliance
Running scenario null_data... passed
Running scenario empty_collection... passed
Running scenario simple_resource... passed
Running scenario simple_resource_attributes... passed
Running scenario simple_resource_meta... passed
Running scenario simple_resource_jsonapi_object... passed
Compliance: true
Score: 420 / 420 (100.0%)
```

## Server libraries

```
$ jsonapi-grader server http://example.com
Running scenario empty_collection... passed
Compliance: true
Score: 100 / 100 (100.0%)
```

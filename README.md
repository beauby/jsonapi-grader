# jsonapi-grader

Test suite to ensure libraries' compliance to the jsonapi.org spec.

The specs are available in [spec/](https://github.com/beauby/jsonapi-grader/tree/master/spec), and are based on a somewhat direct CRUD
API based on [fantasy-db](https://github.com/endpoints/fantasy-db).

For an example compliance application implementation, see
[jsonapi-rails](https://github.com/jsonapi-rb/jsonapi-rails/pull/58/files).

## Contributing

Mainly two things are needed at this point: more specs (mainly for
create/update/delete), and docs specifying the compliance app's behavior,
and describing each spec.

## Installation

```
$ gem install jsonapi-grader
```

## Usage

```
$ jsonapi-grader http://api.example.com
```

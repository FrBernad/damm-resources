# ITBA DAMM Class Resources

Welcome to DAMM 2024! This repo contains the resources used during classes with the purpose of
helping you understand the concepts and technologies we're working with.

## Authors

* [Francisco Bernad](https://github.com/FrBernad)
* [Gian Luca Pecile](https://github.com/glpecile)
* [Nicolas Rampoldi](https://github.com/NicolasRampoldi)

## How to use the repo

Access the `/lib` folder where you'll find the examples seen in each class.

* [dart_examples](/lib/dart_examples) -> intro to dart
* [discard_or_update](/lib/discard_or_update.dart) -> element and render tree
* [keys](/lib/keys.dart) -> widget keys
* [riverpod](/lib/riverpod) -> state management
* [beamer](/lib/beamer) -> routing & deep linking
* [go_router](/lib/go_router) -> routing & deep linking
* [form builder](/lib/form_builder.dart) -> user input

## Running the repo

On a separate terminal, run the command necessary for the codegen to work with the following
command:

```bash
dart run build_runner watch
```

Also run the following command to enable Git hooks in order to push files:

```bash
dart run husky install
```

Then, run one of the `app.dart` files in the `/lib` folder to see the examples in action.

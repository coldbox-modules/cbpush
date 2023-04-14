# cbpush

[![cbpush CI](https://github.com/coldbox-modules/cbpush/actions/workflows/ci.yml/badge.svg?branch=development)](https://github.com/coldbox-modules/cbpush/actions/workflows/ci.yml)

cbpush brings simplified websocket support to ColdBox applications using services such as Pusher, Ably, and Soketi.

<!-- <div align="center">
	<img src="https://raw.githubusercontent.com/coldbox-modules/cbwire/development/logo.png">
</div> -->

## Short Pitch

Build reactive apps easily using CFML and less JavaScript!

## Longer Pitch

## Requirements

-   Adobe CF 2018+ or Lucee 5+
-   ColdBox 6+

## Installation

Install [CommandBox](https://www.ortussolutions.com/products/commandbox), then from your terminal, run:

```bash
box install cbpush@be
```

## Examples

Included in this repo is an app where you can experience and see code examples covering all the features of cbpush.

Just run the following from the `test-harness` directory:

```
box install && cd .. && box server start
```

Then visit:

http://localhost:60299/


## Contributing

We love PRs! Please create a ticket using the [ Issue Tracker](https://github.com/coldbox-modules/cbpush/issues) before submitting a PR.

## Test Harness

There is a test harness application included in this repo.

To start the test harness:

```
cd test-harness
box install
box server start
```

This will start the test harness using a random port selected by CommandBox. For example, if the random port selected is 60299, you can run the test suite using http://127.0.0.1:60299/tests.

## License

Apache License 2.0

## Credits

The cbpush module for ColdBox is written and maintained by [Grant Copley](https://twitter.com/grantcopley) and [Ortus Solutions](https://www.ortussolutions.com/).

## Project Support

We love PRs!

If cbpush makes you happy, please consider becoming a [Patreon supporter](https://www.patreon.com/ortussolutions).

## Resources

-   Docmentation: https://cbpush.ortusbooks.com
-   API Docs: https://apidocs.ortussolutions.com/#/coldbox-modules/cbpush/
-   GitHub Repository: https://github.com/coldbox-modules/cbpush
-   Issue Tracker: https://github.com/coldbox-modules/cbpush/issues

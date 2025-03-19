# Goose Dev Container Feature

This repository provides a [dev container Feature](https://containers.dev/implementors/features/) for installing the [Goose AI coding assistant](https://github.com/block/goose) from Block in your development containers.

## Features

- **Goose**: Install the Goose AI coding assistant in your dev container

## Usage

```jsonc
{
    "name": "My Dev Container",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mikegehard/goose-devcontainer-feature/goose:1": {}
    }
}
```

## Available Options

The `goose` feature doesn't currently take any options.

## Repository Structure

```
.
├── src
│   └── goose                   # Goose Feature
│       ├── devcontainer-feature.json
│       └── install.sh
└── test                        # Tests for the Feature
    └── goose
        ├── test.json
        └── test.sh
```

## Development

### Prerequisites

- [Docker](https://www.docker.com/)
- [Dev Container CLI](https://github.com/devcontainers/cli)

### Testing

To test the feature, use the Dev Container CLI:

```bash
devcontainer features test
```

This will build a test container with the feature installed and run the tests defined in `test/goose/test.sh`.

## Contributing

Contributions are welcome! Here's how you can contribute:

1. Fork the repository
2. Create a feature branch: `git checkout -b my-new-feature`
3. Make your changes
4. Test your changes: `devcontainer features test -f goose`
5. Commit your changes: `git commit -am 'Add some feature'`
6. Push to the branch: `git push origin my-new-feature`
7. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Block](https://github.com/block) for creating the Goose AI coding assistant
- [Dev Containers](https://containers.dev/) for the dev container specification
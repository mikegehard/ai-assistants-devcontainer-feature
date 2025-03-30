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
    },
    "runArgs": ["--env-file",".env"]
}
```

### API Keys

For Goose to function properly, you'll need to set up API keys. The recommended approach is to use `.env` files:

1. Create a `.env` file in your project root or in the location specified by your Goose configuration
2. Use the provided `example.env` file as a reference:
   ```
   ANTHROPIC_API_KEY=your_anthropic_api_key_here
   OPENAI_API_KEY=your_openai_api_key_here
   DEEPSEEK_API_KEY=your_deepseek_api_key_here
   ```
3. Copy `example.env` to `.env` and add your actual API keys
4. Ensure your `.env` file is added to `.gitignore` to prevent accidentally committing sensitive information

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

### Publishing a New Release

To publish a new version of this feature:

1. Update the code as needed and test locally
2. Update the version in `src/goose/devcontainer-feature.json`
3. Commit your changes and push to the main branch
4. Create and push a new version tag:
   ```bash
   git tag v1.0.0  # Replace with your version
   git push origin v1.0.0
   ```
5. The GitHub Actions workflow will automatically:
   - Run all tests on multiple base images
   - Publish the feature to GitHub Container Registry if tests pass
   - Generate updated documentation and create a PR

After the release is published, users can install the feature using the reference in their devcontainer.json file.

## Contributing

Contributions are welcome! Here's how you can contribute:

1. Fork the repository
2. Create a feature branch: `git checkout -b my-new-feature`
3. Make your changes
4. Test your changes: `devcontainer features test -f goose`
5. Commit your changes: `git commit -am 'Add some feature'`
6. Push to the branch: `git push origin my-new-feature`
7. Submit a pull request

### Building Locally for Testing in Other Projects

To build and test your feature in another project before publishing:

1. Create a tarball of your feature:
   ```bash
   devcontainer features package -f -o ./output ./src
   ```
   This creates a tarball in the `./output` directory.

This approach allows you to test your feature changes in real projects before publishing a new version.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Block](https://github.com/block) for creating the Goose AI coding assistant
- [Dev Containers](https://containers.dev/) for the dev container specification
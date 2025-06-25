# AI Assistants Dev Container Features

This repository provides [dev container Features](https://containers.dev/implementors/features/) for installing AI coding assistants in your development containers.

## Features

- **Goose**: Install the Goose AI coding assistant from Block in your dev container
- **Gemini CLI**: Install the Google Gemini CLI for AI-powered development

## Usage

### Using Goose

```jsonc
{
    "name": "My Dev Container",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mikegehard/ai-assistants-devcontainers-feature/goose:1.0": {}
    },
    "runArgs": ["--env-file",".env"]
}
```

### Using Gemini CLI

```jsonc
{
    "name": "My Dev Container",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mikegehard/ai-assistants-devcontainers-feature/gemini-cli:1.0": {}
    },
    "runArgs": ["--env-file",".env"]
}
```

### Using Both Features

```jsonc
{
    "name": "My Dev Container",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mikegehard/ai-assistants-devcontainers-feature/goose:1.0": {},
        "ghcr.io/mikegehard/ai-assistants-devcontainers-feature/gemini-cli:1.0": {}
    },
    "runArgs": ["--env-file",".env"]
}
```

### API Keys

#### Goose API Keys

For Goose to function properly, you'll need to set up API keys. The recommended approach is to use `.env` files:

1. Create a `.env` file in your project root or in the location specified by your Goose configuration
2. Use the provided `.env.example` file as a reference:
   ```
   ANTHROPIC_API_KEY=your_anthropic_api_key_here
   GOOGLE_API_KEY=your_gemini_api_key_here
   ```
3. Copy `.env.example` to `.env` and add your actual API keys
4. Ensure your `.env` file is added to `.gitignore` to prevent accidentally committing sensitive information

#### Gemini CLI API Keys

For the Gemini CLI to work, you'll need to configure your Google AI API key:

1. Get your API key from [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Set it as an environment variable:
   ```
   GEMINI_API_KEY=your_gemini_api_key_here
   ```
3. Add this to your `.env` file or set it in your dev container environment

## Available Options

- The `goose` feature doesn't currently take any options
- The `gemini-cli` feature doesn't currently take any options

## Repository Structure

```
.
├── src
│   ├── goose                   # Goose Feature
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
│   └── gemini                  # Gemini CLI Feature
│       ├── devcontainer-feature.json
│       └── install.sh
└── test                        # Tests for the Features
    ├── goose
    │   ├── test.json
    │   └── test.sh
    └── gemini
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

This will build test containers with both features installed and run the tests defined in `test/goose/test.sh` and `test/gemini/test.sh`.

### Publishing a New Release

To publish a new version of this feature:

1. Update the code as needed and test locally
2. Update the version in the appropriate feature's `devcontainer-feature.json` file (`src/goose/devcontainer-feature.json` or `src/gemini/devcontainer-feature.json`)
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
4. Test your changes: `devcontainer features test` (tests both features) or `devcontainer features test -f goose` / `devcontainer features test -f gemini` for individual features
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
- [Google](https://github.com/google-gemini) for creating the Gemini CLI
- [Dev Containers](https://containers.dev/) for the dev container specification
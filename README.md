# Feature Brick

A Mason brick for generating Clean Architecture feature modules in Flutter projects.

## Overview

This brick generates a complete feature module following Clean Architecture principles with:
- **Domain Layer**: Entities, repositories (interfaces), and use cases
- **Data Layer**: Models, data sources, and repository implementations
- **Presentation Layer**: BLoC state management with pages and widgets
- **Tests**: Unit tests for all use cases and data layer components

## Installation

```bash
mason add feature
```

## Usage

```bash
mason make feature
```

## Variables ✨

| Variable       | Description             | Default         | Type     |
|----------------|-------------------------|-----------------|----------|
| `feature_name` | The name of the feature | example_feature | `string` |

**Note:** The `project_name` variable is automatically extracted from your `pubspec.yaml` by the pre-generation hook.

## Important Notes

⚠️ **Input Requirements:**
- Use only **alphanumeric characters and underscores** for feature names
- **No unicode characters, special characters, or spaces**
- Examples: `user`, `product_catalog`, `order_history`

## Generated Structure

```
lib/features/{feature_name}/
├── data/
│   ├── data_source/         # Remote data sources
│   ├── models/              # Data models
│   ├── repositories/        # Repository implementations
│   └── data.dart            # Data layer barrel file
├── domain/
│   ├── entities/            # Domain entities
│   ├── repositories/        # Repository interfaces
│   ├── use_cases/           # Business logic (CRUD operations)
│   │   └── use_cases.dart   # Use cases barrel file
│   └── domain.dart          # Domain layer barrel file
└── presentation/
    ├── bloc/                # BLoC state management
    ├── pages/               # UI pages
    │   └── pages.dart       # Pages barrel file
    ├── widgets/             # Reusable widgets
    │   └── widgets.dart     # Widgets barrel file
    └── presentation.dart    # Presentation layer barrel file
```

## Generated Use Cases

- `Get{Feature}UseCase` - Fetch single item
- `Get{Feature}sUseCase` - Fetch list with pagination
- `Create{Feature}UseCase` - Create new item
- `Update{Feature}UseCase` - Update existing item
- `Delete{Feature}UseCase` - Delete item

## Prerequisites

Your Flutter project must have:
- Clean Architecture base structure
- Core utilities (`type_definition.dart`, `use_case.dart`, `api_service.dart`)
- Dependencies: `equatable`, `flutter_bloc`, `fpdart`, `mocktail` (for tests)

## Hook

The brick includes a pre-generation hook that automatically extracts your project name from `pubspec.yaml` to ensure proper imports.

## Related Bricks

Consider using these complementary bricks for your Flutter project:
- [**clean_architecture**](https://github.com/tranvu1805/clean_architecture_template.git) - Generate core utilities and base architecture

## License

See [LICENSE](LICENSE) file.


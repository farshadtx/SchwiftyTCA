# SchwiftyTCA

🧪 A sample iOS app built using [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture), showcasing a modular, testable architecture with GraphQL integration using the [Rick & Morty API](https://rickandmortyapi.com/).

---

## 📱 Features

- 🔍 Paginated list of characters from the Rick & Morty universe
- 👤 Character details screen with full info (status, species, origin, location, episodes)
- 📦 Caching for images (in-memory + disk)
- 🌐 GraphQL API integration using Apollo
- 🧪 Unit tested reducer logic using [swift-testing](https://github.com/apple/swift-testing)
- 🧩 Built with modern TCA patterns and dependency management

---

## 🧱 Architecture

This app is built entirely using Point-Free’s **Composable Architecture (TCA)**, with a strong focus on:

- **Modularity** – Separated reducers, views, and dependencies
- **Testability** – Mocked clients, unit tests for state transitions
- **Scalability** – Stack navigation using `NavigationStack` + `StackState`
- **Async/Await** – No use of legacy GCD or callbacks

### Module Breakdown

| Module             | Purpose                                 |
|--------------------|------------------------------------------|
| `CharactersReducer` | Manages character list & pagination     |
| `CharacterDetailsReducer` | Handles detailed character info |
| `MainReducer`       | Composes app-wide navigation & logic   |
| `CacheService`      | In-memory & disk image caching         |
| `GraphQLClient`     | Async abstraction over Apollo client   |

---

## 📦 Dependencies

- [`swift-composable-architecture`](https://github.com/pointfreeco/swift-composable-architecture)
- [`apollo-ios`](https://github.com/apollographql/apollo-ios)
- [`swift-testing`](https://github.com/apple/swift-testing)
- [`swift-dependencies`](https://github.com/pointfreeco/swift-dependencies)

---

## 🚀 Getting Started

1. **Clone the repo**:
   ```bash
   git clone https://github.com/farshadtx/SchwiftyTCA.git
   cd SchwiftyTCA
    ```

2. **Install dependencies**:

   Open the .xcodeproj or .xcworkspace and let SwiftPM fetch dependencies.

3. **Run the app**:

   Build and run the SchwiftyTCA scheme in Xcode (iOS 17+ recommended).

4. **Run tests**:
    ```bash
    ⌘ + U (or use the Test navigator)
    ```

---

## 🧪 Testing

- Reducers use TestStore and swift-testing assertions
- API and cache dependencies are mocked
- Run tests via Xcode or command line

---

## 🙌 Acknowledgments

- [Point-Free](https://www.pointfree.co) – for their incredible work on TCA and related libraries
- [Rick & Morty API](https://rickandmortyapi.com/) – free public GraphQL API
# DailyNews Flutter App

DailyNews is a Flutter application demonstrating **Clean Architecture** principles, **Bloc state management**, and a **core network layer** to fetch and display news articles from a public API. The project is structured for scalability, maintainability, and easy testing.

---

## 🚀 Features

- Fetch news articles from a remote API.
- Display articles in a clean, scrollable UI.
- Error handling with **AppException** and centralized network layer.
- Fully separated layers following **Clean Architecture**:
  - **Presentation**: Bloc, Events, States, and UI.
  - **Domain**: Entities and UseCases.
  - **Data**: Repositories, Models, Mappers, API Services.
  - **Core**: Network client, error handling, constants.
- Immutable data flow and reactive UI updates.

---

## 🗂 Project Structure
lib/
├── app/core/ # Core utilities, network, error handling, constants
├── features/
│ └── daily_news/
│ ├── data/
│ │ ├── models/ # API models
│ │ ├── mappers/ # Model → Entity mapping
│ │ └── data_sources/ # Remote API service
│ ├── domain/
│ │ ├── entities/ # Domain entities
│ │ └── usecase/ # Feature-specific use cases
│ └── presentation/
│ ├── bloc/ # Bloc, events, states
│ └── pages/ # UI widgets/screens


---

## ⚙️ Getting Started

1. **Clone the repository**  

```bash
git clone https://github.com/your-username/dailynews.git
cd dailynews


Install dependencies

flutter pub get


Run the app

flutter run

📦 Dependencies

flutter_bloc – State management with Bloc

dio – HTTP client for API calls

cached_network_image – Image caching for articles

Other Flutter SDK packages as required

🧩 Architecture Overview

UI / Widget: subscribes to Bloc state and dispatches events.

Bloc: receives events, calls UseCase, emits states.

UseCase: handles business logic, calls Repository.

Repository: calls API service, converts Model → Entity, maps errors.

API Service: makes network requests via DioClient.

Core: handles errors, network configuration, interceptors.

🛠 Error Handling

All network errors are mapped to AppException using a centralized ErrorHandler.

Bloc emits RemoteArticleError(AppException) for UI to display user-friendly messages.

📌 Notes

This project follows Clean Architecture for scalability and maintainability.

Mappers ensure data integrity: Model → Entity.

Easy to add new features without affecting existing layers.

UI only subscribes to Bloc states; no direct API calls in UI.

Network, errors, and constants are centralized in core folder for reuse.


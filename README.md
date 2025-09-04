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



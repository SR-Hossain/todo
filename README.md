
# to_do

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application with **Clean Architecture.**

Todo

---

Entity:

- id
- title
- description
- created_time
- isComplete

Use case:

- updateTitle
- updateDescription
- toggleComplete

# Todos

---

## Use cases:

- createNewTodo()
- deleteTodo(id)


    

# Clean Architecture

---

- Presentation Layer
- Domain Layer
  - Repository
  - Use Cases
- Data Layer
  - Repository
    - Local
      - Abstract 		Hive

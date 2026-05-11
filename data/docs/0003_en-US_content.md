# Router

This file defines the `Router` class, which is responsible for managing routes and their associated actions within an application, handling requests, and generating URLs.

## Overview

The `Router` class is part of the core routing mechanism of the application. It enables the mapping of routes to specific actions, manages the execution of these actions upon receiving requests, and facilitates URL creation based on defined paths.

## Class Description

### Router

The `Router` class encapsulates the routing structure and functionality necessary for action execution based on incoming requests.

### Properties

- `protected RouteTree $structure`: Stores the tree structure representing the routing configuration.

## Responsibilities or Methods

- **`__construct(?RouteTree $structure = null)`**: Initializes a new instance of the `Router` class with an optional route tree structure.

- **`getStructure(): RouteTree`**: Retrieves the current route tree structure.

- **`get(Route|string $route): Router`**: Returns a new `Router` instance for a specified route.

- **`use(Route|string $route, Closure|Action ...$actions): static`**: Associates actions with a specified route.

- **`bind(Route|string $route, Router $router): static`**: Binds the current router to another router at a specified route.

- **`expose(Route|string $route, Action|Closure $action): static`**: Exposes a route and its corresponding action.

- **`find(Path $path): array`**: Searches for traces in the route tree based on the provided path.

- **`performActions(Path $path, Request $request, Response $response): void`**: Executes actions associated with the found traces for a given request and response.

- **`getRoute(): Route`**: Retrieves the route associated with the current router.

- **`isBound(): bool`**: Checks whether the current router is bound to a parent route.

- **`createUrl(?Path $relative = null): Url`**: Constructs a URL based on the current route and optionally supplied relative path segments.

## Dependencies

The `Router` class relies on the following components:

- `Route`: Manages route definitions and resolving.
- `RouteTree`: Represents the tree structure of routes and their relationships.
- `Action`: Represents actions that can be executed on routes.
- `Procedure`: Facilitates the resolution of actions.
- `Request`: Represents an incoming request to be handled by the router.
- `Response`: Represents an outgoing response from the application.
- `StrictStack`: A stack structure to handle parameters.
- `TreeVertex`: Used for managing the tree vertex for routes.
- `Url`: Represents a URL structure and provides methods for URL manipulation.
- `RouteChasmEnvironment`: Provides the execution context for route queries.

## Usage Notes

The `Router` class is central to routing within the application and should be used while defining routes and handling corresponding requests effectively. Actions should be defined clearly to ensure proper execution when routes are matched.
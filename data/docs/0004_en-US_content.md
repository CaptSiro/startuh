# Request Class

The `Request` class is part of the `core
otification` namespace and handles incoming HTTP requests in the application. It provides methods for accessing various aspects of the request such as headers, URL, body, and session data.


## Overview

The `Request` class encapsulates the details of an HTTP request including its method, headers, body, and session information. This class is fundamental for managing interactions between the client and the server, allowing effective handling of request data.


## Class Description

The primary purpose of the `Request` class is to represent an HTTP request and provide associated properties and methods to manage it efficiently. It includes mechanisms for parsing and accessing request data, managing session variables, and handling file uploads.


## Responsibilities or Methods

- **Constructors**:
  - `__construct(App $app, LimitedFormat $format, Url $url, StrictDictionary $cookies)` - Initializes a new instance of the `Request` class with application context, format, URL, and cookies.
  
- **Static Methods**:
  - `test(?App $app = null, ?Url $url = null, ?string $httpMethod = "GET"): self` - Static method for testing purposes, creating a `Request` object with optional parameters.

- **Getters**:
  - `getFormat(): string` - Returns the format identifier of the request.
  - `getUrl(): Url` - Retrieves the request URL.
  - `getBodyReader(): FileReader` - Provides a `FileReader` for reading the body of the request.
  - `getBody(): StrictDictionary` - Returns the parsed body of the request.
  - `getFiles(): StrictDictionary` - Retrieves uploaded files as a `StrictDictionary`.
  - `getRemainingPath(): Path` - Returns the remaining path of the request based on the URL.
  - `getDomain(): Domain` - Returns the domain information.
  - `getLanguage(): Language` - Determines and returns the appropriate language based on selection.
  - `getHeaders(): ?array` - Retrieves request headers.
  - `getHttpMethod(): string` - Returns the HTTP method of the request.
  - `getCookies(): StrictDictionary` - Retrieves cookies sent with the request.
  - `getParam(): StrictStack` - Returns the parameters as a `StrictStack`.
  - `getAnyParam(): ?string` - Returns any parameter defined.
  - `getSession(): ?Session` - Retrieves the session associated with the request.
  - `getHeader(string $name): ?string` - Gets a specific header by name.
  - `get(string $variable, mixed $or = null)` - Fetches data from the request's internal storage, providing a default value if not set.
  - `getFatal(string $variable)` - Fetches data strictly and throws if not available.

- **Setters**:
  - `set(string $name, mixed $value): void` - Sets a value in the request data storage.
  - `setLanguageSelector(LanguageSelector $languageSelector): void` - Sets a custom language selector.
  - `setHeader(string $name, string $value): void` - Sets a header value.

- **Utilities**:
  - `exists(string $variable): bool` - Checks if a variable exists in the request.
  - `isMultipart(): bool` - Determines if the request is for a multipart form submission.
  - `__debugInfo(): ?array` - Provides debugging information about the request object.


## Dependencies

- `core\App` - Manages the application context and offers parsing capabilities.
- `core\collections\dictionary\Session` - Represents a user session for the request.
- `core\collections\dictionary\StrictMap` - Maps key-value pairs with strict type checking.
- `core\collections\dictionary\StrictStack` - A stack structure for handling parameters.
- `core\collections\StrictDictionary` - A strict dictionary for managing request-specific data.
- `core\http\HttpHeader` - Constants for managing HTTP headers.
- `core\io\FileReader` - Reads the body content of the request.
- `core\locale\LanguageSelector` - Provides a mechanism for selecting the appropriate language.
- `core\locale\selectors\DefaultSelector` - Default implementation of a language selector.
- `core\route\Path` - Handles request path information.
- `core\url\Url` - Represents and manipulates URLs.
- `models\core\Domain\Domain` - Represents the domain context for the request.
- `models\core\Language\Language` - Represents language information associated with the request.


## Usage Notes

To create an instance of the `Request` class, pass the relevant application context, URL, and other parameters as needed. The class manages state and retrieves necessary information lazily to optimize performance.
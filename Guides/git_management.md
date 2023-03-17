# Git Best Practices

## Code Commits

### Messages

#### Format

GitHub commit messages will take the approximate Backus–Naur form:

```txt
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

As established by the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standard. This will also allow automated ChangeLog generation for final review.

`<type>` will take any of the following forms:

1. `fix`: a commit of the type `fix` patches a bug in your codebase (this correlates with PATCH in [Semantic Versioning](https://semver.org/)).
2. `feat`: a commit of the type `feat` introduces a new feature to the codebase (this correlates with MINOR in [Semantic Versioning](https://semver.org/)).
3. `perf`: A code change that improves performance
4. `refactor`: A code change that neither fixes a bug nor adds a feature
5. `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
6. `test`: Adding missing tests or correcting existing tests
7. `build`: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
8. `docs`: Changes that affect any documentation e.g. markdown files.

`scope` 

The scope details the part of the code affected. Common scopes are:

1. File: enter the name of the file affected.
2. Class: enter the name of the class affected

`<description>`

The description contains a succinct description of the change:

- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize the first letter
- no dot (.) at the end

`<body>`

Just as in the description, use the imperative, present tense: "change" not "changed" nor "changes". The body should include the motivation for the change and contrast this with previous behavior.

If the `<footer>` contains `BREAKING CHANGE` or appends a `!` after the type/scope, it correlates with MAJOR in [Semantic Versioning](https://semver.org/).

As such, an example commit message would be:

```txt
fix(ABC-123): Caught Promise exception

We did not catch the promise exception thrown by the API call
and therefore we could not show the error message to the user
```

#### Enforcement

This formatting is enforced by [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional) and [standard-version](https://github.com/conventional-changelog/standard-version)

## Git Hooks

Hook management is done with [Husky](https://github.com/typicode/husky).

## CHANGELOG Generation

Automated CHANGELOG generation and release versioning is done via [release-please](https://github.com/googleapis/release-please).

## Versioning

Automated versioning is done via [release-please](https://github.com/googleapis/release-please) using the [semantic versioning (semver) standard](https://semver.org/).

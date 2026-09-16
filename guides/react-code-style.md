---
title: React / TypeScript code style
when_to_read: writing or reviewing React or TypeScript in a project that adopts this handbook
summary:
  - Seven portable rules for new code and files you touch — no blanket legacy rewrite
  - Early return, nesting cap, arrows by default, object params, undefined over null, array methods, as const
  - Platform or package-boundary deltas belong in the consuming project, not here
---

# React / TypeScript code style

These rules apply to **new code** and files migrated as they are touched. Pre-existing files do not need a blanket rewrite.

Language for commits, PR text, and test titles: see [writing-style.md](./writing-style.md) and [commit-conventions.md](./commit-conventions.md).

## 1. Early return and guard clauses

Reject invalid state at the top of a function. Do not wrap the entire body in an `if` or `try`.

```ts
// Good
const processUser = (user: User | undefined) => {
  if (!user) return;
  // main logic at top level
};

// Bad — unnecessary nesting
const processUser = (user: User | undefined) => {
  if (user) {
    // entire body nested
  }
};
```

## 2. Function separation — max 2 levels of nesting

Control-flow nesting (`if` / `try` / `for`) has a maximum of **2 levels**. Deeper than that, extract a named helper.

```ts
// Good — extracted
const parseResponse = (raw: unknown) => {
  const validated = validateSchema(raw);
  return transformToModel(validated);
};

const fetchUser = async (id: string) => {
  const response = await api.get(id);
  return parseResponse(response);
};
```

## 3. Arrow functions by default

Use arrow functions for utility, helper, and factory functions. Reserve the `function` keyword for two cases only:

- React components — `export function LoginForm() { … }`
- Generators — `function* paginate() { … }`

```ts
// Good
const formatDate = (date: Date) => { … };
export function LoginForm() { … }        // component

// Bad
export function createSttHandler(opts: Options) { … }   // factory, not a component
```

## 4. Object parameters for 3+ arguments

A function with three or more parameters takes a single object argument with a separate named type.

```ts
type DownloadExamArgs = {
  channelId: string;
  sessionId: string;
  params: DownloadExamParams;
};

const downloadExam = async ({ channelId, sessionId, params }: DownloadExamArgs) => { … };
```

## 5. Prefer `undefined` over `null`

Use `undefined` for absent values, and an empty string `""` for absent string fields. Use `null` only where a third-party API requires it — for example React's `useRef<T>(null)`, which types the ref as `T | null`.

```ts
// Good
let cancelWatchdog: (() => void) | undefined;

// Bad
let cancelWatchdog: (() => void) | null = null;
```

## 6. Array methods over for-loops

Prefer `map` / `filter` / `find` / `some` / `every` / `reduce` over `for`. Use `for` only when an array method cannot express the logic cleanly — sequential `await`, or per-item cleanup that needs its own `try`/`catch`.

## 7. `as const` for literal types

Apply `as const` to constant object and array literals so they get literal types.

```ts
return { ok: true } as const;
```

## Platform deltas

Timers, `RefObject` nullability, barrel exports, and similar runtime or package-boundary choices differ by project on purpose. Document those deltas in the consuming repo. Do not override the seven rules above to paper over a platform difference.

## References

- Adapted from a shared React code-style canon used across multiple product repos (est-work `wiki/conventions/shared-code-style.md`, itself merged from web and mobile convention docs).

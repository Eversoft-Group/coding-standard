---
sidebar_position: 3
---

# Project Structure Practices

## Structure your solution by components

The worst large applications pitfall is maintaining a huge code base with hundreds of dependencies - such a monolith slows down developers as they try to incorporate new features. Instead, partition your code into components, each gets its folder or a dedicated codebase, and ensure that each unit is kept small and simple. Visit 'Read More' below to see examples of correct project structure

**Otherwise:** When developers who code new features struggle to realize the impact of their change and fear to break other dependent components - deployments become slower and riskier. It's also considered harder to scale-out when all the business units are not separated

<br/>

## Layer your components, keep the web layer within its boundaries

Each component should contain 'layers' - a dedicated object for the web, logic, and data access code. This not only draws a clean separation of concerns but also significantly eases mocking and testing the system. Though this is a very common pattern, API developers tend to mix layers by passing the web layer objects (e.g. Express req, res) to business logic and data layers - this makes your application dependent on and accessible only by specific web frameworks

**Otherwise:** App that mixes web objects with other layers cannot be accessed by testing code, CRON jobs, triggers from message queues, etc

<br/>

## Wrap common utilities as npm packages

In a large app that constitutes a large codebase, cross-cutting-concern utilities like a logger, encryption and alike, should be wrapped by your code and exposed as private npm packages. This allows sharing them among multiple codebases and projects

**Otherwise:** You'll have to invent your deployment and the dependency wheel

<br/>

## Separate Express `app` and `server`

Avoid the nasty habit of defining the entire [Express](https://expressjs.com/) app in a single huge file - separate your 'Express' definition to at least two files: the API declaration (app.js) and the networking concerns (WWW). For even better structure, locate your API declaration within components

**Otherwise:** Your API will be accessible for testing via HTTP calls only (slower and much harder to generate coverage reports). It probably won't be a big pleasure to maintain hundreds of lines of code in a single file

<br/>

## Use environment aware, secure and hierarchical config

A perfect and flawless configuration setup should ensure (a) keys can be read from file AND from environment variable (b) secrets are kept outside committed code (c) config is hierarchical for easier findability. There are a few packages that can help tick most of those boxes like [rc](https://www.npmjs.com/package/rc), [nconf](https://www.npmjs.com/package/nconf), [config](https://www.npmjs.com/package/config), and [convict](https://www.npmjs.com/package/convict).

**Otherwise:** Failing to satisfy any of the config requirements will simply bog down the development or DevOps team. Probably both
<br/>
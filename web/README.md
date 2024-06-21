# Blog App

A demo blog app as a starter project to kickstart project

## Getting Started

Kindly ensure you have the following installed:

- Nodejs
- Typescript

## Setting up and running

1. Clone the repo:

```
git clone https://github.com/A2SV/Ghana-G4-Starter-Project.git
cd web
```

2. Install node modules:

```
npm i
```

Incase of an error, do this:

```
delete package-lock.json and node modules

npm config set legacy-peer-deps true
npm i
```

3. Run the app:

```
npm run dev
```

## Technologies Used

- Nodejs
- Typescript
- NextJs
- Tailwind

## Contribution

- Create branches only through Jira.

### Opening Pull Requests

- Stage `git add . `
- Commit `git commit -m "(action(eg. feat, fix) ): summary of what you have done in that commit" `
- Checkout to web branch `git checkout web`
- Pull latest changes from main `git pull`
- Checkout out to your branch `git checkout (your branch) `
- Rebase from web `git rebase web`
- Handle/Resolve Conflicts (if needed)
- Stage `git add .`
- Commit `git commit -m (eg.)"rebased from web"`
- Push `git push`
- Create a PR to the web branch.

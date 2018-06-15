# README

This Project is hosted at [Heroku](https://gh-webhook-rails.herokuapp.com)

This application provides a API to receive GitHub issues from allowed repositories

For testing, issues must be created [on this repository](https://github.com/matheusvetor/webhook-test)
or you can configure any GitHub repository and allow webhook with
this url: ```https://gh-webhook-rails.herokuapp.com/api/v1/issues```

## Dependencies

* ruby 2.4
* postgresql (9.6 ou higher)

## Unit Tests

The unit tests were written with Rspec.

In addition to Rspec, other tools were used to measure the quality of the code:
- [brakeman](https://github.com/presidentbeef/brakeman)
- [fasterer](https://github.com/DamirSvrtan/fasterer)
- [rubocop](https://github.com/rubocop-hq/rubocop)
- [rubycritic](https://github.com/whitesmith/rubycritic)
- [simplecov](https://github.com/colszowka/simplecov)

To run the test suite: ```bundle exec rake```

## Continuous Integration

This repository is configured to run the Continuous Integration scripts with each push.

[![Build Status](https://travis-ci.com/matheusvetor/gh-webhook-rails.svg?branch=master)](https://travis-ci.com/matheusvetor/gh-webhook-rails)

## Running the application

```git clone https://github.com/matheusvetor/gh-webhook-rails.git```

```cd gh-webhook-rails```

```rvm install ruby-2.4```

```bundle install```

```rails s```

## Api

This app provides a Rest API with the following resources:

## Repositories
### **GET** - /repositories/137114381/issues

```sh
curl -X GET "https://gh-webhook-rails.herokuapp.com/api/v1/repositories/137114381/issues"
```
#### Response
```
[
  {
    "id": 331803011,
    "action": "create",
    "repository_id": 137114381,
    "created_at": "2018-06-13T18:20:17.771Z",
    "updated_at": "2018-06-13T18:20:17.771Z",
    "repository_name": "webhook-test",
    "owner_name": "matheusvetor"
  }
]
```

# Issues

#### **GET** - /api/v1/issues/:id
```sh
curl -X GET "https://gh-webhook-rails.herokuapp.com/api/v1/issues/123"
```
#### Response
```
{
  "id": 331803011,
  "action": "create",
  "repository_id": 137114381,
  "created_at": "2018-06-13T18:20:17.771Z",
  "updated_at": "2018-06-13T18:20:17.771Z",
  "repository_name": "webhook-test",
  "owner_name": "matheusvetor"
}
```

### **POST** - /issues

```sh
curl -X POST "https://gh-webhook-rails.herokuapp.com/api/v1/issues" \
    -H "X-GitHub-Event: issues" \
    -H "Content-Type: application/json" \
    --data-raw "$body"
```

#### Header Parameters

- **X-GitHub-Event** should respect the following schema:

```
{
  "type": "string",
  "enum": [
    "issues"
  ],
  "default": "issues"
}
```
- **Content-Type** should respect the following schema:

```
{
  "type": "string",
  "enum": [
    "application/json"
  ],
  "default": "application/json"
}
```

#### Body Parameters

- **body** should respect the following schema:

```
{
  "type": "string",
  "default": "{\n  \"action\": \"opened\",\n  \"issue\": {\n    \"url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/1\",\n    \"repository_url\": \"https://api.github.com/repos/matheusvetor/webhook-test\",\n    \"labels_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/1/labels{/name}\",\n    \"comments_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/1/comments\",\n    \"events_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/1/events\",\n    \"html_url\": \"https://github.com/matheusvetor/webhook-test/issues/1\",\n    \"id\": 331803011,\n    \"node_id\": \"MDU6SXNzdWUzMzE4MDMwMTA=\",\n    \"number\": 1,\n    \"title\": \"issue test\",\n    \"user\": {\n      \"login\": \"matheusvetor\",\n      \"id\": 1412605,\n      \"node_id\": \"MDQ6VXNlcjE0MTI2MDU=\",\n      \"avatar_url\": \"https://avatars1.githubusercontent.com/u/1412605?v=4\",\n      \"gravatar_id\": \"\",\n      \"url\": \"https://api.github.com/users/matheusvetor\",\n      \"html_url\": \"https://github.com/matheusvetor\",\n      \"followers_url\": \"https://api.github.com/users/matheusvetor/followers\",\n      \"following_url\": \"https://api.github.com/users/matheusvetor/following{/other_user}\",\n      \"gists_url\": \"https://api.github.com/users/matheusvetor/gists{/gist_id}\",\n      \"starred_url\": \"https://api.github.com/users/matheusvetor/starred{/owner}{/repo}\",\n      \"subscriptions_url\": \"https://api.github.com/users/matheusvetor/subscriptions\",\n      \"organizations_url\": \"https://api.github.com/users/matheusvetor/orgs\",\n      \"repos_url\": \"https://api.github.com/users/matheusvetor/repos\",\n      \"events_url\": \"https://api.github.com/users/matheusvetor/events{/privacy}\",\n      \"received_events_url\": \"https://api.github.com/users/matheusvetor/received_events\",\n      \"type\": \"User\",\n      \"site_admin\": false\n    },\n    \"labels\": [\n\n    ],\n    \"state\": \"open\",\n    \"locked\": false,\n    \"assignee\": null,\n    \"assignees\": [\n\n    ],\n    \"milestone\": null,\n    \"comments\": 0,\n    \"created_at\": \"2018-06-13T00:49:18Z\",\n    \"updated_at\": \"2018-06-13T00:49:18Z\",\n    \"closed_at\": null,\n    \"author_association\": \"OWNER\",\n    \"body\": \"asdasdas\"\n  },\n  \"repository\": {\n    \"id\": 137114381,\n    \"node_id\": \"MDEwOlJlcG9zaXRvcnkxMzcxMTQzODk=\",\n    \"name\": \"webhook-test\",\n    \"full_name\": \"matheusvetor/webhook-test\",\n    \"owner\": {\n      \"login\": \"matheusvetor\",\n      \"id\": 1412605,\n      \"node_id\": \"MDQ6VXNlcjE0MTI2MDU=\",\n      \"avatar_url\": \"https://avatars1.githubusercontent.com/u/1412605?v=4\",\n      \"gravatar_id\": \"\",\n      \"url\": \"https://api.github.com/users/matheusvetor\",\n      \"html_url\": \"https://github.com/matheusvetor\",\n      \"followers_url\": \"https://api.github.com/users/matheusvetor/followers\",\n      \"following_url\": \"https://api.github.com/users/matheusvetor/following{/other_user}\",\n      \"gists_url\": \"https://api.github.com/users/matheusvetor/gists{/gist_id}\",\n      \"starred_url\": \"https://api.github.com/users/matheusvetor/starred{/owner}{/repo}\",\n      \"subscriptions_url\": \"https://api.github.com/users/matheusvetor/subscriptions\",\n      \"organizations_url\": \"https://api.github.com/users/matheusvetor/orgs\",\n      \"repos_url\": \"https://api.github.com/users/matheusvetor/repos\",\n      \"events_url\": \"https://api.github.com/users/matheusvetor/events{/privacy}\",\n      \"received_events_url\": \"https://api.github.com/users/matheusvetor/received_events\",\n      \"type\": \"User\",\n      \"site_admin\": false\n    },\n    \"private\": false,\n    \"html_url\": \"https://github.com/matheusvetor/webhook-test\",\n    \"description\": null,\n    \"fork\": false,\n    \"url\": \"https://api.github.com/repos/matheusvetor/webhook-test\",\n    \"forks_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/forks\",\n    \"keys_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/keys{/key_id}\",\n    \"collaborators_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/collaborators{/collaborator}\",\n    \"teams_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/teams\",\n    \"hooks_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/hooks\",\n    \"issue_events_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/events{/number}\",\n    \"events_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/events\",\n    \"assignees_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/assignees{/user}\",\n    \"branches_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/branches{/branch}\",\n    \"tags_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/tags\",\n    \"blobs_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/git/blobs{/sha}\",\n    \"git_tags_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/git/tags{/sha}\",\n    \"git_refs_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/git/refs{/sha}\",\n    \"trees_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/git/trees{/sha}\",\n    \"statuses_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/statuses/{sha}\",\n    \"languages_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/languages\",\n    \"stargazers_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/stargazers\",\n    \"contributors_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/contributors\",\n    \"subscribers_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/subscribers\",\n    \"subscription_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/subscription\",\n    \"commits_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/commits{/sha}\",\n    \"git_commits_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/git/commits{/sha}\",\n    \"comments_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/comments{/number}\",\n    \"issue_comment_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues/comments{/number}\",\n    \"contents_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/contents/{+path}\",\n    \"compare_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/compare/{base}...{head}\",\n    \"merges_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/merges\",\n    \"archive_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/{archive_format}{/ref}\",\n    \"downloads_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/downloads\",\n    \"issues_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/issues{/number}\",\n    \"pulls_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/pulls{/number}\",\n    \"milestones_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/milestones{/number}\",\n    \"notifications_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/notifications{?since,all,participating}\",\n    \"labels_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/labels{/name}\",\n    \"releases_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/releases{/id}\",\n    \"deployments_url\": \"https://api.github.com/repos/matheusvetor/webhook-test/deployments\",\n    \"created_at\": \"2018-06-12T18:50:02Z\",\n    \"updated_at\": \"2018-06-12T18:50:05Z\",\n    \"pushed_at\": \"2018-06-12T18:50:03Z\",\n    \"git_url\": \"git://github.com/matheusvetor/webhook-test.git\",\n    \"ssh_url\": \"git@github.com:matheusvetor/webhook-test.git\",\n    \"clone_url\": \"https://github.com/matheusvetor/webhook-test.git\",\n    \"svn_url\": \"https://github.com/matheusvetor/webhook-test\",\n    \"homepage\": null,\n    \"size\": 0,\n    \"stargazers_count\": 0,\n    \"watchers_count\": 0,\n    \"language\": null,\n    \"has_issues\": true,\n    \"has_projects\": true,\n    \"has_downloads\": true,\n    \"has_wiki\": true,\n    \"has_pages\": false,\n    \"forks_count\": 0,\n    \"mirror_url\": null,\n    \"archived\": false,\n    \"open_issues_count\": 1,\n    \"license\": null,\n    \"forks\": 0,\n    \"open_issues\": 1,\n    \"watchers\": 0,\n    \"default_branch\": \"master\"\n  },\n  \"sender\": {\n    \"login\": \"matheusvetor\",\n    \"id\": 1412605,\n    \"node_id\": \"MDQ6VXNlcjE0MTI2MDU=\",\n    \"avatar_url\": \"https://avatars1.githubusercontent.com/u/1412605?v=4\",\n    \"gravatar_id\": \"\",\n    \"url\": \"https://api.github.com/users/matheusvetor\",\n    \"html_url\": \"https://github.com/matheusvetor\",\n    \"followers_url\": \"https://api.github.com/users/matheusvetor/followers\",\n    \"following_url\": \"https://api.github.com/users/matheusvetor/following{/other_user}\",\n    \"gists_url\": \"https://api.github.com/users/matheusvetor/gists{/gist_id}\",\n    \"starred_url\": \"https://api.github.com/users/matheusvetor/starred{/owner}{/repo}\",\n    \"subscriptions_url\": \"https://api.github.com/users/matheusvetor/subscriptions\",\n    \"organizations_url\": \"https://api.github.com/users/matheusvetor/orgs\",\n    \"repos_url\": \"https://api.github.com/users/matheusvetor/repos\",\n    \"events_url\": \"https://api.github.com/users/matheusvetor/events{/privacy}\",\n    \"received_events_url\": \"https://api.github.com/users/matheusvetor/received_events\",\n    \"type\": \"User\",\n    \"site_admin\": false\n  }\n}\n"
}
```

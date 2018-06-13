# README


Este projeto está hospedado no [Heroku](https://zaitt-ror-test.herokuapp.com)

Esta aplicação provê uma api para receber issues de repositório do Github através de um webhook.

## Dependências

* ruby 2.4
* postgresql (9 ou superior)

## Testes Unitários

Os testes unitários foram escritos utilizando Rspec.

Além do Rspec, foram utilizadas outras ferramentas para medir a qualidade do código:
- brakeman (Escaneia a aplicação para encontrar vulnerabilidades)
- fasterer (Sugestões de melhoria de performance)
- rubocop (Analisa o código e sugere melhorias baseadas no Style Guide da Comunidade Ruby/Rails)
- rubycritic (Analisa a complexidade do código)
- simplecov (Analiza a porcentagem de cobertura de teste do código)

Execute rake para rodar toda suite de testes
```bundle exec rake```

## Continuous Integration

Este repositório está configurado para executar os scripts de Integração Contínua a cada push.

O status da build pode ser acompanhada pelos botões a seguir:

[![Build Status](https://travisci.com/matheusvetor/zaitt-ror-test.svg?token=Kycb9pKpRxqVYpJ91Xrp&branch=master)](https://travis-ci.com/matheusvetor/zaitt-ror-test)

## Rodando a aplicação

Clone a aplicação
```git clone git@bitbucket.org:matheusvetor/zaitt-ror-test.git```

Então entre na pasta
```cd zaitt-ror-test```

O RVM irá alternar para a versão 2.4 do ruby ou informará o comando para a instalação
```rvm install ruby-2.4```

Rode o bundle para instalar as dependências do projeto
```bundle install```

Em seguida, basta executar o Servidor Web
```rails s```

## Api

Esta aplicação é uma Api Rest e possui os seguintes recursos:

## Repositories
### **GET** - /repositories/137114381/issues



```sh
curl -X GET "https://zaitt-ror-test.herokuapp.com/api/v1/repositories/137114381/issues"
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
curl -X GET "https://zaitt-ror-test.herokuapp.com/api/v1/issues/123"
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
curl -X POST "https://zaitt-ror-test.herokuapp.com/api/v1/issues" \
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

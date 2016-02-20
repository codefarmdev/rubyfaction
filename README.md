# RubyFaction

Implementação em Ruby da [API do Webfaction](https://docs.webfaction.com/xmlrpc-api/).

## Instalação

Você pode instalar no seu sistema diretamente usando o seguinte comando:

```ruby
gem install rubyfaction
```

Ou usando o Bundler adicionando a seguinte linha no seu Gemfile:

```ruby
gem 'rubyfaction'
```

Depois basta importar a biblioteca no seu script.

```ruby
require 'rubyfaction'
```

## Exemplos

### Criando um novo cliente

```ruby
wf = Rubyfaction::Client.new(
  username: "webfaction_user",
  password: "webfaction_password",
  machine: "webfaction_machine"
)
```

O parâmetro `machine` é opcional para contas com mais de uma máquina.

### Tentar novamente automaticamente em timeouts

Quando criar um cliente, você pode inserir a opção `retry_timeouts: true`
para capturar as exceptions `Timeout::Error` e `Net::ReadTimeout` e tentar
executar novamente a requisição.

```ruby
wf = Rubyfaction::Client.new(
  username: "webfaction_user",
  password: "webfaction_password",
  machine: "webfaction_machine",
  retry_timeouts: true
)
```

### Listando seus domínios

```ruby
wf.list_domains

# Retorna um array com os seus domínios
=> [{
      "domain"=>"yourdomain.com",
      "id"=>1,
      "subdomains"=>["www", "dev"]
    }]
```

### Criando um mailbox

```ruby
wf.create_mailbox(mailbox: "your_new_mailbox", enable_spam_protection: false)

# Retorna o mailbox recém-criado
=> {
     "id" => 1,
     "name" => "your_new_mailbox",
     "enable_spam_protection" => true,
     ...
   }
```

## Contribuindo

Pull requests são bem-vindas.

* Verifique o último master para ter certeza que a feature ainda não foi
implementada ou o bug corrigido.
* Verifique as issues para ter certeza que ninguém ainda reportou o erro ou
sugeriu a feature.
* Faça um fork no projeto.
* Crie uma branch feature/sua-feature ou bugfix/seu-bugfix.
* Faça seus commits até que você esteja contente com sua contribuição.
* Faça um rebase e organize seus commits.
* Escreva os testes para seu bugfix/feature.
* Mande um pull request.

## Testando

Os testes precisam que as seguintes variáveis de ambiente estejam configuradas:

* WEBFACTION_USERNAME
* WEBFACTION_PASSWORD

Você também pode criar um arquivo chamado _.env_ e adicionar as seguintes linhas:

```sh
WEBFACTION_USERNAME=webfaction_username
WEBFACTION_PASSWORD=webfaction_password
```

O .env não será incluido nos seus commits. O RSpec configurará as variáveis de
ambiente para você.

## Créditos

![codefarm](https://codefarm.com.br/img/logo2.png)

Rubyfaction é mantido por [Code Farm](https://codefarm.com.br/). Baseado
no [Rubypress](https://github.com/zachfeldman/rubypress) do
[@zachfeldman](https://github.com/zachfeldman).

## Licença

© 2016 Code Farm. Distribuido sob a GPLv2.
# Consumindo APIs com Flutter


## Status Code

Alguns dos principais status codes

### 2xx
```
    200 - OK
    201 - Created
    202 - Accepted
    204 - No content
```

### 4xx
```
    400 - Bad Request
    401 - Unauthorized
    403 - Forbidden
    404 - Not found
    405 - Method not Allowed
```

### 5xx
```
    500 - Internal Server Error
    502 - Bad Gateway
    503 - Service Unavailable
```


## Biblioteca HTTP e Conceito de Assincronismo em Flutter

### Flutter HTTP e Future

No Flutter, o acesso de dados de uma API é realizado através da biblioteca HTTP. Essa biblioteca não é nativa do Dart e precisa ser instalada.

As chamadas HTTP são realizadas de forma assíncrona, onde a aplicação não fica esperando o resultado da chamada.

Quanto temos um método que tem esse comportamento podemos fazer o uso da classe Future, que determina que esse método não terá um retorno imediato e sim um retorno futuro.

Podemos, no final da função, utilizar o comando `.then`, que será executado após o término da requisição.

Podemos também, ao invés da utilização do `.then`, utilizar a palavra reservada `async` na assinatura da função, e quando desejarmos que o programa aguarde o retorno da função assíncrona, utilizamos a palavra reservada `await` em sua chamada. 


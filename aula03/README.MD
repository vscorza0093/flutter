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


## Bibliotecas HTTP e Conceito de Assincronismo em Flutter

### Flutter HTTP e Future

No Flutter, o acesso de dados de uma API é realizado através da biblioteca HTTP. Essa biblioteca não é nativa do Dart e precisa ser instalada.

As chamadas HTTP são realizadas de forma assíncrona, onde a aplicação não fica esperando o resultado da chamada.

Quando temos um método que tem esse comportamento podemos fazer o uso da classe Future, que determina que esse método não terá um retorno imediato e sim um retorno futuro.

Podemos, no final da função, utilizar o comando `.then`, que será executado após o término da requisição.

Podemos também, ao invés da utilização do `.then`, utilizar a palavra reservada `async` na assinatura da função, e quando desejarmos que o programa aguarde o retorno da função assíncrona, utilizamos a palavra reservada `await` em sua chamada. 

Através de classes `models` (que serão as classes bases para criação de novos itens) e classes `repositories` (classes que servem como fábrica para instanciar diversas `models`), podemos manipular dados para exibí-los na tela.

Podemos utilizar ferramentas como `json to dart`[1] para gerar a nossa classe `model`, já com os parâmetros e métodos necessários para sua utilização.

Na classe `repository` faremos um `get` para recuperar o body através de API, caso o status code seja igual a 200, tratar esse body para transformá-lo em json utilizando `jsonDecode` e retornar esse json, em formato de lista, utilizando `.map` para fazer toda a iteração com todos os itens existentes

```dart
class CommentsRepository {
  Future<List<CommentModel>> getComments(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
```

Importante ressaltar que a exibição desse conteúdo deverá ser feito com `ListView.builder()`, determinando um `itemCount` máximo igual ao tamanho da lista que será criada, para que o dispositivo saiba como receber essa informação sem quebrar as margens, já o `itemBuilder` é a função que nos ajudará a controlar o índice de cada item da lista, para que possamos acessar esses itens individualmente.

```dart
body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (_, index) {
            var post = postList[index];
            return Container()
          }
)
```

### Biblioteca Dio

Outro pacote de chamadas HTTP em Flutter é o Dio. É um pacote muito bem visto pela comunidade do Flutter.

Não é um pacote criado pela equipe do Flutter, porém é um pacote de simples utilização.

Tem suporte para `Interceptors`, `Global configuration`, `FormData`, `Request Cancellation`, `File downloading`, `Timeout` e muitos outros serviços.

Sua instalação é feita na dependencies, passando `dio: ^version`

Possui um tratamento padrão na utilização do método get, onde toda requisição entra em um bloco `try, catch` e qualquer status code diferente de 200 cairá no catch, printando a exceção lançada.

alguns exemplos de utilização
```dart
var dio = Dio();

// Post Request
response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});

// Multiple concurrent request
response = await Future.wait([dio.post('/info'), dio.get('/token')]);

// Downloading a file:
response = await dio.download('https://www.googe.com/', './abc.html');
```

Existem outros para uploading, stream, bytes, FormData e muitas outras opções.

Também podemos aplicar opções de url base, timeout de conexão e timeout de recebimento no momento de instanciar nosso objeto.


### Dotenv

Dotenv é um pacote muito conhecido no meio do desenvolvimento, que nos possibilita criar variáveis dentro de arquivos e usar essas variáveis dentro de nossa aplicação, funcionam como variáveis de ambiente.

Usado principalmente para definir informações que podem mudar dependendo do ambiente usado: QA, PROD, DEV, por exemplo.

Também é usado para evitar subir informações de chaves e senhas nos controles de versão.

Isso possibilita que, num ambiente com muitos desenvolvedores, cada desenvolvedor acesse o projeto com sua chave individual.



## APIs autenticadas em Flutter

### Autenticação e autorização

A autorização e a autenticação se referem a parte de segurança, não só de APIs como páginas web.

A autenticação diz respeito ao usuário ter as credencias para logar nquela aplicação. Quando a autenticação é inválida, é retornado o código 401 'Unathorized'

A autorização diz respeito se o usuário em questão tem autorização para acessar determinado recurso. Quando o usuário não possui permissão, é retornado o código 403 'Forbiden'.


### APIs autenticadas

APIs podem ser autenticadas ou abertas, uma API aberta é aquela que não exige um código para fazer requisições, ela é pública para ser acessada, por exemplo a ViaCEP e Json Place Holder, que foram APIs utilizadas durante o curso.

Seguindo na utilizaçã de APIs no curso, começaremos a utilizar a API da Marvel, que é uma API autenticada.




Bibliografia

[1] json to dart - https://javiercbk.github.io/json_to_dart/
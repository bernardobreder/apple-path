# Introdução

O componente Path tem o objetivo de representar um caminho ou de um arquivo ou de uma chave composta de um mapa. Seu propósito é gerenciar um caminho de String e poder com facilidade navegar pelos pais.

# Exemplo

Todos os exemplos abaixo cria uma instancia de Path com o mesmo conteúdo.

```swift
let path1 = Path(["a", "b"], "c")
let path2 = Path("a", "b", "c")
let path3 = Path(["a", "b", "c"])
```

# Regras 

* Cada item do caminho passar por um processo de validação retirando os caracteres que não são letras e dígitos. Isso é para impedir que seja posto caracteres não desejados inferindo no comportamento do componente. Por exemplo:

```swift
Path("my_dog", "your dog") == Path("mydog", "yourdog")
```

# Api

## Construtor

* Constrói o componente tendo os pais e o nome do arquivo

```swift
init(_ parents: [String], _ name: String)
```

* Constrói o componente tendo o caminho completo
 
```swift
init?(_ paths: [String])
```

## Campos

* Campo que retorna o componente pai

```swift
let parentPath: Path? 
```

* Retorna todos os pais

```swift
let parents: [String] 
```

* Retorna todos os nomes dos componentes 

```swift
let paths: [String]
```

* Retorna o caminho completo

```swift
let path: String 
```

## Protocolo Hashable

```swift
var hashValue: Int
func ==(lhs: Path, rhs: Path) -> Bool
```

## Protocolo Comparable

```swift
func <(lhs: Path, rhs: Path) -> Bool
```

## Protocolo CustomStringConvertible

```swift
var description: String
var debugDescription: String
```



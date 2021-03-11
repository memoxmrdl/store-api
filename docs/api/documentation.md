FORMAT: 1A
HOST: http://store-api.com/

# Store API

Esta es la documentación de la API de Store.

# Autenticación

Para podernos conectar con autorización es necesario utilizar de una cabecera *Authorization* que ira en la petición realizada a la API.

Ejemplo:

```
$ curl https://store.io/articles \
    -H "Authorization: Token token=your-api-key" \
    -H "Accept: application/vnd.store+json" \
    -H "Content-Type: application/json"
```

# Cabeceras especiales

Es necesario especificar algunas cabeceras para poder realizar el consumo de la API, por ejemplo:

1. Authorization

        Authorization: Token token=your-api-key

2. Accept (especificando que versión deseas utilizar)

        Accept: application/vnd.creditar.v1+json

3. Content-Type (peticiones diferentes a GET)

        Content-Type: application/json


## Group Articulos

Es el recurso de Articulos

## Articulos [/articles{?cursor}{?filter_by}]

Es el recurso para el listado de Articulos

### Listar Articulos [GET]

Este este endpoint nos regresa el listado de Articulos.

+ Parameters
      + cursor: `10` (number, optional) - Cursor es un parametro para paginación.
      + filter_by: `article[name]=Buddy Toy` (string, optional) - Cursor es un parametro para filtrar.

+ Request (application/json)

    + Headers

            Accept: application/vnd.store-api+json
            Authorization: Token token=BMBE96Wva8NaYMmVx4RavpXSy6Y6HKFe

+ Response 200 (application/json)

       + Attributes (array[Article, Article]) 

# Data Structures

## Article (object)

+ id: 2 (number, required) - Es el ID del Articulo.
+ name: `Iron Man Toy Marvel` (string, required) - Es el nombre del Articulo.
+ amount_cents: 120000 (number, required) - Es el precio del Articulo en centavos.
+ created_at: `2018-05-02` (string, required) - Fecha de Creación del Articulo.
+ updated_at: `2018-05-02` (string, required) - Última modificación del Articulo.

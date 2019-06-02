# README

## 1. Contexto
La presente aplicación, desarrollada en Ruby on Rails y denominada "Collections", corresponde al proyecto final del curso Full Stack, generación XVI, de la academia Desafío Latam.

El desarrollo del proyecto, desde su fase de idea hasta la presente versión comenzó a ser trabajada el día 17 de marzo de 2019. Se presentó públicamente una versión preliminar el 6 de mayo de 2019, mientras que la versión actual tiene fecha de 2 de junio de 2019.

La presente versión incorpora prácticamente todas las funcionalidades requeridas en los desafíos que hicieron explícita referencia al proyecto final (en general, hubo dos desafíos cada semana, desde la semana 18 hasta la semana 30, con algunas salvedades). Sólo hubo una funcionalidad que no se implementó, que corresponde a los testing.

Vale mencionarse además, que, si bien la evaluación del Proyecto Final contó con una pauta explicativa, se optó por no seguir los linemiento de dicha pauta de manera directa. Ello debido a que sus directrices no se condijeron necesariamente con el desarrollo de los desafíos y, no pocas veces, sus indicaciones terminaron provocando confusión.

Por motivos ajenos al desarrollo del curso, el avance en el Proyecto Final no se correspondió con el ritmo semanal en que se presentaron los desafíos, sino que hubo un constante desfase, cuyo origen se remontó a las semana 13 del curso. No por ello, sin embargo, se dejó de superar cada uno de los desafíos de manera estrictamente cronológica.

Ésta probablemente sea la última versión de la aplicación cuyo desarrollo quede registrado de manera sistemática. Lo cual, ciertamente, no quiere decir que su desarrollo no prosiga en el futuro.


## 2. Descripción de la aplicación:
#### Idea de Proyecto
(actualizado el 11 de abril de 2019)
La idea de proyecto final que propongo consiste en un sitio web en cual un usuario pueda ir registrando las actividades y/o metas que realiza, de manera de llevar un registro de aquello que ha experimentado durante su vida. Tales actividades dicen relación preferentemente con actividades propias de lo que comúnmente es denominado ocio, en un rango de alternativas que incluyen: ver películas, realizar algún deporte o viajar a algún país remoto, entre múltiples otras posibilidades. De ese modo, al visibilizar las acciones desarrolladas fuera del ámbito productivo, con este sitio lo que se busca es articular y enaltecer una senda de vida en la cual, por sobre los productos que podamos sintetizar –cuyos registros se traducen típicamente un currículum vitae–, preponderen aquellas acciones que hemos vivido y disfrutado.

El sitio web que se propone si bien busca proporcionar un beneficio dentro de lo que es la esfera personal de cada usuario, también aspira a contribuir interpersonalmente a partir de la visibilización de las acciones llevadas a cabo por otros. Así, conociendo las actividades desarrolladas por otras personas se espera que alguien pueda ponderar de mejor manera la calidad de sus propias acciones y, por lo tanto, intentar emular aquellos sucesos que otros realizan.

Ligado a lo anterior, y como manera de facilitar la organización de las propias actividades desarrolladas, el sitio web de manera activa catalogará las distintas actividades a ejecutar. Así, se presentarán distintas categorías, tales como viajes, trekking, deportes, lecturas, entre otras, dentro de las cuales un usuario podría catalogar su experiencia. Asimismo, el sitio web exhibirá diversas series de actividades a realizar, las cuales estarán estructuradas en torno a un motivo o tema en común; a saber, por un dar un ejemplo, recorrer rutas de montaña en la zona norte de Chile. Con ello, se busca que los usuarios aspiren a realizar no una actividad sino que series de actividades y, a su vez, puedan proponer nuevas series que ellos mismo podrán realizar o ser experimentadas por otros.

#### Tablero Trello
El tablero ágil en Trello se encuentra en: https://trello.com/b/1MhorCs0/proyecto-final-dl

Vale mencionar que el tablero ágil de Trello no se utilizó para el desarrollo de la aplicación. Para una instancia de aprendizaje y de trabajo individual, el tablero tablero ágil no pareció ser un aporte. Por lo tanto, éste fue elaborado sólo con el objeto de cumplir lo que se solicitó.

De cualquier modo, vale decir que entre las tareas incluidas en el tablero ágil únicamente no se implementó la referida a la posibilidad de definir el nivel de privacidad por parte de cada usuario.

#### Modelo Físico
El modelo físico del proyecto se puede revisar en el siguiente enlace:
https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1#G1D_ex3tVyxt4DwaKidVhGZXMzXg7wdAjy

Técnicamente, no es un modelo físico acabado, pues no incluye el tipo de dato. No obstante, incluye las relaciones existentes, de lo cuales factible inferir las claves prinicipales y fóraneas.

Además, Dentro del diagrama, las tablas marcadas en rojo no se implementaron


## 2. Correr la apliación
### Servidor Local
Para correr en el servidor local se debe realizar lo siguiente:

1 Descargar repositorio en github, ubicado en: https://github.com/josereyessaldias/ejercicio_60

2 Escribir las correspondiente variables de entorno para AWS, PAYPAL y FACEBOOK.

3 En la carpeta del proyecto, correr 'yarn install'

4 Correr 'rails db:migrate'

5 Correr 'rails db:seed'

### Heroku
En Heroku se encuentra una versión en el siguiente enlace: https://ejercicio60.herokuapp.com

Es posible crear un usuario para utilizar la aplicación o utilizar uno ya existente por medio de facebook.

Video demostrativo: https://youtu.be/Ht3_0C7DrBU

### Seed
El seed cuenta con los siguientes datos:

User: 4 usuarios

Activity: 52 actividades

Category: 3 categorías

Collection: 4 colecciones

ActivityCollection: 32 asociaciones

AdminUser: 1 administrador

### Versiones, Gemas y Yarns
La aplicación fue desarrollada en Ruby 2.5.1 y en Rails 5.2.3

Se instalaron las siguientes gemas:

gem 'fog-aws'

gem 'carrierwave'

gem 'mini_magick'

gem 'paypal-sdk-rest'

gem 'geocoder'

gem 'gmaps4rails'

gem 'sqlite3', '~> 1.3.6', group: :development

gem 'pg', group: :production

gem 'devise', git: 'https://github.com/plataformatec/devise.git'

gem 'omniauth-facebook'

gem 'cancancan'

gem 'activeadmin'

gem 'chartkick'

gem 'groupdate'

gem 'bullet', group: 'development'


Se instalaron los siguientes yarns

underscore

bootstrap4-datetimepicker

fullcalendar

jquery-backstretch

moment


Todas las gemas y yarns están en uso.

### Panel de Administración
Para ingresar al panel de administración, tanto en Servidor Local como en Heroku, se debe ingresar en la url después del dominio el texto "/admin"

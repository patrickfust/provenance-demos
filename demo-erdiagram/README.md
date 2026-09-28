# Demo of Provenance

## ER diagram

This will we overriden when generating documentation using the Maven task.

```shell
mvn provenance:generate
```

### Mermaid
[//]: #MODEL_MERMAID_PLACEHOLDER_START ()
```mermaid
---
title: My database
---
erDiagram
    classDef externalRef stroke-dasharray: 1 1;
    table_b ||--o{ table_a : ""
table_a {
    INT field_a FK
}
table_b {
    INT field_b
}
table_in_group {
    INT field_b
}

```
[//]: #MODEL_MERMAID_PLACEHOLDER_END ()

#### Only a specific group
[//]: #MODEL_MERMAID_GROUP_PLACEHOLDER_START ()
```mermaid
---
title: My database
---
erDiagram
    classDef externalRef stroke-dasharray: 1 1;
table_in_group {
    INT field_b
}

```
[//]: #MODEL_MERMAID_GROUP_PLACEHOLDER_END ()

#### With external tables
[//]: #MODEL_MERMAID_EXTERNAL_PLACEHOLDER_START ()
```mermaid
---
title: My database
---
erDiagram
    classDef externalRef stroke-dasharray: 1 1;
    table_b ||--o{ table_a : ""
table_a {
    INT field_a FK
}
    external_table ||--o{ table_b : ""
    class external_table externalRef
table_b {
    INT field_b FK
}
table_in_group {
    INT field_b
}

```
[//]: #MODEL_MERMAID_EXTERNAL_PLACEHOLDER_END ()


### Plantuml
[//]: #MODEL_PLANTUML_PLACEHOLDER_START ()
```plantuml
@startuml

!theme plain
hide empty methods

!procedure $schema($name)
    package "$name" <<Rectangle>>
!endprocedure
!procedure $table($name)
    entity "<b>$name</b>" as $name << (T, Orange) table >>
!endprocedure
!procedure $view($name)
    entity "<b>$name</b>" as $name << (V, Aquamarine) view >>
!endprocedure
!procedure $pk($name)
    <color:#GoldenRod><&key></color> <b>$name</b>
!endprocedure
!procedure $fk($name)
    <color:#Silver><&key></color> $name
!endprocedure
!procedure $column($name)
   {field} <color:#White><&media-record></color> $name
!endprocedure
title "My database"
$schema("theSchema") {
  $table("table_a") {
    $fk("field_a"): int
  }
  $table("table_b") {
    $column("field_b"): int
  }
  $table("table_in_group") {
    $column("field_b"): int
  }
}
theSchema.table_b::field_b ||--o{ theSchema.table_a::field_a
@enduml
```
[//]: #MODEL_PLANTUML_PLACEHOLDER_END ()

#### With external tables
[//]: #MODEL_PLANTUML_EXTERNAL_PLACEHOLDER_START ()
```plantuml
@startuml

!theme plain
hide empty methods

!procedure $schema($name)
    package "$name" <<Rectangle>>
!endprocedure
!procedure $table($name)
    entity "<b>$name</b>" as $name << (T, Orange) table >>
!endprocedure
!procedure $view($name)
    entity "<b>$name</b>" as $name << (V, Aquamarine) view >>
!endprocedure
!procedure $pk($name)
    <color:#GoldenRod><&key></color> <b>$name</b>
!endprocedure
!procedure $fk($name)
    <color:#Silver><&key></color> $name
!endprocedure
!procedure $column($name)
   {field} <color:#White><&media-record></color> $name
!endprocedure
title "My database"
$schema("theSchema") {
  $table("table_a") {
    $fk("field_a"): int
  }
  $table("table_b") {
    $fk("field_b"): int
  }
  $table("table_in_group") {
    $column("field_b"): int
  }
}
theSchema.table_b::field_b ||--o{ theSchema.table_a::field_a
theSchema.external_table::code ||--o{ theSchema.table_b::field_b
@enduml
```
[//]: #MODEL_PLANTUML_EXTERNAL_PLACEHOLDER_END ()

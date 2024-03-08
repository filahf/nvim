;; extends
"export" @keyword.export
"import" @keyword.import

[
 (undefined)
 (null)
 (false)
] @constant.falsy

(import_clause 
  [
    (identifier) @import.identifier
    (named_imports (import_specifier 
      [
        name: (identifier) @import.identifier
        alias: (identifier) @import.identifier
      ]
    ))
    (namespace_import (identifier) @import.identifier)
  ]
)

; Types

(type_identifier) @type
(predefined_type) @type.builtin

((identifier) @type
 (#match? @type "^[A-Z]"))

(type_arguments
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

; Variables

(required_parameter (identifier) @variable.parameter)
(optional_parameter (identifier) @variable.parameter)

; Keywords

[ "abstract"
  "declare"
  "enum"
  "export"
  "implements"
  "interface"
  "keyof"
  "namespace"
  "private"
  "protected"
  "public"
  "type"
  "readonly"
  "override"
  "satisfies"
] @keyword

; Sub-language delimeters
(glimmer_opening_tag) @tag.builtin
(glimmer_closing_tag) @tag.builtin

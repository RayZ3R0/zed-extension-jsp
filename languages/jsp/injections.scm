; Inject Java into JSP scriptlets
(jsp_scriptlet
  "<%" @_open
  (_) @content
  "%>" @_close
  (#set! language "java")
)

; Inject Java into JSP expressions
(jsp_expression
  "<%=" @_open
  (_) @content
  "%>" @_close
  (#set! language "java")
)

; Inject Java into JSP declarations
(jsp_declaration
  "<%!" @_open
  (_) @content
  "%>" @_close
  (#set! language "java")
)

; Match script tags with a language attribute (for client-side scripts)
(script_element
  (start_tag
    (attribute
      (attribute_name) @_attr_name
      (#eq? @_attr_name "language")
      (quoted_attribute_value
        (attribute_value) @language
      )
    )
  )
  (raw_text) @content
)

; Match script tags without a language attribute as JavaScript
(script_element
  (start_tag
    (attribute
      (attribute_name) @_attr_name
    )*
  )
  (raw_text) @content
  (#not-any-of? @_attr_name "language")
  (#set! language "javascript")
)

; Match style tags with a language attribute
(style_element
  (start_tag
    (attribute
      (attribute_name) @_attr_name
      (#eq? @_attr_name "type")
      (quoted_attribute_value
        (attribute_value) @language
      )
    )
  )
  (raw_text) @content
)

; Match style tags without a language attribute as CSS
(style_element
  (start_tag
    (attribute
      (attribute_name) @_attr_name
    )*
  )
  (raw_text) @content
  (#not-any-of? @_attr_name "type")
  (#set! language "css")
)

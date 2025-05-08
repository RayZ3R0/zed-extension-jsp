; JSP comments
(jsp_comment) @comment
(html_comment) @comment

; HTML property attributes
(attribute_directive) @attribute.function
(attribute_identifier) @attribute
(attribute_modifier) @attribute.special

; JSP directives
(jsp_directive
  directive: _ @keyword
  (attribute
    (attribute_name) @attribute
    (quoted_attribute_value
      (attribute_value) @string)))

; JSP scriptlets (Java code)
(jsp_scriptlet) @embedded

; JSP expressions
(jsp_expression) @embedded

; JSP declarations
(jsp_declaration) @embedded

; JSTL tags and custom tags
; Style JSTL elements as special tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^c:")
  )
) @tag.special

(start_tag
  (tag_name) @_tag_name
  (#match? @_tag_name "^c:")
) @tag.special

; Style JSP elements as special tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^jsp:")
  )
) @tag.special

(start_tag
  (tag_name) @_tag_name
  (#match? @_tag_name "^jsp:")
) @tag.special

; Style custom tag elements
(start_tag
  (
    (tag_name) @_tag_name
    (#match? @_tag_name "^[A-Z]")
  )
  (attribute
    (attribute_name
      (attribute_identifier) @tag.property
    )
  )
)

; Style self-closing custom tag elements
(self_closing_tag
  (
    (tag_name) @_tag_name
    (#match? @_tag_name "^[A-Z]")
  )
  (attribute
    (attribute_name
      (attribute_identifier) @tag.property
    )
  )
)

; Style elements starting with lowercase letters as tags
(
  (tag_name) @tag
  (#match? @tag "^[a-z]")
)

; style elements starting with uppercase letters as components (types)
(
  (tag_name) @tag @tag.component.type.constructor
  (#match? @tag "^[A-Z]")
)

; Additional JSP syntax highlighting
(jsp_scriptlet
  "<%"  @punctuation.special
  "%>" @punctuation.special
)

(jsp_expression
  "<%=" @punctuation.special
  "%>" @punctuation.special
)

(jsp_declaration
  "<%!" @punctuation.special
  "%>" @punctuation.special
)

(jsp_directive
  "<%@" @punctuation.special
  "%>" @punctuation.special
)

(jsp_comment
  "<%--" @comment
  "--%>" @comment
)

; HTML brackets
[
  "<"
  ">"
  "</"
  "/>"
] @tag.punctuation.bracket

; General brackets
[
  "{"
  "}"
] @punctuation.bracket

[
  "|"
] @punctuation.delimiter

; HTML attributes
[
  "@"
  "#"
  ":"
  "/"
] @tag.punctuation.special

"=" @operator

; Style quoted string attribute values
(quoted_attribute_value) @string

; JSTL keywords
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^c:")
  )
  (attribute
    (attribute_name) @keyword)
)

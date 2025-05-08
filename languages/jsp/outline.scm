; JSP outline for the script element
(script_element
  (start_tag) @name
  (raw_text) @context @item
)

(script_element
  (end_tag) @name @item
)

; JSP outline for the style element
(style_element
  (start_tag) @name
  (raw_text) @context
) @item

; JSP scriptlets
(jsp_scriptlet
  "<%" @name
  (_) @context
) @item

; JSP expressions
(jsp_expression
  "<%=" @name
  (_) @context
) @item

; JSP declarations
(jsp_declaration
  "<%!" @name
  (_) @context
) @item

; JSP directives
(jsp_directive
  "<%@" @name
  directive: _ @name
) @item

; JSP comments
(jsp_comment) @annotation

; HTML comments
(html_comment) @annotation

; HTML document
(document) @item

; HTML elements
(element
  (start_tag) @name
) @item

(element
  (self_closing_tag) @name
) @item

; JSTL tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^c:")
  )
  (attribute
    (attribute_name) @name
  )
) @item

; JSP custom tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^jsp:")
  )
  (attribute
    (attribute_name) @name
  )
) @item

; HTML tag
(html_tag) @name @item

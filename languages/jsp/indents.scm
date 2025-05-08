[
  (element)
  (jsp_scriptlet)
  (jsp_expression)
  (jsp_declaration)
  (jsp_directive)
  (script_element)
  (style_element)
  (start_tag ">" @end)
  (self_closing_tag "/>" @end)
  (element
    (start_tag) @start
    [(end_tag) (erroneous_end_tag)]? @end)
] @indent

; Additional indentation for JSP scriptlet blocks
(jsp_scriptlet
  "<%" @start
  "%>" @end) @indent

(jsp_expression
  "<%=" @start
  "%>" @end) @indent

(jsp_declaration
  "<%!" @start
  "%>" @end) @indent

(jsp_directive
  "<%@" @start
  "%>" @end) @indent

; Comments
(jsp_comment) @comment.inclusive
(html_comment) @comment.inclusive

; Strings
[
  (raw_text)
  (attribute_value)
  (quoted_attribute_value)
] @string

; JSP scriptlets - mark them for Java injection
(jsp_scriptlet) @jsp_scriptlet
(jsp_expression) @jsp_scriptlet
(jsp_declaration) @jsp_scriptlet

; HTML/XML sections - keep as HTML
(element) @html
(start_tag) @html
(end_tag) @html
(self_closing_tag) @html

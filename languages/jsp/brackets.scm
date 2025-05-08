("<" @open ">" @close)
("{" @open "}" @close)
("'" @open "'" @close)
("\"" @open "\"" @close)
("(" @open ")" @close)
("[" @open "]" @close)
("`" @open "`" @close)

; JSP specific brackets
("<%" @open "%>" @close)
("<%=" @open "%>" @close)
("<%!" @open "%>" @close)
("<%@" @open "%>" @close)
("<jsp:" @open "/>" @close)
("<jsp:" @open "</jsp:" @close)
("<c:" @open "/>" @close)
("<c:" @open "</c:" @close)

; For HTML elements
((element (start_tag) @open [(end_tag) (erroneous_end_tag)] @close) (#set! newline.only))

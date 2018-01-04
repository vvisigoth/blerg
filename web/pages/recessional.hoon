::::  /hoon/recessional/web
::
/-  entry
/=  gas  /$  fuel:html
/=  entries  /:  /===/web/recessional
             /^  (map knot manx)  /_  /&elem&/md/
::
/=  ents  /:  /===/web/recessional
             /^  (map knot entry)  /_  /blerg-entry/
::
=/  page/@ud
  =/  a  (~(get by qix.gas) %page)
  ?~  a  0
  :: this can be better handled with bind?
  (need (slaw %ud (need a)))
=/  page-size  5
=/  paginate
  |=  [a=(map knot entry) c=@ud]
  ^-  (list [@t entry])
  =/  b  ~(tap by a)
  ?:  (lte (lent b) page-size)
    b
  %+  swag
    [(mul c page-size) page-size] 
  b
::
^-  manx
;html
  ;head
  ;title: Recessional
  ;link(type "text/css", rel "stylesheet", href "https://urbit.github.io/base-css/base.css");
  ==
  ;body
    ;div.container
      ;div
        ;h1: Recessional
        ;*  %+  turn  
              (paginate ents page)
            |=  [a=@t b=entry] 
            ;div(class "entry row mb-20")
              ;div.col-md-6
                ;div(class "datestamp mt-24"): {(trip a)}
              ==
              ;div.col-md-6
                +{body.b}
              ==
            ==
        ;*  ?:  (gth (lent ~(tap by entries)) page-size)
              ;=
                ;div#page-nav.row
                  ;div.col-md-offset-6
                    ;*  ?:  (gth page 0)
                      ;=
                        ;button(class "btn-sm btn-tetiary")
                          ;a(href "{(trip -:s.bem.gas)}?page={(scow %ud (sub 1 page))}")
                            Prev
                          ==
                        ==
                      ==
                    ;=
                      ;button(class "btn-sm")
                        Prev
                      ==
                    ==
                    ;button(class "btn-sm btn-tetiary")
                      ;a(href "{(trip -:s.bem.gas)}?page={(scow %ud (add page 1))}")
                        Next
                      ==
                    ==
                  ==
                ==
              ==
            ~
      ==
    ==
  ==
==

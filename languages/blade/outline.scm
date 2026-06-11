;; ============================================================
;; Blade Sections — show section name from parameter
;; ============================================================

(section
  (directive_start) @_start
  (parameter) @name
  (#gsub! @name "^['\"](.+)['\"]$" "%1"))
(section) @item

;; Section with inline value: @section('title', 'Default')
(section
  (directive) @name)
(section) @item

;; ============================================================
;; Blade Conditionals — show @if, @auth, @can etc.
;; ============================================================

(conditional
  (directive_start) @name)
(conditional) @item

;; ============================================================
;; Blade Loops — show @foreach, @for, @forelse, @while
;; ============================================================

(loop
  (directive_start) @name)
(loop) @item

;; ============================================================
;; Blade Switch
;; ============================================================

(switch
  (directive_start) @name)
(switch) @item

;; ============================================================
;; Blade Stacks — @push, @pushOnce, @pushIf, @prepend, @prependOnce
;; ============================================================

(stack
  (directive_start) @_start
  (parameter) @name
  (#gsub! @name "^['\"](.+)['\"]$" "%1"))
(stack) @item

;; ============================================================
;; Blade Once, Fragment, Verbatim
;; ============================================================

(once
  (directive_start) @name)
(once) @item

(fragment
  (directive_start) @name)
(fragment) @item

(verbatim
  (directive_start) @name)
(verbatim) @item

;; ============================================================
;; PHP Blocks — @php ... @endphp
;; ============================================================

(php_statement
  (directive_start) @name
  (php_only)) @item

;; ============================================================
;; Envoy Blocks
;; ============================================================

(envoy
  (directive_start) @name)
(envoy) @item

;; ============================================================
;; Livewire Blocks
;; ============================================================

(livewire
  (directive_start) @name)
(livewire) @item

;; ============================================================
;; HTML Elements
;; ============================================================

(element
  (start_tag
    (tag_name) @name)) @item

(script_element
  (start_tag
    (tag_name) @name)) @item

(style_element
  (start_tag
    (tag_name) @name)) @item

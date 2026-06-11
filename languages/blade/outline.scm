;; ============================================================
;; Blade Sections — show section name from parameter
;; ============================================================

;; Block section: @section('sidebar') ... @endsection
(section
  (directive_start) @_start
  (parameter) @name
  (#gsub! @name "^['\"](.+)['\"]$" "%1")) @item

;; Inline section: @section('title', 'Default')
(section
  (directive) @_directive
  (parameter) @name
  (#gsub! @name "^['\"](.+)['\"]$" "%1")) @item

;; ============================================================
;; Blade Conditionals — show @if, @auth, @can etc.
;; ============================================================

(conditional
  (directive_start) @name) @item

;; ============================================================
;; Blade Loops — show @foreach, @for, @forelse, @while
;; ============================================================

(loop
  (directive_start) @name) @item

;; ============================================================
;; Blade Switch
;; ============================================================

(switch
  (directive_start) @name) @item

;; ============================================================
;; Blade Stacks — @push, @pushOnce, @pushIf, @prepend, @prependOnce
;; ============================================================

(stack
  (directive_start) @_start
  (parameter) @name
  (#gsub! @name "^['\"](.+)['\"]$" "%1")) @item

;; ============================================================
;; Blade Once, Fragment, Verbatim
;; ============================================================

(once
  (directive_start) @name) @item

(fragment
  (directive_start) @name) @item

(verbatim
  (directive_start) @name) @item

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
  (directive_start) @name) @item

;; ============================================================
;; Livewire Blocks
;; ============================================================

(livewire
  (directive_start) @name) @item

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

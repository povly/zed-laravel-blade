;; ============================================================
;; Blade Block Directives — fold entire block
;; ============================================================

(conditional) @fold
(loop) @fold
(switch) @fold
(section) @fold
(stack) @fold
(once) @fold
(fragment) @fold
(verbatim) @fold

;; @php ... @endphp blocks
(php_statement
  (directive_start)
  (directive_end)) @fold

;; Envoy blocks
(envoy) @fold

;; Livewire blocks
(livewire) @fold

;; ============================================================
;; HTML Elements
;; ============================================================

(element
  (start_tag)
  (end_tag)) @fold

(script_element
  (start_tag)
  (raw_text)
  (end_tag)) @fold

(style_element
  (start_tag)
  (raw_text)
  (end_tag)) @fold

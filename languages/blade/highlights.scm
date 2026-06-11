;; ============================================================
;; Catch-all: Inline Directives (lowest priority)
;; @include @includeIf @includeWhen @includeUnless @includeFirst
;; @extends @yield @method @inject @each @vite @livewire
;; @aware @servers @import @js @svg @props @use @stack
;; @asset @json @script @thumbnail @extract @set
;; @wireUiScripts (with params)
;; + any custom directives matching @[a-zA-Z]+
;;
;; NOTE: This must come BEFORE all specific directive rules.
;; Tree-sitter gives later patterns higher priority, so
;; specific rules below will override this catch-all.
;; ============================================================

(directive) @function.call

;; ============================================================
;; HTML
;; ============================================================

(tag_name) @tag
(doctype) @tag.doctype
(attribute_name) @attribute
(entity) @string.special

[
  "\""
  "'"
  (attribute_value)
] @string

(comment) @comment

"=" @punctuation.delimiter

[
  "<"
  ">"
  "<!"
  "</"
  "/>"
] @punctuation.bracket

;; ============================================================
;; Blade Keywords — standalone, no parameters
;; @csrf @parent @inertia @inertiaHead @viteReactRefresh
;; @livewireStyles @livewireScripts @livewireScriptConfig
;; @routes @permalink @title @content @excerpt @wireUiScripts
;;
;; (keyword) wraps a single (directive) child — we capture
;; the inner directive so this later pattern overrides the
;; catch-all above.
;; ============================================================

(keyword
  (directive) @constant)

;; ============================================================
;; Conditionals — open/close
;; @if @unless @isset @empty @auth @guest @production @env
;; @can @cannot @canany @feature @hasSection @sectionMissing
;; @error + custom @if-like directives
;; ============================================================

(conditional
  (directive_start) @keyword)
(conditional
  (directive_end) @keyword)

;; Conditional mid-keywords: @else @elseif @elseauth @elseguest etc.
(conditional
  (conditional_keyword
    (directive) @keyword))

;; ============================================================
;; Loops — open/close + inner operators
;; @for @foreach @forelse @while
;; @continue @break @empty (inside @forelse)
;; ============================================================

(loop
  (directive_start) @keyword)
(loop
  (directive_end) @keyword)
(loop
  (directive) @keyword)

;; ============================================================
;; Switch — @switch @case @break @default @endswitch
;; ============================================================

(switch
  (directive_start) @keyword)
(switch
  (directive_end) @keyword)
(switch
  (directive) @keyword)

;; ============================================================
;; Sections — @section (block & inline) @endsection @show
;; ============================================================

(section
  (directive_start) @function.method)
(section
  (directive_end) @function.method)
(section
  (directive) @function.method)

;; ============================================================
;; Stacks — @push @pushOnce @pushIf @prepend @prependOnce
;;          @endpush @endPushOnce @endPushIf @endprepend @endPrependOnce
;; ============================================================

(stack
  (directive_start) @function.method)
(stack
  (directive_end) @function.method)

;; ============================================================
;; @once @endonce
;; ============================================================

(once
  (directive_start) @function.method)
(once
  (directive_end) @function.method)

;; ============================================================
;; @fragment @endfragment
;; ============================================================

(fragment
  (directive_start) @function.method)
(fragment
  (directive_end) @function.method)

;; ============================================================
;; @verbatim @endverbatim
;; ============================================================

(verbatim
  (directive_start) @function.method)
(verbatim
  (directive_end) @function.method)

;; ============================================================
;; Envoy — @task @story @before @after @error @success @finished
;;         + notification directives: @slack @discord @telegram @microsoftTeams
;; ============================================================

(envoy
  (directive_start) @function.macro)
(envoy
  (directive_end) @function.macro)
(envoy
  (directive) @function.macro)

;; ============================================================
;; Livewire — @persist @teleport @volt @script @assets
;; ============================================================

(livewire
  (directive_start) @function.macro)
(livewire
  (directive_end) @function.macro)

;; ============================================================
;; PHP Statements — {{ }} {!! !!} @php() @php..@endphp @setup..@endsetup <?php ?>
;; ============================================================

(php_statement
  (directive) @function.macro)
(php_statement
  (directive_start) @function.macro)
(php_statement
  (directive_end) @function.macro)

(php_tag) @punctuation.bracket
(php_end_tag) @punctuation.bracket

;; ============================================================
;; Blade Attribute Directives — @class @style @checked @selected
;;                              @disabled @readonly @required
;; ============================================================

(attribute
  (directive) @attribute)

;; ============================================================
;; Parameters (inside directive parentheses)
;; ============================================================

(parameter) @variable.parameter

;; ============================================================
;; Punctuation — echo brackets, parentheses
;; ============================================================

[
  "{{"
  "}}"
  "{!!"
  "!!}"
  "("
  ")"
] @punctuation.bracket

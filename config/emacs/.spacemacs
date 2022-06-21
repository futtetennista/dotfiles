;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     html
     sql
     markdown
     yaml
     haskell
     ;; purescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     (auto-completion
       (haskell :variables haskell-completion-backend 'company-ghci))
     ;; better-defaults
     emacs-lisp
     git
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     plantuml
     themes-megapack
     auto-completion
     python
     deft ;; search Zettelkasten
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ag
     neotree
     org-roam ;; create Zettelkasten
     texfrag ;; display LaTeX formulas
     ;; psc-ide
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     flx-ido
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(with-eval-after-load 'org
  ;; (setq org-todo-keywords
  ;;   '((sequence "TODO(t!)" "STARTED(n@!)" "BLOCKED(b@!)" "DELEGATED(D!)" "|" "CANCELLED(c!)" "DONE(d!)")))

  ;; '(progn
  ;;    (define-prefix-command 'org-todo-state-map)

  ;;    (define-key org-mode-map "\C-cx" 'org-todo-state-map)

  ;;    (define-key org-todo-state-map "x"
  ;;      #'(lambda nil (interactive) (org-todo "CANCELLED")))
  ;;    (define-key org-todo-state-map "d"
  ;;      #'(lambda nil (interactive) (org-todo "DONE")))
  ;;    (define-key org-todo-state-map "f"
  ;;      #'(lambda nil (interactive) (org-todo "DEFERRED")))
  ;;    (define-key org-todo-state-map "l"
  ;;      #'(lambda nil (interactive) (org-todo "DELEGATED")))
  ;;    (define-key org-todo-state-map "s"
  ;;      #'(lambda nil (interactive) (org-todo "STARTED")))
  ;;    (define-key org-todo-state-map "w"
  ;;      #'(lambda nil (interactive) (org-todo "WAITING")))

     ;; (define-key org-agenda-mode-map "\C-n" 'next-line)
     ;; (define-key org-agenda-keymap "\C-n" 'next-line)
     ;; (define-key org-agenda-mode-map "\C-p" 'previous-line)
     ;; (define-key org-agenda-keymap "\C-p" 'previous-line))
)

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(phoenix-dark-mono
                         spacemacs-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq create-lockfiles nil)

  ;; neotree
  (global-set-key (kbd "<f8>") 'neotree-toggle)
  (global-set-key (kbd "<C-f8>") 'neotree-find)
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)

  ;; psc-ide
  (add-hook 'purescript-mode-hook
            (lambda ()
              (psc-ide-mode)
              (company-mode)
              (flycheck-mode)
              (turn-on-purescript-indentation)))
  (setq psc-ide-use-npm-bin t)
  ;; (customize-set-variable 'psc-ide-rebuild-on-save t)

  ;; haskell-mode
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  ;; (custom-set-variables '(haskell-stylish-on-save t))

  (windmove-default-keybindings)

  (unless (display-graphic-p)
    (require 'evil-terminal-cursor-changer)
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
    )

  ;; Macros
  ;; Reload modules in 'GHCi' buffer (buffer #1)
  (fset 'ghci-reload
        [escape ?: ?w ?\C-m ?  ?1 ?\C-x ?b ?g ?h ?c ?i ?\C-m ?\C-l ?i ?: ?r ?\C-m escape])

  ;; Execute last command in buffer #1
  (fset 'last-command-repeat
        [escape ?: ?w ?\C-m ?  ?1 ?i ?\C-\[ ?O ?A ?\C-m escape])
  (global-set-key (kbd "C-c l") 'last-command-repeat)

  ;; 1. get buffer name: (buffer-name (window-buffer (minibuffer-selected-window)))
  ;; (fset 'last-command-repeat-return
  ;;   (let (b (buffer-name (window-buffer (minibuffer-selected-window))))
  ;;     [escape ?  ?1 ?i up return escape ?  ?b]))
  ;; (global-set-key (kbd "C-c L") 'last-command-repeat-return)

  ;; Key bindings
  (spacemacs/set-leader-keys "jt" 'find-tag)
  (global-set-key (kbd "<f8>") 'neotree-toggle)
  (global-set-key (kbd "<S-f8>") 'neotree)
  (global-set-key (kbd "<C-f8>") 'neotree-find)
  ;; (define-key key-translation-map (kbd "<f9> u <right>") (kbd "→"))

  (global-set-key (kbd "C-c r") 'ghci-reload)

  ;; Setting up Fonts for use with Agda/PLFA
  ;;
  ;; default to DejaVu Sans Mono,
  ;; (set-face-attribute 'default nil
	;; 	                  :family "DejaVu Sans Mono"
	;; 	                  :height 120
	;; 	                  :weight 'normal
	;; 	                  :width  'normal)

  ;; ;; fix \:
  ;; (set-fontset-font "fontset-default"
	;; 	                (cons (decode-char 'ucs #x2982)
	;; 		                    (decode-char 'ucs #x2982))
	;; 	                "STIX")

  ;; (use-package ormolu
  ;;   :hook (haskell-mode . ormolu-format-on-save-mode)
  ;;   :bind
  ;;   (:map haskell-mode-map
          ;; ("C-c f" . ormolu-format-buffer)))
  ;; (push "~/.emacs.d/contrib/reformatter.el" load-path)
  ;; (push "~/.emacs.d/contrib/ormolu.el" load-path)
  ;; (load-library "ormolu")
  ;; (add-hook 'haskell-mode-hook 'ormolu-format-on-save-mode)

  ;; Org mode
  ;; https://orgmode.org/manual/Subscripts-and-Superscripts.html
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "STARTED(s@/!)" "PAUSED(p@/!)" "BLOCKED(b@/!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "|" "CANCELLED(c!)" "DONE(d@/!)"))
        org-pretty-entities nil
        org-image-actual-width '(300))

  ;; http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/
  ;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
  ;; (define-key global-map [(control meta ?r)] 'remember)
  (custom-set-variables
   '(org-agenda-files (quote ("~/Dropbox/Apps/emacs/org/todo.org")))
   '(org-default-notes-file "~/Dropbox/Apps/emacs/org/notes.org")
   '(org-agenda-ndays 7)
   '(org-deadline-warning-days 14)
   '(org-agenda-show-all-dates t)
   '(org-agenda-skip-deadline-if-done t)
   '(org-agenda-skip-scheduled-if-done t)
   '(org-agenda-start-on-weekday nil)
   '(org-reverse-note-order t)
   '(org-fast-tag-selection-single-key (quote expert))
   '(org-agenda-custom-commands
     (quote (("d" todo "DELEGATED" nil)
  	   ("c" todo "DONE|DEFERRED|CANCELLED" nil)
  	   ("w" todo "WAITING" nil)
  	   ("W" agenda "" ((org-agenda-ndays 21)))
  	   ("A" agenda ""
  	    ((org-agenda-skip-function
  	      (lambda nil
  		(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
  	     (org-agenda-ndays 1)
  	     (org-agenda-overriding-header "Today's Priority #A tasks: ")))
  	   ("u" alltodo ""
  	    ((org-agenda-skip-function
  	      (lambda nil
  		(org-agenda-skip-entry-if (quote scheduled) (quote deadline)
  					  (quote regexp) "\n]+>")))
  	     (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
   '(org-remember-store-without-prompt t)
   '(org-remember-templates
     (quote ((116 "* TODO %?\n  %u" "~/todo.org" "Tasks")
  	   (110 "* %u %?" "~/notes.org" "Notes"))))
   ;; '(remember-annotation-functions (quote (org-remember-annotation)))
   ;; '(remember-handler-functions (quote (org-remember-handler)))
   )
   ;; Org configuration

   ;; Org-Roam basic configuration
   ;; Taken from: https://lucidmanager.org/productivity/taking-notes-with-emacs-org-mode-and-org-roam/
   (setq org-directory (concat (getenv "HOME") "/Dropbox/Apps/emacs/org/zettelkasten/"))

   (use-package org-roam
     :after org
     :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
     :custom
     (org-roam-directory (file-truename org-directory))
     :config
     (org-roam-setup)
     :bind (("C-c n f" . org-roam-node-find)
            ;; ("C-c n r" . org-roam-node-random)
            (:map org-mode-map
                  (("C-c n i" . org-roam-node-insert)
                   ("C-c n o" . org-id-get-create)
                   ("C-c n t" . org-roam-tag-add)
                   ("C-c n a" . org-roam-alias-add)
                   ("C-c n r" . org-roam-ref-add)
                   ("C-c n l" . org-roam-buffer-toggle)))))

   (use-package deft
     :config
     (setq deft-directory org-directory
           deft-recursive t
           deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
           deft-use-filename-as-title t)
     :bind ("C-c n d" . deft))

   (use-package org-roam-bibtex
     :after (org-roam helm-bibtex)
     :bind (:map org-mode-map ("C-c n b" . orb-note-actions))
     :config (require 'org-ref))

   (require 'org-roam-export)
   (setq org-roam-directory (file-truename "~/Dropbox/Apps/emacs/org/zettelkasten"))
   ;; Org-Roam basic configuration
 )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-ignore-list
   (quote
    ("TAGS" ".git/" ".stack-work/" "build/" "node_modiles/")))
 '(ag-project-root-function nil)
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-custom-commands
   (quote
    (("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote notregexp)
           "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline)
           (quote regexp)
           "
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/Dropbox/Apps/emacs/org/todo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/Dropbox/Apps/emacs/org/notes.org")
 '(org-directory "~/.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-pomodoro-play-sounds nil)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   (quote
    ((116 "* TODO %?
  %u" "~/todo.org" "Tasks")
     (110 "* %u %?" "~/notes.org" "Notes"))))
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode cython-mode company-anaconda anaconda-mode pythonic org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot ormolu reformatter web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data sql-indent psci purescript-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme evil-terminal-cursor-changer ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode paradox spinner org-bullets open-junk-file move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation google-translate golden-ratio fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight dumb-jump f define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link yaml-mode evil-surround plantuml-mode ag psc-ide dash-functional neotree flx-ido smeargle orgit mmm-mode markdown-toc s markdown-mode magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit magit-popup git-commit ghub with-editor company-statistics company-cabal auto-yasnippet ac-ispell auto-complete intero flycheck dash hlint-refactor hindent haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy)))
 '(plantuml-jar-path "/Users/futtetennista/.local/bin/plantuml.jar")
 '(psc-ide-rebuild-on-save nil t)
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-ignore-list '("TAGS" ".git/" ".stack-work/" "build/" "node_modiles/"))
 '(ag-project-root-function nil)
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-agenda-custom-commands
   '(("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
 '(org-agenda-files '("~/Dropbox/Apps/emacs/org/todo.org"))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/Dropbox/Apps/emacs/org/notes.org")
 '(org-directory "~/.org")
 '(org-fast-tag-selection-single-key 'expert)
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(org-pomodoro-play-sounds nil)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   '((116 "* TODO %?
  %u" "~/todo.org" "Tasks")
     (110 "* %u %?" "~/notes.org" "Notes")))
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(tern web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode cython-mode company-anaconda anaconda-mode pythonic org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot ormolu reformatter web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data sql-indent psci purescript-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme evil-terminal-cursor-changer ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode paradox spinner org-bullets open-junk-file move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation google-translate golden-ratio fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight dumb-jump f define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link yaml-mode evil-surround plantuml-mode ag psc-ide dash-functional neotree flx-ido smeargle orgit mmm-mode markdown-toc s markdown-mode magit-gitflow gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit magit-popup git-commit ghub with-editor company-statistics company-cabal auto-yasnippet ac-ispell auto-complete intero flycheck dash hlint-refactor hindent haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(plantuml-jar-path "/Users/futtetennista/.local/bin/plantuml.jar")
 '(psc-ide-rebuild-on-save nil t)
 '(remember-annotation-functions '(org-remember-annotation))
 '(remember-handler-functions '(org-remember-handler)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(org-roam-shielded ((t (:inherit warning))))
 '(org-roam-title ((t (:weight bold)))))
)

;; url: https://ogbe.net/emacs/references.html
;; Home About Research Blog UP
;; Reference Management
;; 
;; This file contains my setup for reference management. At the beginning of my academic journey, I used Zotero. However, at some point during my PhD, I abandoned reference management altogether; mostly because Zotero was a little too much, was not in Emacs, and only gave me an 85% solution (I always had to edit things by hand before publication). This sorta worked, but it really was not a sustainable system for retaining notes and knowledge and such.
;; Now that I came to my senses and realized that I indeed do need a system for managing references, I am setting up a fully-Emacs-based system in this file. It is utilizing the following three packages:
;; 
;;     ebib for bibtex database management and editing
;;     ivy-bibtex for searching and inserting references in LATEX
;; 
;;     documents and everywhere I need it
;;     org-ref for searching, inserting, and exporting references in org-mode documents
;; 
;; This file is really just plumbing these three systems together. The heavy lifting is done in those absolutely fantastic packages. With some glue code, I can get my 100% solution exactly the way I want it. So let's get into it. At the end of this file, we will have configured ebib to create and manage our reference database and to import items. In addition, we will define three commands:
;; 
;;     M-x cite, which is a DWIM command to insert the right citation based on what type of document we are editing: We insert an org-ref cite: link when we are in org-mode, a traditional \cite{} macro when we are in LATEX
;; 
;; , and we just print the reference when we are in any other mode.
;; M-x bib, which just calls ivy-bibtex to search all of our references and open PDFs, edit notes, etc. from anywhere in Emacs. M-o with a candidate lets me choose what to do.
;; M-x gen-bib, which we call in either an org=mode of LATEX
;; 
;;     buffer to generate a BibTeX file from the keys we inserted in the document using M-x cite or a custom snippet.
;; 
;; We want to support the following use cases: First, we want to store the BibTeX entries with links to their PDFs and note files (to be edited in org-mode) in a central location. This location is what we refer to as the reference database. This database is made up of strictly plain text .bib and .org files and PDFs. Helps with the bus factor.
;; 
;; Second, in both org-mode and, more importantly, LATEX
;; 
;; documents, we want to insert citations from this global database only. This means no more separate .bib files per project. We always cite from the global database.
;; 
;; Third and finally, since we actually need a local .bib file when running the LATEX
;; 
;; interpreter, we use M-x gen-bib to generate the necessary .bib files for each project on demand based on the keys that are cited in the document. This gives a clean and controlled way to assemble the files for each project without duplicating entries and losing sight of what was read and when.
;; The reference database
;; 
;; The "database" consists of a loose collection of bib files in user-defined directories, a directory containing all pdfs, and a directory containing a notes file <bibtex-key>.org for every entry from all files. This must be set for any of this to work.
;;
;;;;;;;;
(defvar do.refs/db-dirs nil
  "A list of paths to directories containing all my bibtex databases")

(defvar do.refs/pdf-dir nil
  "The path to the directory containing the PDF files. The file
  for the entry with key <key> is stored as <key>.pdf.")

(defvar do.refs/notes-dir nil
  "The path to the directory containing my notes for the
  references. The note for the item with key <key> is stored in
  this folder as <key>.org")

(defvar do.refs/pdf-download-dir nil
  "The path to the temporary directory to which we download PDF
  files.")

(defun do.refs/get-db-file-list ()
  "Get the list of all the bib files containing my bib database."
  (mapcan (lambda (dir) (directory-files dir t "\\.bib\\'"))
          do.refs/db-dirs))
;;;;;;;;
;; ebib configuration
;; 
;; We use ebib to import items and to edit databases. Start with M-x ebib. Then open a database with o. We can open multiple databases at the same time and switch using the arrow keys. Edit a key with E. Auto-generate a key with !. Edit an entry with e. Edit in item in an entry with e. Import a file by selecting an entry in the top window and M-x ebib-import-file. This moves the selected PDF to the PDF directory under the right name. Add notes to an entry with N. Open the attached file with f.
;; 
;; To import an item to the database there are two ways: First, we can just add the entry to the end of the file in a regular Emacs buffer. Second, with ebib opened in a frame, we can paste a BibTeX entry into an Emacs buffer (works nicely with the "Open with emacsclient" .desktop file) and call M-x ebib-import.
;; 
;; The configuration below sets some sane standards, points ebib to our database, and changes the notes format to work well with the "one-file-per-entry" approach. 
;;;;;;;;
(use-package ebib
  :ensure t
  :init
  (add-hook 'ebib-entry-mode-hook #'no-trailing-whitespace)
  :config
  ;; point it to our database
  (setq ebib-file-search-dirs `(,do.refs/pdf-dir))
  (setq ebib-notes-directory do.refs/notes-dir)
  (setq ebib-preload-bib-files (do.refs/get-db-file-list))

  ;; `ebib' uses `bibtex.el' to auto-generate keys for us
  (setq bibtex-autokey-year-length 4)
  (setq bibtex-autokey-titleword-separator "-")
  (setq bibtex-autokey-name-year-separator "-")
  (setq bibtex-autokey-year-title-separator "-")
  (setq bibtex-autokey-titleword-length 8)
  (setq bibtex-autokey-titlewords 3)
  (setq bibtex-autokey-titleword-ignore ;; I took "On" out of this
        '("A" "An" "The" "Eine?" "Der" "Die" "Das" "[^[:upper:]].*" ".*[^[:upper:][:lower:]0-9].*"))

  ;; make ebib window easier to deal with
  (setq ebib-index-window-size 25)

  ;; use a common/similar notes template between `ebib' and `ivy-bibtex'.
  (setq ebib-notes-template "#+TITLE: Notes on: %T\n\n>|<")
  (remove-hook 'ebib-notes-new-note-hook #'org-narrow-to-subtree)

  ;; open pdfs with our favorite pdf reader
  (setq ebib-file-associations `(("pdf" . ,do.minimal/pdf-reader)))

  ;; a small convenience function to import into ebib from the clipboard
  (defun do.refs/ebib-import-from-clipboard ()
    "Attempt to import the contents in the kill ring/clipboard into `ebib'."
    (interactive)
    (with-temp-buffer
      (yank)
      (ebib-import)
      (call-interactively #'ebib)))

  ;; another convenience function to add the most recently downloaded PDF file
  ;; from the ~/Downloads folder to the current entry
  (defun do.refs/ebib-add-newest-pdf-from-downloads ()
    "Add the most recently-downloaded PDF in the ~/Downloads directory to the current entry in ebib."
    (interactive)
    ;; pull out the most recent file from ~/Downloads with the .pdf extension.
    (let ((newest-pdf (caar (sort (mapcan (lambda (x) (when (string-equal (file-name-extension (nth 0 x)) "pdf") (cons x nil)))
                                          (directory-files-and-attributes do.refs/pdf-download-dir))
                                  (lambda (x y) (not (time-less-p (nth 6 x) (nth 6 y))))))))
      (if newest-pdf
          ;; https://nullprogram.com/blog/2017/10/27/
          ;; need to override `read-file-name' because ebib normally prompts us for the file to import
          (let ((fpath (concat (file-name-as-directory do.refs/pdf-download-dir) newest-pdf))
                (bibkey (ebib--get-key-at-point)))
            (cl-letf (((symbol-function 'read-file-name) (lambda (&rest _) fpath)))
              (call-interactively #'ebib-import-file))
            (message "[Ebib] [Dennis] Imported %s for %s" fpath bibkey))
        (message "[Ebib] [Dennis] No PDF files found in %s." do.refs/pdf-download-dir))))

  ;; on import, create two copies of the file. one for reading, one
  ;; for annotating. can also use this command to add an annotated
  ;; file to an existing entry
  (defun do.refs/ebib-add-annotated (arg)
    "Advice for `ebib-import-file' that automatically creates a
  copy of the imported file that will be used for annotation."
    (interactive "P")
    (let ((filename (ebib-get-field-value ebib-file-field
                                          (ebib--get-key-at-point)
                                          ebib--cur-db 'noerror 'unbraced)))
      (when filename
        (let* ((pdf-path (file-name-as-directory (car ebib-file-search-dirs)))
               (orig-path (concat pdf-path filename))
               (annot-path (concat pdf-path
                                   (file-name-sans-extension filename)
                                   "-annotated"
                                   (file-name-extension filename t))))
          (unless (file-writable-p annot-path)
            (error "[Ebib] [Dennis] Cannot write file %s" annot-path))
          (copy-file orig-path annot-path)))))

  ;; add the above after the original call is done.
  (advice-add #'ebib-import-file :after #'do.refs/ebib-add-annotated))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivy-bibtex configuration
;; 
;; This package is really just an alternative completion interface for bibtex-completion. It looks like this was initially all written for helm and at some point divided into the bibtex-completion frontend and helm and an ivy backend.
;; 
;; I really like the ivy interface for searching. 
;; So we will configure it to be able to search our global database from anywhere in Emacs. We will later use this interface to insert citation keys into LATEX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ivy-bibtex
  :ensure t
  :init
  ;; point ivy to the reference database
  (defun do.refs/update-db-file-list ()
    "Update the list of bib files used for `ivy-bibtex'"
    (interactive)
    (setq ebib-preload-bib-files (do.refs/get-db-file-list))
    (setq bibtex-completion-bibliography (do.refs/get-db-file-list)))
  (do.refs/update-db-file-list)
  (setq bibtex-completion-library-path `(,do.refs/pdf-dir))
  (setq bibtex-completion-notes-path do.refs/notes-dir) ; notes are by default <key>.org

  ;; need this extra config (see github page)
  (push '(ivy-bibtex . ivy--regex-ignore-order)
  ivy-re-builders-alist)

  ;; make sure we can open additional files through =M-x bib=
  (setq bibtex-completion-pdf-field nil)

  ;; could save an annotated version of a PDF with <key>-annotated.pdf
  (setq bibtex-completion-find-additional-pdfs t)

  ;; what is the default citation style?
  (setq bibtex-completion-cite-default-command "cite")
  (setq bibtex-completion-cite-default-as-initial-input t)

  ;; hack the APA print function
  <<do.refs/reference-format>>

  ;; open PDFs with our favourite PDF reader
  (setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (call-process do.minimal/pdf-reader nil 0 nil fpath))))
;;;;;;;;;;;;;;;;;;;;;;
;; One function of ivy-bibtex is to insert the full reference at point. This is a great feature, I just want to hack the output a little bit. 
;;;;;;;;;;;;;;;;;;;;;;
(defun do.refs/custom-insert-reference (keys)
  "This is a hacked version of `bibtex-completion-insert-reference'.

I just remove some punctuation and whitespace compared to the
original. It's still not perfect, but works well enough for
something I won't need much"
(let* ((refs (--map (s-word-wrap fill-column (bibtex-completion-apa-format-reference it))
                keys)))
  (insert (s-join "\n" refs) "\n")))

(advice-add #'bibtex-completion-insert-reference :override #'do.refs/custom-insert-reference)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-ref configuration
;; 
This package is responsible for managing references in org-mode documents. 
;; While I don't plan on writing many papers in org-mode (can't expect random collaborators to be into Emacs like this…), 
;; this is still very useful for personal stuff (my PhD thesis was written in org-mode) and my notes. 
;; This also lets me link to references from within notes of other references. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-ref
  :ensure t
  :demand ; we demand this because it also displays citations in latex documents
  :init
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  :config
  (setq org-ref-default-bibliography (do.refs/get-db-file-list))
  (setq org-ref-pdf-directory do.refs/pdf-dir)
  ;; edit notes using the bibtex-completion package, i.e. `ivy-bibtex'
  (setq org-ref-bibliography-notes nil)
  (setq org-ref-notes-function
        (lambda (thekey)
          (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
            (bibtex-completion-edit-notes
             (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
  (defun do.refs/org-ref-insert (&optional arg)
    "Fix org-ref's cite command"
    ;; make sure bibtex-completion is initialized
    (bibtex-completion-init)
    ;; fix org-ref (see https://github.com/jkitchin/org-ref/issues/717#issuecomment-633788035)
    (ivy-set-display-transformer 'org-ref-ivy-insert-cite-link 'ivy-bibtex-display-transformer)
    ;; fix the height of the cite window
    (let ((ivy-fixed-height-minibuffer t))
      (push '(org-ref-ivy-insert-cite-link . do.minimal.rg/get-window-height) ivy-height-alist)
      (org-ref-insert-link arg)
      (pop ivy-height-alist))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plumbing/interface
;; 
;; With our three heavy-lifting packages configured, 
;; let's write some glue code to make it all play well together and to let me use them the way I want to. 
;; The built-in reftex package will play a big part in this. 
;; But first we want to discourage it from looking for local databases. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package reftex
  :init
  (setq reftex-default-bibliography (do.refs/get-db-file-list)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Next, a few definitions for bibliography generation. 
;; We set a straw man default name and give ourselves the ability to post-process the buffer containing the BibTeX entries. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar do.refs/default-bib-name "refs.bib"
  "The default name for bibliographies generated from TeX or org files.")

(defvar do.refs/bib-file-post-process-function nil
  "A function to post-process the auto-generated .bib
  files. Called with a temporary buffer as single argument.")

(defun do.refs/mangle-bib-files (buffer)
  "Insert a header and pull some fields out of the bib file."
  (goto-char (point-min))
  (insert "% ------------------------------------------------------------------\n"
          (format-time-string
           "% -- This file was auto-generated on %Y-%m-%d at %T\n")
          "% -- Change at own risk.\n"
          "% ------------------------------------------------------------------\n\n")
  ;; let's just say that the month field in BibTeX is a little strange... This
  ;; is an attempt at removing the {braces} when we find one of the
  ;; three-letter month codes jan, feb, etc. in braces.
  (mapcar (lambda (month)
            (goto-char (point-min))
            (while (re-search-forward (format "\\(^\s+month\s+=\s+\\){%s}" month) nil t)
              (replace-match (format "\\1%s" month))))
          '("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec")))

(setq do.refs/bib-file-post-process-function #'do.refs/mangle-bib-files)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Now for the main course, 
;; do.refs/generate-bib-file can be called on a LATEX or org-mode buffer 
;; and will spit out a fresh .bib file containing only the elements cited in the current document. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun do.refs/generate-bib-file (&optional outfile)
    "Generate a .bib file for the tex or org document in the current buffer.

  This is done by first extracting all citation keys from the
  document and then pulling them from the global database."
    (interactive
     ;; if called with a prefix arg, put the generated bib into the kill ring
     ;; instead of writing it to a file.
     (if current-prefix-arg
         (list 'copy)
       ;; prompt user, get outfile, make sure this all works out.
       (if (not (or (derived-mode-p 'tex-mode) (derived-mode-p 'org-mode)))
           (prog1 nil (message "Not visiting a TeX or org buffer."))
         (let ((target-file (read-file-name "Path to .bib file: " nil nil nil do.refs/default-bib-name)))
           (cond ((file-directory-p target-file) (error "Output cannot be a directory."))
                 ((file-exists-p target-file)
                  (if (yes-or-no-p (format "File %s exists. Overwrite? " target-file))
                      (list target-file)
                    (message "Not overwriting %s." target-file) nil))
                 (t (list target-file)))))))
    (when outfile
      ;; write the output file
      (let ((mode (cond ((derived-mode-p 'org-mode) 'org)
                        ((derived-mode-p 'tex-mode) 'tex))))
        (let ((tex-buffer (cond ((equal mode 'tex) (current-buffer))
                                ((equal mode 'org)
                                 ;; need to export the org doc to latex before we can scan
                                 (let ((org-export-show-temporary-export-buffer nil)
                                       (fn (file-name-sans-extension
                                            (buffer-file-name (current-buffer)))))
                                   (org-latex-export-to-latex)
                                   (find-file fn)))))
              (msg (format "Saving .bib file for %s to %s..."
                           (cond ((equal mode 'tex) (reftex-TeX-master-file))
                                 ((equal mode 'org) (buffer-file-name (current-buffer))))
                           outfile)))
          ;; extract all keys from file using reftex and insert into bib file using bibtex-completion
          (with-current-buffer tex-buffer
            (let ((keys (reftex-all-used-citation-keys))
                  ;; skip over some fields for bib file generation
                  (bibtex-completion-no-export-fields (append '("author+an" "keywords" "abstract" "file")
                                                              bibtex-completion-no-export-fields)))
              (with-temp-buffer
                (mapcar (lambda (key) (insert (concat (bibtex-completion-make-bibtex key) "\n"))) keys)
                (when (symbol-function do.refs/bib-file-post-process-function) ; post-process
                  (funcall do.refs/bib-file-post-process-function (current-buffer)))
                ;; either write to file or move to kill ring
                (if (equal outfile 'copy)
                    (progn (kill-region (point-min) (point-max))
                           (message "Copied references database to kill ring."))
                  (write-file outfile)))))
          (when (equal mode 'org) ; close the exported document
            (kill-buffer tex-buffer))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Now let's customize the way we call ivy-bibtex to query our shiny new reference database. 
;; This will define the behavior of our M-x cite and M-x bib commands. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun do.refs/get-ivy-cite-key ()
  "Attempt to return a citation key as a string using `ivy-bibtex'."
  (with-temp-buffer
    (let ((bibtex-completion-cite-prompt-for-optional-arguments nil)
        (ivy-bibtex-default-action 'ivy-bibtex-insert-citation))
      (ivy-bibtex))
    (when (> (buffer-size) 0)
      (buffer-string))))

(defun do.refs/ivy-bibtex-insert-cite-key (&optional arg)
  "Attempt to insert a citation key into the current LaTeX buffer."
  (let ((bibtex-completion-cite-prompt-for-optional-arguments nil)
        (ivy-bibtex-default-action 'ivy-bibtex-insert-citation))
    (ivy-bibtex arg)))

(defun do.refs/ivy-bibtex-insert-reference (&optional arg)
  "Attempt to insert a full reference into the current buffer."
  (let ((ivy-bibtex-default-action 'ivy-bibtex-insert-reference))
    (ivy-bibtex arg)))

(defun do.refs/insert-key-or-reference (arg)
  "A DWIM 'cite' command."
  (interactive "P")
  (cond ((derived-mode-p 'org-mode) (do.refs/org-ref-insert arg))
        ((derived-mode-p 'tex-mode) (do.refs/ivy-bibtex-insert-cite-key arg))
        (t (do.refs/ivy-bibtex-insert-reference arg))))

(defun do.refs/call-ivy-bibtex (arg)
  "Use this to call `ivy-bibtex' with some interface customizations."
  (interactive "P")
  (let ((ivy-fixed-height-minibuffer t))
    (push '(ivy-bibtex . do.minimal.rg/get-window-height) ivy-height-alist)
    (ivy-bibtex arg)
    (pop ivy-height-alist)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My most-used snippet is the cite snippet in LATEX documents. 
;; Since I have the muscle memory, I want to have a snippet that behaves similarly, 
;; but calls ivy-bibtex instead of reftex. This is one way to do it. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# -*- mode: snippet -*-
# contributor : Dennis Ogbe <do@ogbe.net>
# key: cite
# group: references
# name : \cite
# --

\cite{${1:key$(unless yas/modified-p (let ((key (do.refs/get-ivy-cite-key))) (if key key "no key received...")))}$0}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Finally, in addition to the LATEX snippet, 
;; we want to access everything through our convenient aliases bib, cite, and gen-bib. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'cite    #'do.refs/insert-key-or-reference)
(defalias 'bib     #'do.refs/call-ivy-bibtex)
(defalias 'gen-bib #'do.refs/generate-bib-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; And that should be it. Simple, right? 
documents. 

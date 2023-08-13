#lang racket/base

(require "squish.rkt"
         toml
         racket/file)

;; (define (config-ref section value)
;;     (hash-ref (hash-ref (parse-toml (file->string "config.toml")) section) value))

(define (prompt)
  (printf "┌ \033[35m~a\033[0m@\033[35m~a\033[0m \033[32m~a\033[0m ~a\n" 
    (getenv "USER")
    (getenv "HOSTNAME") 
    (regexp-replace #rx"/home/[^/]+" (path->string (current-directory)) "~")
    (hash-ref (hash-ref (parse-toml (file->string "config.toml")) 'prompt) 'extra_symbols))
  
  (display "└ \033[33mλ \033[0m")
  (flush-output)
  (squish-run (read-line))

  (prompt))

(prompt)
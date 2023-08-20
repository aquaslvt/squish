#lang racket/base

(require "squish.rkt"
         racket/file
         toml
         threading)

(define (config-ref section value)
  (hash-ref (~> "config.toml"
            file->string
            parse-toml
            (hash-ref (string->symbol section))) (string->symbol value)))

(define (prompt)
  (printf "┌ \033[35m~a\033[0m@\033[35m~a\033[0m \033[32m~a\033[0m ~a\n" 
    (getenv "USER")
    (or (getenv "HOSTNAME") "sqsh")
    (regexp-replace #rx"/home/[^/]+" (path->string (current-directory)) "~")
    (config-ref "prompt" "extra_symbols"))
  
  (display "└ \033[33mλ \033[0m")
  (flush-output)
  (squish-run (read-line))

  (prompt))

(prompt)
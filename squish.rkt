#lang racket/base

(require racket/system)

(system "rlwrap -n squish")
(system "clear")

(define (squish)
  (display "\033[33mλ \033[0m")
  (flush-output)
  (displayln (system (read-line)))
  (squish))

(squish)
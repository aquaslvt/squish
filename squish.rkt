#lang racket

(require racket/system)

(define (squish)
  (display "\033[33mλ \033[0m")
  (flush-output)
  (displayln (system (read-line)))
  (squish))

(squish)
#lang racket

(require graph)



(define *marked* (mutable-set ))
(define *dfs-tree* (unweighted-graph/directed '()))


(define (mark v)
  (set-add! *marked* v))

(define (unmark v)
  (set-remove! *marked* v))

(define (unmark-all)
  (set-clear! *marked*))

(define (marked? v)
  (set-member? *marked* v))

(define (unmarked? v)
  (not (marked? v)))

(define (DFS gr v [pre-visit (λ(x) (void))] [post-visit (λ(x) (void))])
  (mark v)
  (pre-visit v)
  (for [(w (in-neighbors gr v))]
    (when (unmarked? w)
      (add-directed-edge! *dfs-tree* v w)
      (DFS gr w pre-visit post-visit)))
  (post-visit v))





(define g (unweighted-graph/directed '((0 1)
                                       (0 2)
                                       (0 5)
                                       (1 4)
                                       (3 4)
                                       (3 6)
                                       (3 5)
                                       (3 2)
                                       (5 2)
                                       (6 0)
                                       (6 4))))

(do-dfs g #:init '()
        #:epilogue: (cons $v $acc))


(define courses (unweighted-graph/directed '((csc103 csc235)
                                             (csc121 csc235)
                                             (csc121 csc345)
                                             (csc225 csc315)
                                             (csc225 csc320)
                                             (csc219 csc315)
                                             (csc120 csc121)
                                             (csc121 csc225)
                                             (csc121 csc245)
                                             (csc219 csc320)
                                             (csc121 csc351)
                                             (csc219 csc351)
                                             (csc120 csc232)
                                             (csc225 csc420)
                                             (csc320 csc490)
                                             (mat120 mat201)
                                             (mat303 csc351)
                                             (mat201 mat303))))

(do-dfs courses #:init '()
        #:epilogue: (cons $v $acc)
        #:order: (λ(lst) (sort lst string>=? #:key symbol->string)))





;; =========================================================


;; A Term is a Symbol, which might start with a ~  ("negation")

;; A 2Formula is (list (list Term ∨ Term) ∧ ...)


;; Term -> Term
;; negates a term
(define (neg-sym sym)
  (define str (symbol->string sym))
  (cond [(string-prefix? str "~") (string->symbol (substring str 1))]
        [else (string->symbol (string-append "~" str))]))

(define (is-neg? sym)
  (string-prefix? (symbol->string sym) "~"))




;; 2Formula -> Graph[Node]
(define (make-implication-graph a-formula)
  (define G (unweighted-graph/directed '()))

  (define (add-imps x y)
    (add-directed-edge! G (neg-sym x) y)
    (add-directed-edge! G (neg-sym y) x))

  (for [(pc a-formula)]
    (match pc
      [(list x '∨ y) (add-imps x y)]
      [_ (void)]))

  G)


;; Graph[Node]  [Listof [Listof Node]] -> Graph[Listof Node]
(define (make-scc-graph G scc-s)
  (define SG (unweighted-graph/directed '()))
  
  (for* [(cc scc-s) (oth (remove cc scc-s))]
    (for* [(v cc)
           (u oth)]
      (when (has-edge? G v u)
        (add-directed-edge! SG cc oth))))

  SG)



;; [Listof [Listof Term]] -> [Hash Node Boolean]
(define (assign-vals node-groups)
  (define seen (mutable-set ))
  (define assigns (make-hash ))

  (for [(group node-groups)]
    (for [(node group)]
      (if (set-member? seen (neg-sym node))
          (hash-set! assigns node #t)
          (hash-set! assigns node #f))
      (set-add! seen node)))

  assigns)


;; [Listof [Listof Node]] -> Boolean
;; make sure x and ~x are not in the same strongly connected component anywhere
(define (check-consistent scc-s)
  (for/and [(cc scc-s)]
    (for/and [(node cc)]
      (not (member (neg-sym node) cc)))))


;; [Hash Node Boolean] -> [Hash Node Boolean]
;; remove negs from the hash
(define (clean-up hash-vals)
  (for/hash ([(n b) hash-vals]
             #:unless (is-neg? n))
    (values n b)))


;; 2Formula -> Maybe[Hash Node Boolean]
(define (solve formula)
  (define imp-graph (make-implication-graph formula))
  (define scc-s (scc imp-graph))
  (define scc-graph (make-scc-graph imp-graph scc-s))
  (and (check-consistent scc-s)
       (clean-up (assign-vals (tsort scc-graph)))))





;; =========================================================
;; sandbox


(define F1 '((a ∨ ~b) ∧ (~a ∨ b) ∧ (~a ∨ ~b) ∧ (a ∨ ~c)))

(define G1 (make-implication-graph F1))
(scc G1)
(get-edges (make-scc-graph G1 (scc G1)))
(tsort (make-scc-graph G1 (scc G1)))
(assign-vals (tsort (make-scc-graph G1 (scc G1))))
(solve F1)

(define F2 '((x1 ∨ x2) ∧ (x2 ∨ ~x1) ∧ (x1 ∨ ~x2) ∧ (~x1 ∨ ~x2)))
(solve F2)

(define F3 '((x1 ∨ x2) ∧ (~x2 ∨ x3) ∧ (~x1 ∨ ~x2) ∧ (x3 ∨ x4) ∧ (~x3 ∨ x5) ∧ (~x4 ∨ ~x5) ∧ (~x3 ∨ x4)))
(solve F3)




#! /usr/bin/env scheme-r5rs

; This is an SRFI-22 script which will build a SISC Heap jar
; by locating the running heap, the Heap Anchor, and
; emitting sisc-heap.jar, or another file if specified as a 
; command-line argument


(import s2j)
(import oo)
(import binary-io)
(import generic-procedures)

(define-java-classes
  <sisc.boot.heap-anchor>
  <sisc.interpreter.app-context>
  <sisc.io.stream-output-port>
  <java.util.zip.zip-output-stream>
  <java.io.file-output-stream>
  <java.util.zip.zip-entry>
  (<java.net.URL> |java.net.URL|))

(define-generic-java-methods put-next-entry close-entry write close find-heap
  get-resource)
(define-generic-java-field-accessor :out)

(define (copy in out)
  (let ([buffer (make-buffer 8192)])
    (let loop ([rc 0])
      (unless (eof-object? rc)
        (write-block buffer 0 rc out)
        (loop (read-block buffer 0 (buffer-length buffer) in))))
    (flush-output-port out)))

(define (find-heap-file)
  (open-binary-input-file (->string (find-heap (java-null <sisc.interpreter.app-context>)
                                               (java-null <java.net.URL>)))))

(define (find-heap-anchor-file)
  (open-binary-input-file
   (->string (get-resource <sisc.boot.heap-anchor> (->jstring "HeapAnchor.class")))))

(define (build-heap-jar . output)
  (let ([outfile (open-binary-output-file
                  (if (null? output)
                      "sisc-heap.jar"
                      (car output)))]
        [heapfile (find-heap-file)]
        [heapanchor (find-heap-anchor-file)])
    (let* ([zip-out (java-new <java.util.zip.zip-output-stream>
                             (:out (java-wrap (unwrap-native-output-port outfile))))]
           [zip-schemeout (make <native-output-port>
                            (java-unwrap (java-new <sisc.io.stream-output-port> zip-out (->jboolean #f))))]
           [anchorentry (java-new <java.util.zip.zip-entry>
                                  (->jstring "sisc/boot/HeapAnchor.class"))]
           [heapentry (java-new  <java.util.zip.zip-entry>
                                 (->jstring "sisc/boot/sisc.shp"))])
      (put-next-entry zip-out anchorentry)
      (copy heapanchor zip-schemeout)
      (close-entry zip-out)
      (put-next-entry zip-out heapentry)
      (copy heapfile zip-schemeout)
      (close-entry zip-out)
      (close-output-port zip-schemeout))))

(define (main args)
  (apply build-heap-jar (cdr args)))
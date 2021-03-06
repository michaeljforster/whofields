;;;; test/fieldspec.lisp

;;; The MIT License (MIT)
;;;
;;; Copyright (c) 2016 Michael J. Forster
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a copy
;;; of this software and associated documentation files (the "Software"), to deal
;;; in the Software without restriction, including without limitation the rights
;;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;; copies of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in all
;;; copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;; SOFTWARE.

(defpackage "WHOFIELDS/TEST/FIELDSPEC"
  (:use "CL"
        "LISP-UNIT")
  (:import-from "WHOFIELDS")
  (:import-from "WHOFIELDS/TEST/SETUP")
  (:export "TEST-FIELDSPEC-NAME"
           "TEST-FIELDSPEC-LABEL"
           "TEST-FIELDSPEC-PLIST"))

(in-package "WHOFIELDS/TEST/FIELDSPEC")

(define-test test-fieldspec-name
    (assert-equal
     whofields/test/setup::'my-text
     (whofields:fieldspec-name
      (whofields/test/setup:text-fieldspec))))

(define-test test-fieldspec-label
    (assert-equal
     "MY-TEXT"
     (whofields:fieldspec-label
      (whofields/test/setup:text-fieldspec))))

(define-test test-fieldspec-plist
    (assert-equal
     (list :validation-function #'whofields/test/setup:my-stringp
           :label "MY-TEXT"
           :placeholder "MY-TEXT"
           :help-text "Enter MY-TEXT"
           :value "")
     (whofields:fieldspec-plist
      (whofields/test/setup:text-fieldspec))))

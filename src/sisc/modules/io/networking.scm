(define open-socket-input-port
  (make-wrapped-constructor <native-character-input-port>
                            _open-socket-input-port))

(define open-socket-output-port
  (make-wrapped-constructor <native-character-output-port>
                            _open-socket-output-port))

(define open-binary-socket-input-port
  (make-wrapped-constructor <native-input-port>
                            _open-binary-socket-input-port))

(define open-binary-socket-output-port
  (make-wrapped-constructor <native-output-port>
                            _open-binary-socket-output-port))

; Creates a SISC loadable library for SSAX
(load "ssax.scm")
(import compiled-libraries)
(create-library-from-module 'ssax "ssax.sll" 'ssax 'parser-error 'ascii
	'input-parse 'util 'miscio)
## Encoding

Encode with protoc

	% cat example.data | protoc --encode=Repeated example.proto | hexdump
	0000000 0a 02 00 02
	0000004

Encoding with crystal

	$ crystal run encode.cr | hexdump
	crystal run encode.cr | hexdump
	0000000 08 00 08 02 0a
	0000005

## Decoding

	cat example.data | protoc --encode=Repeated example.proto > proto3.encoded

Decoding with crystal fails

	protoc --crystal_out=. --plugin=protoc-gen-crystal=../bin/protoc-gen-crystal example.proto
	$ cat proto3.encoded | crystal run decode.cr
	Repeated(@foo=[YES])

However with protoc:

	$ cat proto3.encoded | protoc --decode=Repeated example.proto
	foo: YES
	foo: NEVER

and with ruby

	protoc --ruby_out=. example.proto
	$ cat proto3.encoded | ruby decode.rb
	<Repeated: foo: [:YES, :NEVER]>

### FYI: Encoding differences proto2 / proto3

	# Proto2
	0000000 08 00 08 02
	0000004
	
	# Proto3
	0000000 0a 02 00 02
	0000004

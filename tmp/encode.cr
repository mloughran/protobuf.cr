require "./example.pb"
puts Repeated.new(foo: [SomeEnum::YES, SomeEnum::NEVER]).to_protobuf

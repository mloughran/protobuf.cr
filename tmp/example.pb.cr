## Generated from example.proto
require "../src/protobuf"

enum SomeEnum
  YES = 0
  NO = 1
  NEVER = 2
end

struct Repeated
  include ::Protobuf::Message
  
  contract_of "proto3" do
    repeated :foo, SomeEnum, 1
  end
end

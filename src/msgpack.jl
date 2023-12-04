
module MsgPackSerial
using MsgPack
import ..Jewl

MsgPack.msgpack_type(::Type{Jewl.Project}) = MsgPack.StructType()
MsgPack.msgpack_type(::Type{Jewl.Frame}) = MsgPack.StructType()

Jewl.serializer() = MsgPack.unpack
end

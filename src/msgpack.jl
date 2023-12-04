using MsgPack

MsgPack.msgpack_type(::Type{Project}) = MsgPack.StructType()
MsgPack.msgpack_type(::Type{Frame}) = MsgPack.StructType()

serializer() = MsgPack.unpack

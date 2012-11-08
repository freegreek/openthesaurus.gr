class IsoURLCodec {
        static encode = { obj ->
                URLEncoder.encode(obj.toString(), "ISO-8859-7")
        }

        static decode = { obj ->
                URLDecoder.decode(obj.toString(), "ISO-8859-7")
        }
}

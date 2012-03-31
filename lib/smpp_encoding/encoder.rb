require 'gsm_encoder'

module SmppEncoding
  class Encoder

    # currently support only GSM and UNICODE
    ENCODING_GSM     = 0
    ENCODING_UNICODE = 8

    def auto_encode message
      if GSMEncoder.can_encode?(message)
        {
          data_coding: ENCODING_GSM,
          payload: encode(ENCODING_GSM, message)
        }
      else
        {
          data_coding: ENCODING_UNICODE,
          payload: encode(ENCODING_UNICODE, message)
        }
      end
    end

    def encode encoding, message
      if (encoding < 2)
        GSMEncoder.encode(message)
      else
        message.encode('UTF-16BE').force_encoding('binary')
      end
    end

    def enc coding, message
      if coding == :auto
        res = auto_encode(message)
        [res[:payload], res[:data_coding]]
      else
        [encode(coding, message), coding]
      end
    end
  end
end
# これがセパレートインタフェース
# MD5とSHA256はインフラ層で実装されている
class Encription
  def exec
    raise NotImplementedError
  end
end

class MD5 < Encription
  def exec
    "md5"
  end
end

class SHA256 < Encription
  def exec
  end
end

# インフラ層で実装されているものを使う。
module DomainRegistroy
  class EncryptionService
    def self.exec
      MD5.new.exec
    end
  end
end




# 使うところ
p DomainRegistroy::EncryptionService.exec

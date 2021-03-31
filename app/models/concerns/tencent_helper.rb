module TencentHelper

  def xx
    cre = Credential.new('SecretId', 'SecretKey')
    cli = Client.new(cre, 'ap-guangzhou')
  end
  include TencentCloud::Common

end

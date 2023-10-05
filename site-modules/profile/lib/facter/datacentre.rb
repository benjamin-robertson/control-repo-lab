require 'puppet'
require 'openssl'

def get_datacentre_regex(hostname)
  "none-set #{hostname}"
end

Facter.add(:datacentre) do
  setcode do
    # pick out the custom OID for pp_role, convert `:` to `_` and strip the leading `..` from the capture

    def read_extention(extentions)
      extentions.each do | element |
        if element.oid == 'pp_datacenter' or element.oid == '1.3.6.1.4.1.34380.1.1.19'
          arr = (element.to_s).split(' ')
          result = arr[2,arr.length].join
        return result
        end
      end
        # element not found
      return nil
    end
    
    cert_data = File.open "#{Puppet.settings[:certdir]}/#{Puppet.settings[:certname].downcase}.pem"
    
    certificate = OpenSSL::X509::Certificate.new cert_data
    result = read_extention(certificate.extensions)
    if result == nil
      datacenter = get_datacentre_regex(Facter.value(:hostname).downcase)
    else
      datacenter = result.gsub(/[^a-zA-Z\d\/_-]/, '')
    end
  end
end
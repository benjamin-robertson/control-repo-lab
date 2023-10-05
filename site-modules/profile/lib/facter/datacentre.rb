def get_datacentre_regex(hostname)
    "none-set #{hostname}"
  end

Facter.add(:datacentre) do
  setcode do
    datacentre = Facter.value(:trusted)['extensions']['pp_datacenter']
    # begin
    #   if Facter.value(:trusted)['extensions']['pp_datacenter'] != nil
    #    datacentre = Facter.value(:trusted)['extensions']['pp_datacenter'].downcase
    #   else
    #     get_datacentre_regex(Facter.value(:hostname).downcase)
    #   end
    # rescue
    #     get_datacentre_regex(Facter.value(:hostname).downcase)
    # end
  end
end
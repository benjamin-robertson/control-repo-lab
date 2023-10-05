Facter.add(:datacentre) do
    setcode do
        if Facter.value(:trusted)['extensions']['pp_datacenter'] != undef
          datacentre = Facter.value(:trusted)['extensions']['pp_datacenter'].downcase
        else
          'none-set'
        end
    end
  end
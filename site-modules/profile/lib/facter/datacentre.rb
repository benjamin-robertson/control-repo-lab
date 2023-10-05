Facter.add(:datacentre) do
  setcode do
    begin
      if Facter.value(:trusted)['extensions']['pp_datacenter'] != nil
       datacentre = Facter.value(:trusted)['extensions']['pp_datacenter'].downcase
      else
       'none-set'
      end
    rescue
      'none-set'
    end
  end
end
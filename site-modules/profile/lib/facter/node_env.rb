Facter.add(:node_env) do
  setcode do
    case Factor.value('hostname')
      when /^.*-prd[0-9]{2}/
        environment = 'production'
      when /^.*-dev[0-9]{2}/
        environment = 'development'
      else
        environment = 'none'
    end
    environment
  end
end
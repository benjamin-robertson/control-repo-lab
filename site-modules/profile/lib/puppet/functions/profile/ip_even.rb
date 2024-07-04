# frozen_string_literal: true

# Check if ip address even.
Puppet::Functions.create_function(:"profile::ip_even") do
  # @param applocker_rules Applocker rules to check from Puppet catalog
  # @param name_to_id Name to ID mapping to check.
  # @return [Hash] Hash with rulename to rule mapping.
  dispatch :ip_even do
    param 'String', :ip_address
    return_type 'Boolean'
  end
  # the function below is called by puppet and and must match
  # the name of the puppet function above. You can set your
  # required parameters below and puppet will enforce these
  # so change x to suit your needs although only one parameter is required
  # as defined in the dispatch method.
  def ip_even(ip_address)
    last = ip_address.split('.')
    # check if last element is even
    last[3].to_i.even?
  end

  # you can define other helper methods in this code block as well
end

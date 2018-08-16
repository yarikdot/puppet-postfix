Facter.add(:postfix_multi_instance_directories) do
  setcode do
    Pathname.glob("/etc/postfix-*/main.cf").map { |i| i.dirname }
  end
end

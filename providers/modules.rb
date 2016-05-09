action :activate do
  directory "#{new_resource.install_dir}/enabled/"

  removed = Dir.glob("#{new_resource.install_dir}/enabled/*.bash").map do |f|
    ::File.basename(f, ".#{new_resource.type}.bash")
  end - new_resource.items

  removed.map! do |script|
    link "#{new_resource.install_dir}/enabled/#{script}.#{new_resource.type}.bash" do
      action :delete
    end.updated_by_last_action?
  end

  added = new_resource.items.map do |script|
    link "#{new_resource.install_dir}/enabled/#{script}.#{new_resource.type}.bash" do
      to "#{new_resource.install_dir}/available/#{script}.#{new_resource.type}.bash"
    end.updated_by_last_action?
  end

  new_resource.updated_by_last_action(removed.concat(added).any?)
end

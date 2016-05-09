actions :activate

default_action :activate

attribute :name,           kind_of: String, name_attribute: true
attribute :install_dir,    kind_of: String
attribute :type,           kind_of: String
attribute :items,          kind_of: Array

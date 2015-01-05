# infrataster-plugin-chef

This is a plugin that works with https://github.com/ryotarai/infrataster and https://github.com/opscode/chef-provisioning under Vagrant to extend the `Infrataster::Server` object to contain Chef node data

# Usage

Within your `spec_helper.rb` instead of using `Infrataster::Server.define` use the new `Infrataster::ChefServer` class instead as shown below

```ruby
Infrataster::ChefServer.define(
  "testserver",
  "192.168.39.20",
  chefnode: "prov/repo/nodes/testserver.json",
  vagrant: true
)
```

`chefnode` is a new argument that provides the path to a JSON file that represents the chef node. When using chef-provisioning to create servers this is usually created by chef-provisioning within your existing local repository

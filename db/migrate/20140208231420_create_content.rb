class CreateContent < ActiveRecord::Migration
  def up
    map = Map.create lat:52.8382,
      lng: -2.327815,
      zoom: 10,
      address: "St Cuthman's Church<br/>Whitehawk Way<br/>Whitehawk<br/>BN2 5HE",
      tel:"01273 555555"
    Widget.create page: Page.find_by_slug("about"),
      slot:'bottom',
      resource_type: Map.to_s,
      resource_id: map.id
  end
end

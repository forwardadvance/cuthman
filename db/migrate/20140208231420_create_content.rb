class CreateContent < ActiveRecord::Migration
  def up

    # About Page

    article = Article.create title: '&ldquo;The Vision of St Cuthman’s alive in Brighton&rdquo;',
      intro: "We are delighted to welcome you to this great adventure",
      content: "We are delighted to welcome you to this great adventure - an Anglican church in new partnership with St Peter’s Brighton since November 2013. We are building a fun community in the heart of Whitehawk, with a vision to play our part in the re-evangelisation of the nations and the transformation of society. Feel free to join us at one of our two Sunday services.
If you would like to explore the meaning of life in an informal environment, we would love to invite you to join the next Alpha course.
We have Teams which are great places to connect and to see the vision of St Cuthman’s alive in Brighton. During the week we get together in Hubs - fortnightly gatherings of anything between 10-20 people, for food, friends, teaching, worship and prayer - the ideal way to feel like you belong.
For anything else, please check out the Facebook page, and don't hesitate to contact us"
    Widget.create page: Page.find_by_slug("about"),
      slot:'main',
      resource_type: Article.to_s,
      resource_id: article.id,
      sort:1

    map = Map.create lat:52.8382,
      lng: -2.327815,
      zoom: 10,
      address: "St Cuthman's Church<br/>Whitehawk Way<br/>Whitehawk<br/>BN2 5HE",
      tel:"01273 555555"
    Widget.create page: Page.find_by_slug("about"),
      slot:'main',
      resource_type: Map.to_s,
      resource_id: map.id,
      sort:2

  end
end

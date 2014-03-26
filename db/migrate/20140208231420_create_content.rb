class CreateContent < ActiveRecord::Migration
  def up

    # About Page

    about_page = Page.find_by_slug("about")
    article = Article.create title: 'The Vision of St Cuthman’s alive in Brighton',
      intro: "<p>We are delighted to welcome you to this great adventure</p>",
      content: "<p>We are delighted to welcome you to this great adventure - an Anglican church in new partnership with St Peter’s Brighton since November 2013. We are building a fun community in the heart of Whitehawk, with a vision to play our part in the re-evangelisation of the nations and the transformation of society. Feel free to join us at one of our two Sunday services.</p>
<p>If you would like to explore the meaning of life in an informal environment, we would love to invite you to join the next Alpha course.</p>
<p>We have Teams which are great places to connect and to see the vision of St Cuthman’s alive in Brighton. During the week we get together in Hubs - fortnightly gatherings of anything between 10-20 people, for food, friends, teaching, worship and prayer - the ideal way to feel like you belong.</p>
<p>For anything else, please check out the Facebook page, and don't hesitate to contact us.</p>"
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
    Widget.create page: about_page,
      slot:'main',
      resource_type: Map.to_s,
      resource_id: map.id,
      sort:2


    # Services
    @page = Page.new slug:"sunday", template:"article"

    article = Article.create title: "Sunday services"
      intro:"Services take place every Sunday at 9:00 and 11:00",
      content:"<p>9am-Holy Communion</p>
<p>The Eleven-Informal service with café (including groups for children)</p>
<p>We’d love you to join us for the café at 11am before our service starts at 11.30. It’s a great opportunity to meet new friends, catch up with old friends and hear about what’s happening at St Cuthman’s.</p>
<p>Our Sunday services are about making friends, worshipping God freely, hearing a short life impacting talk (hopefully!)and praying for any needs people may have.</p>"

  end
end

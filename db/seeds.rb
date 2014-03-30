# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

root = Page.root

# About Page
about = Article.create title: 'About',
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/skating.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/skating.jpg",
  intro: "<p>We are delighted to welcome you to this great adventure</p>",
  content: "<p>We are delighted to welcome you to this great adventure - an Anglican church in new partnership with St Peter’s Brighton since November 2013. We are building a fun community in the heart of Whitehawk, with a vision to play our part in the re-evangelisation of the nations and the transformation of society. Feel free to join us at one of our two Sunday services.</p>
<p>If you would like to explore the meaning of life in an informal environment, we would love to invite you to join the next Alpha course.</p>
<p>We have Teams which are great places to connect and to see the vision of St Cuthman’s alive in Brighton. During the week we get together in Hubs - fortnightly gatherings of anything between 10-20 people, for food, friends, teaching, worship and prayer - the ideal way to feel like you belong.</p>
<p>For anything else, please check out the Facebook page, and don't hesitate to contact us.</p>",
  parent_page_id: root.id


# Services
Article.create title: "Sunday services",
  parent_page_id: about.page.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/bench.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/bench.jpg",
  intro:"<p>Services take place every Sunday at 9:00 and 11:00</p>",
  content:"<p>Services take place every Sunday at 9:00 and 11:00</p>
  <p>9am-Holy Communion</p>
<p>The Eleven-Informal service with café (including groups for children)</p>
<p>We’d love you to join us for the café at 11am before our service starts at 11.30. It’s a great opportunity to meet new friends, catch up with old friends and hear about what’s happening at St Cuthman’s.</p>
<p>Our Sunday services are about making friends, worshipping God freely, hearing a short life impacting talk (hopefully!)and praying for any needs people may have.</p>"


Article.create title: "Alpha",
  parent_page_id: about.page.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/alpha.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/alpha.jpg",
  intro:"<p>If you would like to explore the meaning of life in an informal environment, we would love to invite you to join the next Alpha course.</p>",
  content:"<p>If you would like to explore the meaning of life in an informal environment, we would love to invite you to join the next Alpha course.</p>
  <p>The Alpha course, is an opportunity for anyone to explore the Christian faith. It’s relaxed, low key and friendly. Alpha is for everyone; no question is out of bounds and you are free to discuss as much or as little as you wish</p>
<p>Each week we have dinner together, listen to a short talk and then have a discussion in a small group. The next Alpha course is starting on Wednesday 5th February 2014 and will be running every Wednesday from 7-9pm for 7 weeks. Come along to the first session and see what you think.</p>"


Article.create title: "Kids church",
  parent_page_id: about.page.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/kids.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/kids.jpg",
  intro:"<p>Our vision is that Sunday mornings at the Eleven will be the best hour of every child’s week! We want children to know the truths about God and his kingdom, to encounter Jesus and be transformed! We hope the kids will love their groups and make great friendships.</p>",
  content:"<p>Our vision is that Sunday mornings at the Eleven will be the best hour of every child’s week! We want children to know the truths about God and his kingdom, to encounter Jesus and be transformed! We hope the kids will love their groups and make great friendships.</p>
  <p>Our children’s groups are currently divided into two:</p>
<p>0 – 7’s We have a room full of toys, story time/craft session, lunchtime snack and a very capable team to look after all the children’s needs. Parents of younger children are welcome to stay, or go into the main service and we’ll text you if your little one needs you!</p>
<p>8 - 11’s Games, discussion, craft, Bible sound-bite</p>"


Article.create title: "Hubs",
  parent_page_id: about.page.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/hubs.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/hubs.jpg",
  intro:"<p>We see St Cuthman’s Church as more than a Sunday service.  We want to live life together and help one another whilst serving our community.  Hubs are our fortnightly gatherings of friends, fun, worship, discussion, prayer and are one of the best ways to meet people and feel connected.</p>",
  content:"<p>We see St Cuthman’s Church as more than a Sunday service.  We want to live life together and help one another whilst serving our community.  Hubs are our fortnightly gatherings of friends, fun, worship, discussion, prayer and are one of the best ways to meet people and feel connected.</p>
  <p>To join a Hub or just find out more please visit the welcome desk on a Sunday or email richandcathstcuthmans@gmail.com</p>"


Article.create title: "Safehaven Women",
  parent_page_id: about.page.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/safehaven.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/safehaven.jpg",
  intro:"<p>Coming Soon!</p><p>Every Monday 12-2pm during term time. Safehaven Women offers a cosy, comfortable space to relax in, with homemade meals, tea and coffee, hairdressing, manicures and pedicures, facials, craft sessions and a clothing bank. </p>",
  content:"<p>Coming Soon!</p><p>Every Monday 12-2pm during term time. Safehaven Women offers a cosy, comfortable space to relax in, with homemade meals, tea and coffee, hairdressing, manicures and pedicures, facials, craft sessions and a clothing bank. </p>
  <p>This is a safe place for vulnerable women to come together and hang out, to chat and to be listened to over a cup of tea and a piece of cake.</p>"


# News
Article.create title: "News",
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/table.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/table.jpg",
  parent_page_id: root.id,
  intro:"<p>Upcoming news and events at St Cuthmans.</p>",
  content:"<p>Upcoming news and events at St Cuthmans.</p>
  <h2>The Tabletop Sale</h2>
<p>We have a Table Top and Jumble sale on the last Saturday of everything month (except December). We have lots of new and used items to sell. We hope you'll find some useful bargains. A light lunch and refreshments are available.</p>
<p>The next sale will be on 22nd February 2014 10:30-12pm.</p>
<p>You can hire a table and sell your own items for £5. Please contact Jan for information on how you can help with the set up and selling.!</p>"

# Media
Article.create title: "Media",
  parent_page_id: root.id,
  image_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/media.jpg",
  banner_upload_url:"http://st-cuthmans.s3.amazonaws.com/seed/media.jpg",
  intro:"<p>Media coming soon</p>",
  content:"<p>Media page coming soon.</p>"







map = Map.create lat:50.828385,
  lng: -0.105103,
  zoom: 10,
  address: "St Cuthman's Church<br/>Whitehawk Way<br/>Whitehawk<br/>BN2 5HE",
  tel:"01273 555555"
Widget.create page: about.page,
  slot:'bottom_right',
  resource_type: Map.to_s,
  resource_id: map.id,
  sort:2

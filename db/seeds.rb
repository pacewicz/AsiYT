# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_one = User.create({nick: "Andrzej", email: "andrzej@gmail.com", password: "test"})
user_one.playlists.create({:name => "fromseeds"})
user_one.playlists.first.clips.create({yt_id: "o-5-B11Gc2U", title: "Chillstep - CMYK - Yellow Chillstep Mix - by Ideal Noise (2 HOUR MIX)", thumbnail: "https://i1.ytimg.com/vi_webp/o-5-B11Gc2U/mqdefault.webp"})
user_one.playlists.first.clips.create({yt_id: "QnhPMdIsOBc", title: "Neosignal - Planet Online (Official Video) ", thumbnail: "https://i1.ytimg.com/vi/QnhPMdIsOBc/mqdefault.jpg"})
user_one.playlists.create({:name => "fromseeds_too"})
user_one.playlists.last.clips.create({yt_id: "IddDWBpkzYg", title: "Eskmo - Cloudlight (Official Video) HD", thumbnail: "https://i1.ytimg.com/vi/IddDWBpkzYg/mqdefault.jpg"})

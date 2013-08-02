User.destroy_all

u1 = User.create(first_name:'Britney Jo', last_name: 'Ludkowski', email: 'britneyjo.ludkowski@gmail.com', username: 'britjo', avatar: '', biography: 'Burgeoning web developer and houseplant assassin', location: 'Austin', role: 'admin', password:'password', password_confirmation:'password' )
u2 = User.create(first_name:'Julien', last_name: 'Deslangles-Blanch', email: 'julien@deslangles.com', username: 'jdeslangles', avatar: 'http://m.c.lnkd.licdn.com/media/p/1/000/219/134/330764f.jpg', biography: 'Chinese-Speaking, Frenchman with a love/hate relationship with Haml', location: 'London', role: 'admin', password:'password', password_confirmation:'password'  )
u3 = User.create(first_name:'Anna', last_name: 'Hendre', email: 'hendrannah@gmail.com', username: 'hendranna', avatar: 'https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-ash4/65209_10200980814715040_1935773394_n.jpg', biography: 'Ruby enthusiast and serious cat lover', location: 'Montegrotto Terme', role: 'admin', password:'password', password_confirmation:'password'  )

Album.destroy_all
a1 = Album.new(name:'Summer', description:'photos from the summer of 2013', privacy: 'false', user_id: u1.id)
a2 = Album.new(name:'Winter', description:'photos from the winter of 2011', privacy: 'false', user_id: u2.id)
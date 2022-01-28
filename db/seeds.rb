Film.delete_all
Actor.delete_all
Rating.delete_all
Watchlater.delete_all
Viewed.delete_all
User.delete_all

desc = 'Fight Club is a 1999 American film directed by David Fincher and starring Brad Pitt,
 Edward Norton, and Helena Bonham Carter. It is based on the 1996 novel
 of the same name by Chuck Palahniuk. Norton plays the unnamed narrator,
 who is discontented with his white-collar job. He forms a "fight club"
 with soap salesman Tyler Durden (Pitt), and becomes embroiled in a
 relationship with a destitute woman, Marla Singer (Bonham Carter).'

film = Film.create({
                     name: 'Fight Club',
                     description: desc,
                     release_date: '1999.10.09',
                     image_url: '/assets/Fight_Club_poster.jpg',
                     genre: 'Drama',
                     director: 'David Fincher',
                     rating: '16+',
                     trailer: 'https://www.youtube.com/embed/qtRKdVHc-cE'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'An unnamed Driver works as a mechanic, a stunt double, a stunt driver,
and a criminal-for-hire getaway car driver in Los Angeles, California. His
jobs are all managed by auto shop owner Shannon, who persuades Jewish
mobster Bernie Rose and his half-Italian partner Nino "Izzy" Paolozzi to
purchase a car for the Driver to race. The Driver meets his new neighbor,
Irene, and grows close to her and her young son, Benicio.'

film = Film.create({
                     name: 'Drive',
                     description: desc,
                     release_date: '2011.05.20',
                     image_url: '/assets/Drive2011Poster.jpg',
                     genre: 'Drama',
                     director: 'Nicolas Winding Refn',
                     rating: '16+',
                     trailer: 'https://www.youtube.com/embed/KBiOF3y1W0Y'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'In an alternate 1982, a giant extraterrestrial spaceship arrives
at Earth and hovers over the South African city of Johannesburg. A human
investigation team finds over one million malnourished aliens (derogatorily
   called "Prawns") inside, and the South African government relocates them
   to a terrestrial camp called District 9. However, over the years it turns
    into a slum, and locals from Earth often complain that the aliens are filthy.'

film = Film.create({
                     name: 'District 9',
                     description: desc,
                     release_date: '2009.08.13',
                     image_url: '/assets/District_nine_ver2.jpg',
                     genre: 'Science',
                     director: 'Neill Blomkamp',
                     rating: '16+',
                     trailer: 'https://www.youtube.com/embed/DyLUwOcR5pk'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'Research scientist Galen Erso and his family are in hiding on the planet
Lah\'mu when Imperial weapons developer Orson Krennic arrives to press him into
completing the Death Star, a space station-based superweapon capable of destroying
entire planets. Galen\'s wife, Lyra, is killed in the confrontation while their daughter,
Jyn, escapes and is rescued by rebel extremist Saw Gerrera.Fifteen years later, cargo pilot
Bodhi Rook defects from the Empire.'

film = Film.create({
                     name: 'Rogue One',
                     description: desc,
                     release_date: '2016.12.31',
                     image_url: '/assets/Rogue_One_poster.png',
                     genre: 'Space opera',
                     director: 'Gareth Edwards',
                     rating: '6+',
                     trailer: 'https://www.youtube.com/embed/frdj1zb9sMY'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'The McCallister family is preparing to spend Christmas in Miami, and gathers at
Peter and Kate\'s Chicago home. Their youngest son, Kevin, sees Florida as contradictory
 to Christmas, due to its lack of snow and Christmas trees. At a school pageant,
  during Kevin\'s solo, his brother, Buzz, pulls a prank on him, and Kevin retaliates
   by pushing him, ruining the pageant. Buzz makes a fauxpology, which the family accepts,
    berating Kevin when he says he retaliated for Buzz humiliating him.'

film = Film.create({
                     name: 'Home Alone 2: Lost in New York',
                     description: desc,
                     release_date: '1992.11.20',
                     image_url: '/assets/Home_Alone_2.jpg',
                     genre: 'Comedy',
                     director: 'Chris Columbus',
                     rating: '0+',
                     trailer: 'https://www.youtube.com/embed/5h9VDUNtoto'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'In 1884 Arizona, Dan Evans is an impoverished rancher and Civil War veteran, who
owes money to the wealthy Glen Hollander. One night, two of Hollander\'s men set fire
to his barn and scare off his cattle, warning that his house will be next if
he fails to pay his debts. The next morning, as Evans and his two sons,
William and Mark, look for their lost herd, they stumble upon outlaw Ben
Wade and his gang, who have used Evans\' cattle to block the road.'

film = Film.create({
                     name: '3:10 to Yuma',
                     description: desc,
                     release_date: '2007.08.21',
                     image_url: '/assets/310_to_Yuma_(2007_film).jpg',
                     genre: 'Western',
                     director: 'James Mangold',
                     rating: '18+',
                     trailer: 'https://www.youtube.com/embed/jX1m45CwvJ8'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'In the fictional town of Ebbing, Missouri, Mildred Hayes is grieving over the
rape and murder of her teenage daughter, Angela, seven months earlier. Angry over the
lack of progress in the investigation, Mildred rents three disused billboards near her
home and posts on them: "Raped While Dying", "And Still No Arrests?", and "How Come,
Chief Willoughby?".The billboards upset many townspeople, including Chief Bill Willoughby
and a racist, alcoholic police officer Jason Dixon.'

film = Film.create({
                     name: 'Three Billboards Outside Ebbing, Missouri',
                     description: desc,
                     release_date: '2017.09.10',
                     image_url: '/assets/Three_Billboards_Outside_Ebbing,_Missouri_poster.png',
                     genre: 'Crime',
                     director: 'Martin McDonagh',
                     rating: '14+',
                     trailer: 'https://www.youtube.com/embed/Jit3YhGx5pU'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

desc = 'Joe is a traumatized hired gun who specializes in rescuing trafficked girls,
using brutal methods against their captors. He cares for his elderly mother in his
childhood home in New York City. Joe has flashbacks of the abuse he and his
mother faced from his violent father, and his brutal past in the military and
FBI, and is troubled by suicidal thoughts.As he comes home one night, Joe is seen by Moises,
the son of Angel who acts as middleman between Joe and his handler John McCleary.'

film = Film.create({
                     name: 'You Were Never Really Here',
                     description: desc,
                     release_date: '2017.05.27',
                     image_url: '/assets/images.jpg',
                     genre: 'Crime',
                     director: 'Lynne Ramsay',
                     rating: '18+',
                     trailer: 'https://www.youtube.com/embed/R8oYYg75Qvg'
                   })

film.actors.create({ name: 'Brad Pitt', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Edward Norton', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Meat Loaf', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Jared Leto', image_url: '/assets/actors/2.jpg' })
film.actors.create({ name: 'Helena Carter', image_url: '/assets/actors/1.jpg' })
film.actors.create({ name: 'Holt McCallany', image_url: '/assets/actors/2.jpg' })

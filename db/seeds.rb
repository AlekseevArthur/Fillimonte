desc = 'Fight Club is a 1999 American film directed by David Fincher and starring Brad Pitt,
 Edward Norton, and Helena Bonham Carter. It is based on the 1996 novel
 of the same name by Chuck Palahniuk. Norton plays the unnamed narrator,
 who is discontented with his white-collar job. He forms a "fight club"
 with soap salesman Tyler Durden (Pitt), and becomes embroiled in a
 relationship with a destitute woman, Marla Singer (Bonham Carter).'
Film.delete_all
Actor.delete_all

film1 = Film.create({
                      name: 'Fight Club',
                      description: desc,
                      release_date: '1999.10.09',
                      image_url: '/assets/Fight_Club_poster.jpg',
                      genre: 'drama',
                      director: 'David Fincher',
                      rating: '16+',
                      trailer: 'https://www.youtube.com/embed/qtRKdVHc-cE'
                    })

desc = 'An unnamed Driver works as a mechanic, a stunt double, a stunt driver,
and a criminal-for-hire getaway car driver in Los Angeles, California. His
jobs are all managed by auto shop owner Shannon, who persuades Jewish
mobster Bernie Rose and his half-Italian partner Nino "Izzy" Paolozzi to
purchase a car for the Driver to race. The Driver meets his new neighbor,
Irene, and grows close to her and her young son, Benicio.'

Film.create({
              name: 'Drive',
              description: desc,
              release_date: '2011.05.20',
              image_url: '/assets/Drive2011Poster.jpg',
              genre: 'drama',
              director: 'Nicolas Winding Refn',
              rating: '16+',
              trailer: 'https://www.youtube.com/embed/KBiOF3y1W0Y'
            })

desc = 'In an alternate 1982, a giant extraterrestrial spaceship arrives
at Earth and hovers over the South African city of Johannesburg. A human
investigation team finds over one million malnourished aliens (derogatorily
   called "Prawns") inside, and the South African government relocates them
   to a terrestrial camp called District 9. However, over the years it turns
    into a slum, and locals from Earth often complain that the aliens are filthy.'

Film.create({
              name: 'District 9',
              description: desc,
              release_date: '2009.08.13',
              image_url: '/assets/District_nine_ver2.jpg',
              genre: 'science',
              director: 'Neill Blomkamp',
              rating: '16+',
              trailer: 'https://www.youtube.com/embed/DyLUwOcR5pk'
            })

desc = 'Research scientist Galen Erso and his family are in hiding on the planet
Lah\'mu when Imperial weapons developer Orson Krennic arrives to press him into
completing the Death Star, a space station-based superweapon capable of destroying
entire planets. Galen\'s wife, Lyra, is killed in the confrontation while their daughter,
Jyn, escapes and is rescued by rebel extremist Saw Gerrera.Fifteen years later, cargo pilot
Bodhi Rook defects from the Empire.'

Film.create({
              name: 'Rogue One',
              description: desc,
              release_date: '2016.12.31',
              image_url: '/assets/Rogue_One_poster.png',
              genre: 'space opera',
              director: 'Gareth Edwards',
              rating: '6+',
              trailer: 'https://www.youtube.com/embed/frdj1zb9sMY'
            })

film1.actors.create({ name: 'Toyla diordoen', image_url: '/assets/actors/1.jpg' })
film1.actors.create({ name: '11111 1111111', image_url: '/assets/actors/2.jpg' })
film1.actors.create({ name: '22222 222222', image_url: '/assets/actors/1.jpg' })
film1.actors.create({ name: '333333', image_url: '/assets/actors/2.jpg' })
film1.actors.create({ name: '555555', image_url: '/assets/actors/1.jpg' })
film1.actors.create({ name: '44444444', image_url: '/assets/actors/2.jpg' })

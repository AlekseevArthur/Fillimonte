desc = 'Fight Club is a 1999 American film directed by David Fincher and starring Brad Pitt,
 Edward Norton, and Helena Bonham Carter. It is based on the 1996 novel
 of the same name by Chuck Palahniuk. Norton plays the unnamed narrator,
 who is discontented with his white-collar job. He forms a "fight club"
 with soap salesman Tyler Durden (Pitt), and becomes embroiled in a
 relationship with a destitute woman, Marla Singer (Bonham Carter).'
Film.delete_all
Film.create({
              name: 'Fight Club',
              description: desc,
              release_date: '1999.10.09',
              image_url: 'assets/Fight_Club_poster.jpg',
              genre: 'drama',
              director: 'David Fincher',
              rating: '16+',
              trailer: 'https://www.youtube.com/embed/qtRKdVHc-cE'
            })

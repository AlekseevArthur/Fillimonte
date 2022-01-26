import React from 'react'
import { Card, Container, Nav } from 'react-bootstrap'

const FilmCard = ({ film }) => {
  return (
    <Container>
      <Card className='film-card' border='primary' style={{ width: '18rem' }}>
        <Nav.Link style={{ color: 'black' }} href={`/films/${film.id}`}>
          <Card.Img style={{ maxHeight: '18rem' }} variant='top' src={film.image_url} />
          <Card.Body>
            <Card.Title>
              {CutOverflow(film.name, 20)}
            </Card.Title>
            <Card.Text>
            {film.genre}

            </Card.Text>
            <Card.Text>
              {CutOverflow(film.description, 160)}
            </Card.Text>
          </Card.Body>
        </Nav.Link>
      </Card>
    </Container>
  )
}

const CutOverflow = (text, length) =>
  text.length + 3 >= length
    ? `${text.slice(0, length)}...`
    : text

export default FilmCard

import React from 'react'
import { Card, Nav } from 'react-bootstrap'

const FilmCard = ({ film }) => {
  return (
    <Nav.Link style={{ color: 'black' }} href={`/films/${film.id}`}>
      <Card border='primary' style={{ width: '18rem' }}>
        <Card.Img style={{ maxHeight: '18rem' }} variant='top' src={film.image_url} />
        <Card.Body>
          <Card.Title>
            {CutOverflow(film.name, 24)}
          </Card.Title>
          <Card.Text>
            {CutOverflow(film.description, 185)}
          </Card.Text>
        </Card.Body>
      </Card>
    </Nav.Link>
  )
}

const CutOverflow = (text, length) =>
  text.length + 3 >= length
    ? `${text.slice(0, length)}...`
    : text

export default FilmCard

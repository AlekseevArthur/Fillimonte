import React from 'react'
import { Card, Nav } from 'react-bootstrap'

const FilmCard = ({ film }) => {
  return (
    <Nav.Link style={{ color: 'black' }} href={`/films/${film.id}`}>
      <Card border="primary" style={{ width: '18rem' }}>
        <Card.Img style={{ maxHeight: '18rem' }} variant="top" src={film.image_url} />
        <Card.Body>
          <Card.Title>{film.name}</Card.Title>
          <Card.Text>
            {CutOverflow(film.description)}
          </Card.Text>
        </Card.Body>
      </Card>
    </Nav.Link>
  )
}

const CutOverflow = (text) => `${text.slice(0, 200)}...`

export default FilmCard

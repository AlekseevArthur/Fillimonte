import React from 'react'
import { Card, Container, Nav, Button } from 'react-bootstrap'
import { BookmarkFill, EyeFill } from 'react-bootstrap-icons';

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
              {CutOverflow(film.description, 100)}
            </Card.Text>
            <Card.Text>
              <Button>
                <EyeFill />
              </Button>
              <Button variant="info">
                <BookmarkFill />
              </Button>
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
